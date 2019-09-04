//
//  TimeSlotListViewModel.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 20/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

class TimeSlotViewModel {
  private let originalModel: SlotApiModel
  let displayText: String

  init(model: SlotApiModel) {
    self.originalModel = model
    self.displayText = self.originalModel.htext
  }

  var isAfterNoon: Bool {
    return self.originalModel.isAfterNoon
  }
}

protocol TimeSlotListViewModelDelegate: class {
	func reloadSlots()
}

extension TimeSlotListViewModel.DayPeriod {
  static func == (lhs: TimeSlotListViewModel.DayPeriod, rhs: TimeSlotListViewModel.DayPeriod) -> Bool {
    switch (lhs, rhs) {
    case (.morning, .morning):
      return true
    case (.afternoon, .afternoon):
      return true
    case (.morning, .afternoon):
      return false
    case (.afternoon, .morning):
      return false
    }
  }
}

class TimeSlotListViewModel {

  enum DayPeriod: Equatable {
    case morning(periodName: String)
    case afternoon(periodName: String)

    var isMorning: Bool {
      switch self {
      case .morning(periodName: _):
        return true
      case .afternoon(periodName: _):
        return false
      }
    }

    var isAfternoon: Bool {
      switch self {
      case .morning(periodName: _):
        return false
      case .afternoon(periodName: _):
        return true
      }
    }

  }

  enum DisplayState {
    case notReady
    case timeSlot(day: DayViewModel, period: DayPeriod)
    case timeSlotEmpty(previousDayWithSlot: DayViewModel?, nextDayWithSlot: DayViewModel?)

    var segmentedControllPeriodIndex: Int {
      switch self {
      case .timeSlot(day: _, period: let period):
        switch period {
        case .morning:
          return 0
        case .afternoon:
          return 1
        }
      case .notReady:
        return 0
      case .timeSlotEmpty:
        return 0
      }
    }
    
    var slotCount: Int {
      switch self {
      case .notReady:
        return 0
      case .timeSlot(day: let day, period: let period):
        switch period {
        case .afternoon:
          return day.afterNoonSlots.count
        case .morning:
          return day.moringSlots.count
        }
      case .timeSlotEmpty:
        return 0
      }
    }
    

    subscript(index: Int) -> TimeSlotViewModel? {
      switch self {
      case .timeSlot(day: let day, period: let timePeriod):
        switch timePeriod {
        case .morning:
          if index >= 0 && index < day.moringSlots.count {
            return day.moringSlots[index]
          } else { return nil }
        case .afternoon:
          if index >= 0 && index < day.afterNoonSlots.count {
            return day.afterNoonSlots[index]
          } else { return nil }
        }
      case .timeSlotEmpty:
        return nil
      case .notReady:
        return nil
      }
    }

  }

  let dataController: CalendarDataController

  weak var delegate: TimeSlotListViewModelDelegate?

  var shouldDisplaySpinner: Observable<Bool> = Observable<Bool>(true)
  var shouldDisplaySLots: Observable<Bool> = Observable<Bool>(true)
  var shouldDisplayNoSlotView: Observable<Bool> = Observable<Bool>(false)
  
  var segmentedControlIndexToDisplay: Observable<Int> = Observable<Int>(0)

  private var displayState: DisplayState {
    didSet {
      self.updateObservableFromDisplayState(self.displayState)
      }
    }

  var moringPeriod: DayPeriod {
    return .morning(periodName: self.dataController.morningName)
  }

  var afterNoonPeriod: DayPeriod {
    return .afternoon(periodName: self.dataController.afterNoonName)
  }
  
  var lastPeriod: DayPeriod? = nil

  private func updateObservableFromDisplayState(_ displayState: DisplayState) {
    switch displayState {
    case .timeSlot:
      if self.shouldDisplaySpinner.value == true {
        self.shouldDisplaySpinner.value = false
      }

      if self.shouldDisplaySLots.value == false {
        self.shouldDisplaySLots.value = true
      }

      if self.shouldDisplayNoSlotView.value == true {
        self.shouldDisplayNoSlotView.value = false
      }
      
      if self.segmentedControlIndexToDisplay.value != displayState.segmentedControllPeriodIndex {
        self.segmentedControlIndexToDisplay.value = displayState.segmentedControllPeriodIndex
      }
      

    case .timeSlotEmpty(previousDayWithSlot: _, nextDayWithSlot: _):
      if self.shouldDisplaySLots.value == true {
        self.shouldDisplaySLots.value = false
      }

      if self.shouldDisplaySpinner.value == true {
        self.shouldDisplaySpinner.value = false
      }

      if self.shouldDisplayNoSlotView.value == true {
        self.shouldDisplayNoSlotView.value = false
      }

    case .notReady:
      if self.shouldDisplayNoSlotView.value == true {
        self.shouldDisplayNoSlotView.value = false
      }
      if self.shouldDisplaySLots.value == true {
        self.shouldDisplaySLots.value = false
      }

      if self.shouldDisplaySpinner.value == false {
        self.shouldDisplaySpinner.value = true
      }
    }
  }

  private func setupDataController() {
    self.dataController.selectedDay.bind { [weak self] _, index in
      guard let `self` = self else { return }
      
      guard let day = self.dataController.dayModel else { return }
      let dayViewModel = DayViewModel(model: day, dataController: self.dataController)
      
      guard dayViewModel.noSlotAlviable == false else {
        self.displayState = .timeSlotEmpty(previousDayWithSlot: nil, nextDayWithSlot: nil)
        self.delegate?.reloadSlots()
        return
      }
      
      switch self.displayState {
      case .timeSlot(day: let currentDay, period: let period):
        if dayViewModel != currentDay {
          self.displayState = .timeSlot(day: dayViewModel, period: period)
          self.delegate?.reloadSlots()
        }
      case .timeSlotEmpty(_):
        self.displayState = .timeSlot(day: dayViewModel, period: self.moringPeriod)
        self.delegate?.reloadSlots()
      case .notReady:
        self.displayState = .timeSlot(day: dayViewModel, period: self.moringPeriod)
        self.delegate?.reloadSlots()
      }
    }
}

  init(dataController: CalendarDataController) {
    self.dataController = dataController
    self.displayState = .notReady
    self.setupDataController()
  }

  func userDidSelectCurrentDay(dayViewModel: DayViewModel) {
    self.displayState = .timeSlot(day: dayViewModel, period: self.moringPeriod)
  }

  func userDidSelectMoringPeriod() {
    switch self.displayState {
    case .timeSlot(day: let dayViewModel, period: let period):
      guard period.isMorning == false else { return }
      self.displayState = .timeSlot(day: dayViewModel, period: self.moringPeriod)
      self.delegate?.reloadSlots()
    case .notReady:
      return
    case .timeSlotEmpty:
      return
    }
  }

  func userDidSelectAfternoonPeriod() {
    switch self.displayState {
    case .timeSlot(day: let dayViewModel, period: let period):
      guard period.isAfternoon == false else { return }
      self.displayState = .timeSlot(day: dayViewModel, period: self.afterNoonPeriod)
      self.delegate?.reloadSlots()
    case .notReady:
      return
    case .timeSlotEmpty:
      return
    }
  }

  var itemCount: Int {
   return self.displayState.slotCount
  }

  var sectionCount: Int {
    switch self.displayState {
    case .notReady:
      return 1
    case .timeSlot:
      return 2
    case .timeSlotEmpty:
      return 2
    }
  }

  subscript(index: Int) -> TimeSlotViewModel? {
   return self.displayState[index]
  }
}

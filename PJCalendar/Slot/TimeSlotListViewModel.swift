//
//  TimeSlotListViewModel.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 20/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

extension TimeSlotViewModel {
  static func ==(lhr: TimeSlotViewModel, rhs: TimeSlotViewModel) -> Bool {
    return lhr.originalModel == rhs.originalModel
  }
}

class TimeSlotViewModel: Equatable {
  private let originalModel: SlotApiModel
  let displayText: String
  private (set) var isSelected = Observable<Bool>(false)
  let dataController: CalendarDataController

  init(model: SlotApiModel, dataController: CalendarDataController) {
    self.originalModel = model
    self.displayText = self.originalModel.htext
     self.dataController = dataController
  }

  func select() {
    if self.dataController.updateSelectedSlot(slot: self.originalModel) == true {
      self.isSelected.value = true
    }
  }
  
  func unSelect() {
    self.isSelected.value = false
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
    case timeSlot(day: DayViewModel, period: DayPeriod, slot: TimeSlotViewModel?)
    case timeSlotEmpty(previousDayWithSlot: DayViewModel?, nextDayWithSlot: DayViewModel?)

    
    var periode: DayPeriod? {
      switch self {
      case .notReady:
        return nil
      case .timeSlot(day: _, period: let period, slot: _):
        return period
      case .timeSlotEmpty(previousDayWithSlot: _, nextDayWithSlot: _):
        return nil
      }
    }
    
    var slotIndexInSelectedDayAndPeriod: Int? {
      switch self {
      case .timeSlot(day: let day, period: let period, slot: let slot):
        guard let slot = slot else { return nil }
        switch period {
        case .morning:
          guard let index = day.moringSlots.firstIndex(of: slot) else { return nil }
          return Int(index)
        case .afternoon:
          guard let index = day.afterNoonSlots.firstIndex(of: slot) else { return nil }
          return Int(index)
        }
      case .notReady:
        return nil
      case .timeSlotEmpty:
        return nil
      }
    }

    func slotForCurrrentDayAndPeriod(index: Int) -> TimeSlotViewModel? {
      switch self {
      case .timeSlot(day: let day, period: let period, slot: _):
        switch period {
        case .morning:
          guard index >= 0, index < day.moringSlots.count else { return nil }
          return day.moringSlots[index]
        case .afternoon:
          guard index >= 0, index < day.afterNoonSlots.count else { return nil }
          return day.afterNoonSlots[index]
        }
      case .notReady:
        return nil
      case .timeSlotEmpty:
        return nil
      }
    }

    var segmentedControllPeriodIndex: Int {
      switch self {
      case .timeSlot(day: _, period: let period, slot: _):
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
    
    var itemCount: Int {
      switch self {
      case .notReady:
        return 0
      case .timeSlot(day: let day, period: let period, slot:_):
        switch period {
        case .afternoon:
          return day.afterNoonSlots.count
        case .morning:
          return day.moringSlots.count
        }
      case .timeSlotEmpty:
        return 1
      }
    }
    

    subscript(index: Int) -> TimeSlotViewModel? {
      switch self {
      case .timeSlot(day: let day, period: let timePeriod, slot: _):
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
  var segmentedControlIndexToDisplay: Observable<Int> = Observable<Int>(0)

  private var displayState: DisplayState {
    didSet {
      self.updateObservableFromDisplayState(self.displayState)
      if let period = displayState.periode {
        self.lastPeriod = period
      }
    }
  }

  var moringPeriod: DayPeriod {
    return .morning(periodName: self.dataController.morningName)
  }

  var afterNoonPeriod: DayPeriod {
    return .afternoon(periodName: self.dataController.afterNoonName)
  }
  
  var lastPeriod: DayPeriod

  private func updateObservableFromDisplayState(_ displayState: DisplayState) {
    switch displayState {
    case .timeSlot:
      if self.segmentedControlIndexToDisplay.value != displayState.segmentedControllPeriodIndex {
        self.segmentedControlIndexToDisplay.value = displayState.segmentedControllPeriodIndex
      }
      
      
    case .timeSlotEmpty(previousDayWithSlot: _, nextDayWithSlot: _):
      break
    case .notReady:
      break
    }
  }

  private func setupDataController() {
    self.dataController.selectedDay.bind { [weak self] _, index in
      guard let `self` = self else { return }
      
      guard let day = self.dataController.selectedDayModel else { return }
      let dayViewModel = DayViewModel(model: day, dataController: self.dataController)
      
      guard dayViewModel.noSlotAlviable == false else {
        self.displayState = .timeSlotEmpty(previousDayWithSlot: dayViewModel.getFirstDayWithSlotBeforeThisDay(), nextDayWithSlot: dayViewModel.getNextDayWithSlotAfterThisDay())
        self.delegate?.reloadSlots()
        return
      }
      
      switch self.displayState {
      case .timeSlot(day: let currentDay, period: let period, slot: let slot):
        if dayViewModel != currentDay {
          self.displayState = .timeSlot(day: dayViewModel, period: period, slot: slot)
          self.delegate?.reloadSlots()
        }
        
      case .timeSlotEmpty(_):
        self.displayState = .timeSlot(day: dayViewModel, period: self.lastPeriod, slot: nil)
        self.delegate?.reloadSlots()
        
      case .notReady:
        self.displayState = .timeSlot(day: dayViewModel, period: self.lastPeriod, slot: nil)
        self.delegate?.reloadSlots()
      }
    }
    self.dataController.selectedSlot.bind { [weak self] _, index in
      guard let `self` = self else { return }
      switch self.displayState {
      case .notReady:
        return
      case .timeSlotEmpty(previousDayWithSlot: _, nextDayWithSlot: _):
        return
      case .timeSlot(day: let day, period: let period, slot: let slot):
        if let timeSlotModel = self.dataController.selectedSlotModel {
          let timeSlotViewModel = TimeSlotViewModel(model: timeSlotModel, dataController: self.dataController)
          if let slot = slot, slot != timeSlotViewModel {
            self.displayState = .timeSlot(day: day, period: period, slot: timeSlotViewModel)
          } else if slot == nil {
            self.displayState = .timeSlot(day: day, period: period, slot: timeSlotViewModel)
          }
        } else if slot != nil {
          self.displayState = .timeSlot(day: day, period: period, slot: nil)
        }
      }
    }
  }

  init(dataController: CalendarDataController) {
    self.dataController = dataController
    self.displayState = .notReady
    self.lastPeriod = .morning(periodName: dataController.morningName)
    self.setupDataController()
  }

  func userDidSelectSlot(slotIndexPath: IndexPath) {
    switch self.displayState {
    case .timeSlot:
      guard let slot = self.displayState.slotForCurrrentDayAndPeriod(index: slotIndexPath.item) else { return }
      slot.select()
    case .timeSlotEmpty:
      break
    case .notReady:
      break
    }
  }

  func userDidSelectMoringPeriod() {
    switch self.displayState {
    case .timeSlot(day: let dayViewModel, period: let period, slot: _):
      guard period.isMorning == false else { return }
      self.displayState = .timeSlot(day: dayViewModel, period: self.moringPeriod, slot: nil)
      self.delegate?.reloadSlots()
    case .notReady:
      return
    case .timeSlotEmpty:
      return
    }
  }

  func userDidSelectAfternoonPeriod() {
    switch self.displayState {
    case .timeSlot(day: let dayViewModel, period: let period, slot: _):
      guard period.isAfternoon == false else { return }
      self.displayState = .timeSlot(day: dayViewModel, period: self.afterNoonPeriod, slot: nil)
      self.delegate?.reloadSlots()
    case .notReady:
      return
    case .timeSlotEmpty:
      self.lastPeriod = self.afterNoonPeriod
    }
  }

  var itemCount: Int {
   return self.displayState.itemCount
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

  func isSelected(itemIndex: Int) -> Bool {
    guard let index = self.displayState.slotIndexInSelectedDayAndPeriod else { return false }
    return itemIndex == index
  }

  var shouldDisplayNoSlotCell: Bool {
    switch self.displayState {
    case .notReady:
      return false
    case .timeSlot:
      return false
    case .timeSlotEmpty:
      return true
    }
  }

  var noSlotModel: NoSlotCellViewModel? {
    switch self.displayState {
    case .notReady:
      return nil
    case .timeSlot:
      return nil
    case .timeSlotEmpty(previousDayWithSlot: let previousDay, nextDayWithSlot: let nextDay):
      return NoSlotCellViewModel(previousDay: previousDay, nextDay: nextDay, dataController: self.dataController)
    }
  }

  subscript(index: Int) -> TimeSlotViewModel? {
   return self.displayState[index]
  }
}

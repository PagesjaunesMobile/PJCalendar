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

    var slotCount: Int {
      switch self {
      case .notReady:
        return 0
      case .timeSlot(day: let day, period: let period):
        switch period {
        case .afternoon:
          return day.afterNoonSlots.count + 1
        case .morning:
          return day.moringSlots.count + 1
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
          if index - 1 >= 0 && index - 1 < day.moringSlots.count{
            return day.moringSlots[index - 1]
          } else { return nil }
        case .afternoon:
          if index - 1 >= 0 && index - 1 < day.afterNoonSlots.count {
            return day.afterNoonSlots[index - 1]
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

  private func updateObservableFromDisplayState(_ displayState: DisplayState) {
    switch displayState {
    case .timeSlot(day: _):
      if self.shouldDisplaySpinner.value == true {
        self.shouldDisplaySpinner.value = false
      }

      if self.shouldDisplaySLots.value == false {
        self.shouldDisplaySLots.value = true
      }

      if self.shouldDisplayNoSlotView.value == true {
        self.shouldDisplayNoSlotView.value = false
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
      let day = self.dataController.days.value[self.dataController.selectedDay.value]
      switch self.displayState {
      case .timeSlot(day: let currentDay, period: let period):
        if currentDay.representDay(day: day) == false {
          self.displayState = .timeSlot(day: DayViewModel(model: day, dataController: self.dataController), period: period)
          self.delegate?.reloadSlots()
        }
      case .timeSlotEmpty(_):
        self.displayState = .timeSlot(day: DayViewModel(model: day, dataController: self.dataController), period: self.moringPeriod)
        self.delegate?.reloadSlots()
      case .notReady:
        self.displayState = .timeSlot(day: DayViewModel(model: day, dataController: self.dataController), period: self.moringPeriod)
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

  var slotCount: Int {
   return self.displayState.slotCount
  }

  subscript(index: Int) -> TimeSlotViewModel? {
   return self.displayState[index]
  }

  func shouldDisplayHeaderSlotCellForIndexPath(_ indexPath: IndexPath) -> Bool {
    switch self.displayState {
    case .timeSlot:
      if indexPath.item == 0 {
        return true
      } else { return false }
    case .timeSlotEmpty:
      return false
    case .notReady:
      return false
    }
  }

}

//
//  DayListViewModel.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 20/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

extension DayViewModel{
  static func == (lhs: DayViewModel, rhs: DayViewModel) -> Bool {
    return lhs.originalModel == rhs.originalModel
  }
}


class DayViewModel: Equatable {

  private let originalModel: DayApiModel

  let dayOfTheWeek: String
  let dayNumber: String
  let dataController: CalendarDataController

  var slotsViewModel: [TimeSlotViewModel]

  init(model: DayApiModel, dataController: CalendarDataController) {
    self.originalModel = model
    self.dayOfTheWeek = "\(model.shortDayText)."
    self.dayNumber = model.dayNumberText
    self.slotsViewModel = self.originalModel.slots.map(TimeSlotViewModel.init)
    self.dataController = dataController
  }

  var moringSlots: [TimeSlotViewModel] {
    return self.slotsViewModel.filter { $0.isAfterNoon == false }
  }

  var afterNoonSlots: [TimeSlotViewModel] {
    return self.slotsViewModel.filter { $0.isAfterNoon == true }
  }
  
  var noSlotAlviable: Bool {
    return self.slotsViewModel.isEmpty
  }

  func userWantToShowSlotOfThisMonth() {
    self.dataController.updateSelectedDay(day: self.originalModel)
  }

  func representDay(day: DayApiModel) -> Bool {
    return day == self.originalModel
  }
}

class DayListViewModel {

  enum DisplayState {

    case notReady
    case daySelected(day: Int, days: [DayViewModel])

    init(days: [DayApiModel], selectedDay: Int = 0, dataController: CalendarDataController) {
      if days.isEmpty == true {
        self = .notReady
      } else {
        self = .daySelected(day: selectedDay, days: days.map { DayViewModel(model: $0, dataController: dataController) })
      }
    }
  }

  let dataController: CalendarDataController
  var displayState: DisplayState {
    didSet {
      self.updateObervableFromDisplaySate(state: self.displayState)
    }
  }

  var shouldDisplayDays: Observable<Bool> = Observable<Bool>(false)
  var shouldDisplaySpinner: Observable<Bool> = Observable<Bool>(false)
  var selectedIndexPath: Observable<IndexPath> = Observable<IndexPath>(IndexPath.init(row: 0, section: 0))

  var daysCount: Int {
    switch self.displayState {
    case .daySelected(day: _, days: let days):
      return days.count
    case .notReady:
      return 0
    }
  }

  subscript (index: IndexPath) -> DayViewModel? {
    switch self.displayState {
    case .daySelected(day: _, days: let days):
      guard index.item < days.count && index.item >= 0 else { return nil }
      return days[index.item]
    case .notReady:
      return nil
    }
  }

  func userSelectNewDay(indexPath: IndexPath) {
    switch self.displayState {
    case .daySelected(day: _, days: let days):
      if indexPath.item < days.count && indexPath.item >= 0 {
        days[indexPath.item].userWantToShowSlotOfThisMonth()
      }
    case .notReady:
      break
    }
  }

  func updateObervableFromDisplaySate(state: DisplayState) {
    switch state {
    case .daySelected(day: let selectedDay, days: _):
      if self.shouldDisplayDays.value == false {
        self.shouldDisplayDays.value = true
      }

      if self.shouldDisplaySpinner.value == true {
        self.shouldDisplaySpinner.value = false
      }

      if self.selectedIndexPath.value != IndexPath(item: selectedDay, section: 0) {
        self.selectedIndexPath.value = IndexPath(item: selectedDay, section: 0)
      }

    case .notReady:
      if self.shouldDisplayDays.value == true {
        self.shouldDisplayDays.value = false
      }

      if self.shouldDisplaySpinner.value == false {
        self.shouldDisplaySpinner.value = true
      }
    }
  }

  func setupDataController() {
    self.dataController.days.bind { [weak self] _, newModels in
      guard let `self` = self else { return }
      self.displayState = DisplayState(days: newModels, dataController: self.dataController)
    }

    self.dataController.selectedDay.bind { [weak self] _ , day in
      guard let `self` = self else { return }

      switch self.displayState {
      case .daySelected(day: _, days: let days):
        self.displayState = .daySelected(day: day, days: days)
      case .notReady:
        break
      }
    }

  }

  init(dataController: CalendarDataController) {
    self.dataController = dataController
    self.displayState = DisplayState(days: dataController.days.value, selectedDay: dataController.selectedDay.value, dataController: dataController)
    self.updateObervableFromDisplaySate(state: self.displayState)
    self.setupDataController()
  }

}

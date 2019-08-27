//
//  DayListViewModel.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 20/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

class DayViewModel {
  private let originalModel: RdvApiModel
  let dayOfTheWeek: String
  let dayNumber: String

  var slotsViewModel: [TimeSlotViewModel]

  init(model: RdvApiModel) {
    self.originalModel = model
    self.dayOfTheWeek = "\(model.shortDayText)."
    self.dayNumber = model.dayNumberText
    self.slotsViewModel = self.originalModel.slots.map(TimeSlotViewModel.init)
  }
}

class DayListViewModel {

  enum DisplayState {

    case notReady
    case daySelected(day: DayViewModel, days: [DayViewModel])

    init(days: [RdvApiModel]) {
      if days.isEmpty == true {
        self = .notReady
      } else {
        let days = days.map(DayViewModel.init)
        if let day = days.first {
          self = .daySelected(day: day, days: days)
        } else {
          self = .notReady
        }
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

  func updateObervableFromDisplaySate(state: DisplayState) {
    switch state {
    case .daySelected:
      self.shouldDisplayDays.value = true
      self.shouldDisplaySpinner.value = false
    case .notReady:
      self.shouldDisplayDays.value = false
      self.shouldDisplaySpinner.value = true
    }
  }

  func setupDataController() {
    self.dataController.days.bind { [weak self] _, newModels in
      guard let `self` = self else { return }
      self.displayState = DisplayState(days: newModels)
    }
  }

  init(dataController: CalendarDataController) {
    self.dataController = dataController
    self.displayState = DisplayState(days: dataController.days.value)
    self.updateObervableFromDisplaySate(state: self.displayState)
    self.setupDataController()
  }

}

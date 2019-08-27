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
  }

  let dataController: CalendarDataController
  let displayState: DisplayState

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

  init(dataController: CalendarDataController) {
    self.dataController = dataController
    if self.dataController.days.isEmpty == true {
      self.displayState = .notReady
    } else {
      let days = self.dataController.days.map(DayViewModel.init)
      if let day = days.first {
        self.displayState = .daySelected(day: day, days: days)
      } else {
        self.displayState = .notReady
      }
    }
  }

}

//
//  MonthListViewModel.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 20/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

class MonthViewModel {

  private let originalModel: RdvApiModel

  let monthText: String

  init(model: RdvApiModel) {
    self.originalModel = model
    self.monthText = model.monthText
  }
}

class MonthListViewModel {

  enum DisplayState {
    case notReady
    case monthSelected(monthSelected: MonthViewModel, months: [MonthViewModel])
  }

  let dataController: CalendarDataController
  let displayState: DisplayState

  var monthsCount: Int {
    switch self.displayState {
    case .monthSelected(monthSelected: _, months: let months):
      return months.count
    case .notReady:
      return 0
    }
  }

  subscript (index: IndexPath) -> MonthViewModel? {
    switch self.displayState {
    case .monthSelected(monthSelected: _, months: let months):
      guard index.item >= 0, index.item < months.count else { return nil }
      return months[index.item]
    case .notReady:
      return nil
    }
  }

  init(dataController: CalendarDataController) {
    self.dataController = dataController
    let months = self.dataController.days.value.map(MonthViewModel.init)
    if let first = months.first {
      self.displayState = .monthSelected(monthSelected: first, months: months)
    } else {
      self.displayState = .notReady
    }
  }
}

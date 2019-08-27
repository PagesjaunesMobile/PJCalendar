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
}

class TimeSlotListViewModel {

  enum DisplayState {
    case notReady
    case timeSlot(day: DayViewModel)
    case timeSlotEmpty(day: DayViewModel)
  }

  let dataController: CalendarDataController

  private var displayState: DisplayState

  init(dataController: CalendarDataController) {
    self.dataController = dataController
    self.displayState = .notReady
  }

  func userDidSelectCurrentDay(dayViewModel: DayViewModel) {
    self.displayState = .timeSlot(day: dayViewModel)
  }

  var slotCount: Int {
    switch self.displayState {
    case .timeSlot(day: let dayModel):
      return dayModel.slotsViewModel.count
    case .timeSlotEmpty(_):
      return 0
    case .notReady:
      return 0
    }
  }

  subscript(index: IndexPath) -> TimeSlotViewModel? {
    switch self.displayState {
    case .timeSlot(day: let dayModel):
      guard index.item >= 0 && index.item < dayModel.slotsViewModel.count else { return nil }
      return dayModel.slotsViewModel[index.item]
    case .notReady:
      return nil
    case .timeSlotEmpty:
      return nil
    }
  }


}

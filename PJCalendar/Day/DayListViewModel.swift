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
    self.dayOfTheWeek = model.shortDayText
    
    self.dayNumber = model.dayNumberText
    self.slotsViewModel = self.originalModel.slots.map { TimeSlotViewModel(model: $0, dataController: dataController) }
    self.dataController = dataController
    
    self.slotsViewModel.forEach { slot in
      slot.isSelected.bind(observer: { [weak self] _, isSelected in
        guard let `self` = self else { return }
        guard isSelected == true else { return }
        self.slotsViewModel.filter { elem in
          elem != slot
          }.forEach { $0.unSelect() }
      })
    }
  }
  func getFirstDayWithSlotBeforeThisDay() -> DayViewModel? {
    guard let model = self.dataController.getFirstDayWithSlotBefore(day: self.originalModel) else { return nil }
    return DayViewModel(model: model, dataController: dataController)
  }

  func getNextDayWithSlotAfterThisDay() -> DayViewModel? {
    guard let model = self.dataController.getFisrtDayWithSlotAter(day: self.originalModel) else { return nil }
    return DayViewModel(model: model, dataController: dataController)
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

  func userWantToShowSlotOfThisDay() {
    self.dataController.updateSelectedDay(day: self.originalModel)
  }
  
  func representDay(day: DayApiModel) -> Bool {
    return day == self.originalModel
  }
}

protocol DayListViewModelDelegate: class {
  func shouldReloadDays()
}

class DayListViewModel {

  enum DisplayState {

    case notReady
    case daySelected(day: Int, days: [DayViewModel])

    init(days: [DayViewModel], selectedDay: Int = 0, dataController: CalendarDataController) {
      if days.isEmpty == true {
        self = .notReady
      } else {
        self = .daySelected(day: selectedDay, days: days)
      }
    }
  }

  weak var delegate: DayListViewModelDelegate? = nil

  let dataController: CalendarDataController

  var displayState: DisplayState {
    didSet {
      self.updateObervableFromDisplaySate(state: self.displayState)
    }
  }

  var selectedIndexPath = Observable<IndexPath>(IndexPath.init(row: 0, section: 0))

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
        days[indexPath.item].userWantToShowSlotOfThisDay()
      }
    case .notReady:
      break
    }
  }

  func updateObervableFromDisplaySate(state: DisplayState) {
    switch state {
    case .daySelected(day: let selectedDay, days: let days):
      if self.selectedIndexPath.value != IndexPath(item: selectedDay, section: 0) && selectedDay < days.count {
        self.selectedIndexPath.value = IndexPath(item: selectedDay, section: 0)
      }
    case .notReady:
      break
    }
  }

  func setupDataController() {
    self.dataController.days.bind { [weak self] _, newModels in
      guard let `self` = self else { return }

      let newViewModels = newModels.map { DayViewModel(model: $0, dataController: self.dataController) }

      switch self.displayState {
      case .daySelected(day: let day, days: _):
        self.displayState = .daySelected(day: day, days: newViewModels)
        self.delegate?.shouldReloadDays()
      case .notReady:
        self.displayState = DisplayState(days: newViewModels, dataController: self.dataController)
        self.delegate?.shouldReloadDays()
      }
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
    self.displayState = DisplayState(days: dataController.days.value.map { DayViewModel(model: $0, dataController: dataController) },
                                     selectedDay: dataController.selectedDay.value,
                                     dataController: dataController)

    self.updateObervableFromDisplaySate(state: self.displayState)
    self.setupDataController()
  }

}

//
//  MonthListViewModel.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 20/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

extension MonthViewModel: Equatable {
  static func == (lhs: MonthViewModel, rhs: MonthViewModel) -> Bool {
    return lhs.originalModels == rhs.originalModels
  }
}

extension MonthViewModel: Comparable {

  static func < (lhs: MonthViewModel, rhs: MonthViewModel) -> Bool {
    guard let firstLeft = lhs.originalModels.first, let firstRight = rhs.originalModels.first else { return false }
    return firstLeft < firstRight
  }

}

class MonthViewModel {

  private let originalModels: [DayApiModel]

  let monthText: String
  let yearText: String
  let dataController: CalendarDataController

  init?(model: [DayApiModel], name: String, dataController: CalendarDataController) {
    self.originalModels = model
    self.monthText = name.capitalized
    guard let year =  model.first?.yearText else { return nil }
    self.yearText = year
    self.dataController = dataController
  }

  func dayIsContainInThisMonth(day: DayApiModel) -> Bool {
    return self.originalModels.contains(day)
  }

  func userWantToShowDayOfThisMonth() {
    guard let first = self.originalModels.first else { return }
    self.dataController.updateSelectedDay(day: first)
  }

}

class MonthListViewModel {

  enum ArrowButtonDisplayState {
    case enable
    case disabled
    case loading
  }

  enum DisplayState {

    static func getMonthIndexForDay(day: DayApiModel, months: [MonthViewModel]) -> Int? {
      if let first = (months.first { $0.dayIsContainInThisMonth(day: day) }) {
        return months.firstIndex(of: first)
      }
      return nil
    }

    func getMonthIndexForDay(day: DayApiModel) -> Int? {
      switch self {
      case .monthSelected(monthSelected: _, months: let months):
        return DisplayState.getMonthIndexForDay(day: day, months: months)
      case .notReady:
        return nil
      }
    }

    init(days: [DayApiModel], dataController: CalendarDataController) {

      var months: [MonthViewModel] = []

      var dest: [String : [DayApiModel]] = [:]

      for aDay in days {
        if var tab = dest[aDay.monthText] {
          tab.append(aDay)
          dest[aDay.monthText] = tab
        } else {
          dest[aDay.monthText] = [aDay]
        }
      }

      for (key, value) in dest {
        if let month = MonthViewModel(model: value, name: key, dataController: dataController) {
          months.append(month)
        }
      }

      months.sort { return $0 < $1 }


      guard months.isEmpty == false else { self = .notReady; return }

      guard let index = DisplayState.getMonthIndexForDay(day: dataController.days.value[dataController.selectedDay.value], months: months) else {
        self = .notReady; return
      }

      self = .monthSelected(monthSelected: index, months: months)
    }

    case notReady
    case monthSelected(monthSelected: Int, months: [MonthViewModel])
  }

  var shouldShowSpinner: Observable<Bool> = Observable<Bool>(false)
  var shouldShowMonth: Observable<Bool> = Observable<Bool>(false)

  var leftButtonDisplayState: Observable<ArrowButtonDisplayState> = Observable<ArrowButtonDisplayState>(.disabled)
  var rightButtonDisplayState: Observable<ArrowButtonDisplayState> = Observable<ArrowButtonDisplayState>(.disabled)

  let dataController: CalendarDataController
  var displayState: DisplayState {
    didSet {
      self.updateObservableValue()
    }
  }

  var monthsCount: Int {
    switch self.displayState {
    case .monthSelected(monthSelected: _, months: let months):
      return months.count
    case .notReady:
      return 0
    }
  }

  var selectedIndexPath: Observable<IndexPath> = Observable<IndexPath>(IndexPath(item: 0, section: 0))

  subscript (index: IndexPath) -> MonthViewModel? {
    switch self.displayState {
    case .monthSelected(monthSelected: _, months: let months):
      guard index.item >= 0, index.item < months.count else { return nil }
      return months[index.item]
    case .notReady:
      return nil
    }
  }

  func updateLeftButtonIfNeeded(state: ArrowButtonDisplayState) {
    if self.leftButtonDisplayState.value != state {
      self.leftButtonDisplayState.value = state
    }
  }

  func updateRightButtonIfNeeded(state: ArrowButtonDisplayState) {
    if self.rightButtonDisplayState.value != state {
      self.rightButtonDisplayState.value = state
    }
  }

  func updateButtonsObservable(monthSelectedIndex: Int, months: [MonthViewModel]) {

    guard months.count != 0 else {
      self.updateLeftButtonIfNeeded(state: .disabled)
      self.updateRightButtonIfNeeded(state: .disabled)
      return
    }

    if monthSelectedIndex == 0 {
      self.updateLeftButtonIfNeeded(state: .disabled)
      self.updateRightButtonIfNeeded(state: .enable)
    }

    if monthSelectedIndex > 0 && monthSelectedIndex < months.count {
      self.updateLeftButtonIfNeeded(state: .enable)
    }

    if monthSelectedIndex == months.count - 1 {
      self.updateRightButtonIfNeeded(state: .disabled)
    }
  }

  func updateObservableValue() {
    switch self.displayState {
    case .monthSelected(monthSelected: let selected, months: let months):

      self.updateButtonsObservable(monthSelectedIndex: selected, months: months)

      if self.shouldShowMonth.value == false {
        self.shouldShowMonth.value = true
      }

      if self.shouldShowSpinner.value == true {
        self.shouldShowSpinner.value = false
      }

      let indexPath = IndexPath(item: selected, section: 0)
      if self.selectedIndexPath.value != indexPath {
        self.selectedIndexPath.value = indexPath
      }

    case .notReady:
      if self.shouldShowMonth.value == true {
        self.shouldShowMonth.value = false
      }
      if self.shouldShowSpinner.value == false {
        self.shouldShowSpinner.value = true
      }
    }
  }

  func setupDataController() {
    self.dataController.days.bind { [weak self] _, days in
      guard let `self` = self else { return }
      self.displayState = DisplayState(days: days, dataController: self.dataController)
    }

    self.dataController.selectedDay.bind { _, newIndex in
      guard let monthSelected = self.displayState.getMonthIndexForDay(day: self.dataController.days.value[newIndex]) else { return }
      switch self.displayState {
      case .monthSelected(monthSelected: _, months: let months):
        self.displayState = .monthSelected(monthSelected: monthSelected, months: months)
      case .notReady:
        break
      }
    }
  }

  func userWantToDisplayMonthDay(indexPath: IndexPath) {
    switch self.displayState {
    case .monthSelected(monthSelected: _, months: let months):
      if indexPath.item >= 0 && indexPath.item < months.count {
        months[indexPath.item].userWantToShowDayOfThisMonth()
      }
    case .notReady:
      break
    }
  }

  func userWantToDisplayNextMont() {
    self.userWantToDisplayMonthDay(indexPath: IndexPath(item: self.selectedIndexPath.value.item + 1, section: 0))
  }

  func userWantToDisplayPreviousMonth() {
    self.userWantToDisplayMonthDay(indexPath: IndexPath(item: self.selectedIndexPath.value.item - 1, section: 0))
  }

  init(dataController: CalendarDataController) {
    self.dataController = dataController
    self.displayState = DisplayState(days: self.dataController.days.value, dataController: dataController)
    self.setupDataController()
    self.updateObservableValue()
  }
}

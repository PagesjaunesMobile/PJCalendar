//
//  CalendarDataController.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 19/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

class CalendarDataController {

  enum LoadingState {
    case ready
    case loading
    case error
  }

  let morningName = "Matin"
  let afterNoonName = "Apres midi"

  var loadingState = Observable<LoadingState>(.loading)

  let apiService: RdvApiService

  var days: Observable<[DayApiModel]> = Observable<[DayApiModel]>([])
  var selectedDay: Observable<Int> = Observable<Int>(0)
  
  var dayModel: DayApiModel? {
    guard selectedDay.value >= 0, selectedDay.value < self.days.value.count else { return nil }
    return self.days.value[self.selectedDay.value]
  }

  init(apiService: RdvApiService) {
    self.apiService = apiService
  }

  func updateSelectedDay(day: DayApiModel) {
    if let dest = self.days.value.firstIndex(of: day) {
      self.selectedDay.value = Int(dest)
    }
  }

  func loadData() {
    self.loadingState.value = .loading
    self.apiService.makeRequest { result in
      switch result {
      case .success(rdvList: var model):
        self.loadingState.value = .ready
        var toto = model.first!
        let firstSlot = toto.slots.first!
        toto.slots.removeAll()
        toto.slots.append(firstSlot)
        model[0] = toto
        self.days.value = model
        self.selectedDay.value = 0
      case .error:
        self.loadingState.value = .error
      }
    }
  }

}

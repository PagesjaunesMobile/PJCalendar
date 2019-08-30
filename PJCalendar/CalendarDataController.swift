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
      case .success(rdvList: let model):
        self.loadingState.value = .ready
        self.days.value = model
      case .error:
        self.loadingState.value = .error
      }
    }
  }

}

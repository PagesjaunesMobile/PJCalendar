//
//  CalendarDataController.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 19/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

class CalendarDataController {

  enum Result {
    case success(days: [DayApiModel])
    case error
  }

  let apiService: RdvApiService

  var days: Observable<[DayApiModel]> = Observable<[DayApiModel]>([])

  var selectedDay: Observable<Int> = Observable<Int>(0)

  init(apiService: RdvApiService) {
    self.apiService = apiService
  }

  func updateSelectedDay(day: DayApiModel) {
    if let dest = self.days.value.firstIndex(of: day)/*, Int(dest) != self.selectedDay.value*/ {
      self.selectedDay.value = Int(dest)
    }
  }

  func loadData(completion: @escaping ((Result) -> Void)) {
    self.apiService.makeRequest { result in
      switch result {
      case .success(rdvList: let model):
        self.days.value = model
        completion(.success(days: model))
      case .error:
        completion(.error)
      }
    }
  }

}

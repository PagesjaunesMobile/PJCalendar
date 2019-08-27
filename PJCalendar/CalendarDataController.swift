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
    case success(days: [RdvApiModel])
    case error
  }

  let apiService: RdvApiService
  var days: Observable<[RdvApiModel]> = Observable<[RdvApiModel]>([])

  init(apiService: RdvApiService) {
    self.apiService = apiService
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

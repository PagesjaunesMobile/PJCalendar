//
//  RdvApiService.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 08/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import StargateKitCore
import StargateKitRequest


struct RdvApiService {

  enum Result {
    case success(rdvList: [DayApiModel])
    case noResult
    case error
  }

  //let transacType: String
  let etabCode: String
  let calendId: String
  let intervId: String

//  etab_code=09415876
//  period=30J
//  goto=AVAILABILITY
//  service_id=
//  categ_id=14
//  interv_id=1047303-756
//  calend_id=887
//  groupe_id=
//  dtime=
//  sdtime=
//  init(transacType: String = "SANTE", etabCode: String = "55806040", calendId: String = "619343", intervId: String = "4750363") {
//    self.transacType = transacType
//    self.etabCode = etabCode
//    self.calendId = calendId
//    self.intervId = intervId
//  }

  init(etabCode: String = "09592944", calendId: String = "999626975", intervId: String = "1003774611") {
    self.etabCode = etabCode
    self.calendId = calendId
    self.intervId = intervId
  }

  func loadNextResult(fromDate date: Date, completion: @escaping (Result) -> Void) {
    self.performRequest(date: date, completion: completion)
  }

  func performRequest(date: Date? = nil, completion: @escaping (Result) -> Void) {

    let dateStr: String?

    if let date = date {
      let dateFormater = DateFormatter()
      dateFormater.dateFormat = "yyyy-MM-dd hh:mm:ss"
      dateStr = dateFormater.string(from: date)
    } else {
      dateStr = nil
    }



    let request = StargateKitRequest.Transactionnel.RecupererDisponibiliteRendezVous.Request(etabCode: self.etabCode,
                                                                                             calendId: self.calendId,
                                                                                             intervId: self.intervId,
                                                                                             goto: StargateKitRequest.Transactionnel.RecupererDisponibiliteRendezVous.SKRGoto.availability, /*period: "120J",*/ sdtime: dateStr)
    StargateClient.setServer(.sgmobCD_HTTPS)
 //   StargateClient.setServer(.gcpProd_HTTPS)
    StargateClient.makeRequest(request: request) { result in
      switch result.result {
      case .success(let value):
        switch value {
        case .status200(let resDispoSante):

          guard let codeCI = resDispoSante.codeCI else {
            completion(.error)
            return
          }

          if codeCI == "8083" {
            completion(.noResult)
            return
          }

          guard codeCI == "8081" else {
            completion(.error)
            return
          }

          guard let days = resDispoSante.days?.day else {
            completion(.error)
            return
          }

          let dest: [DayApiModel] = days.compactMap {
            guard let dText = $0.dtext else { return nil }

            let slots:[SlotApiModel]? = $0.hours?.compactMap {
              guard let text = $0.htext, let code = $0.hcode else { return nil }

              return SlotApiModel(htext: text, hcode: code)
            }

            return DayApiModel(dtext: dText, dcode: $0.dcode, slots: slots)
          }

          completion(.success(rdvList: dest))
        case .status500(_):
          completion(.error)
        }
      case .failure:
        completion(.error)
      }
    }
  }

  func loadData(completion: @escaping (Result) -> Void) {
    self.performRequest(completion: completion)
  }
}

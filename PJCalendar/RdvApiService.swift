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
    case error
  }

  let transacType: String
  let etabCode: String
  let calendId: String
  let intervId: String

  init(transacType: String = "SANTE", etabCode: String = "55806040", calendId: String = "619343", intervId: String = "4750363") {
    self.transacType = transacType
    self.etabCode = etabCode
    self.calendId = calendId
    self.intervId = intervId
  }

  func makeRequest(completion: @escaping (Result) -> Void) {

    let request = StargateKitRequest.Transactionnel.RecupererDisponibiliteRendezVous.Request(typeTransactionnel: self.transacType,
                                                                                             etabCode: self.etabCode,
                                                                                             calendId: self.calendId,
                                                                                             intervId: self.intervId,
                                                                                             goto: StargateKitRequest.Transactionnel.RecupererDisponibiliteRendezVous.SKRGoto.availability)
    StargateClient.setServer(.prod_HTTPS)
    StargateClient.makeRequest(request: request) { result in
      switch result.result {
      case .success(let value):
        switch value {
        case .status200(let resDispoSante):

          guard let days = resDispoSante.days?.day else { return }

          let dest: [DayApiModel] = days.compactMap {
            guard let dText = $0.dtext else { return nil }

            let slots:[SlotApiModel]? = $0.hour?.compactMap {
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
}

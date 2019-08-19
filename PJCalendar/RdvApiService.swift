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
  static func makeRequest() {

    /*

https://uiphone-sg.mob.pagesjaunes.fr/CI118/rendezvous/disponibilite?etab_code=55806040&type_transactionnel=SANTE&calend_id=619343&goto=AVAILABILITY&interv_id=4750363&token=20716054259955370046031385

    */

    let request = StargateKitRequest.Transactionnel.RecupererDisponibiliteRendezVous.Request(token: nil, typeTransactionnel: "SANTE", etabCode: "55806040", serviceId: nil, categId: nil, calendId: "619343", intervId: "4750363", groupeId: nil, goto: StargateKitRequest.Transactionnel.RecupererDisponibiliteRendezVous.SKRGoto.availability, landingStep: nil, period: nil, sdtime: nil, dtime: nil)

    StargateClient.setServer(.prod_HTTPS)
    StargateClient.makeRequest(request: request) { result in
      print(result)
    }
  }
}

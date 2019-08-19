/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation
import os.log
import StargateKitRequest

@available(iOS 10.0, *)
struct StargateKitRequestBehaviour : RequestBehaviour {
  func modifyRequest(request: AnyRequest, urlRequest: URLRequest) -> URLRequest {
    guard var urlRequestURL = urlRequest.url // extrait l'URL de la requete
      else {
        os_log("🧨 - Failed to extract url in %@", log: StargateClient.log, type: .info, request.greaterDescription)
        return urlRequest
    }

    /// if POST force parameter adding
    if request.service.method == "POST", let tempURLRequest = URL(string: "\(urlRequestURL.absoluteString)?token=toutPourrave") {
      urlRequestURL = tempURLRequest
    }
    
    /// Extractions des componenent de l'URL
    var components = URLComponents(url: urlRequestURL, resolvingAgainstBaseURL: false)

    /// Ajout des nouveaux parametre a l'URL
    components?.queryItems?.append(contentsOf: StargateClient.shared.extraneousParameter)

    /// Suppression du token de l'URL
    if let idx = components?.queryItems?.firstIndex(where: { $0.name == "token" }) {
      components?.queryItems?.remove(at: idx)
    }

    /// Ajout du token a l'URL
    components?.queryItems?.append(URLQueryItem(name: "token", value: UserDefaults.standard.stargateToken))

    guard let url = try? components?.asURL() else {
      os_log("🧨 - Failed to create a proper URL with extraneousParameter", log: StargateClient.log, type: .info)
      return urlRequest
    }
    var newURLRequest = urlRequest
    newURLRequest.url = url
    return newURLRequest
  }
}

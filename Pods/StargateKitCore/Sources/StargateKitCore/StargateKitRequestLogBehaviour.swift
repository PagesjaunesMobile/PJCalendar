/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation
import StargateKitRequest

@available(iOS 10.0, *)
struct StargateKitRequestLogBehaviour : RequestBehaviour {
  func validate(request: AnyRequest, urlRequest: URLRequest, complete: @escaping (RequestValidationResult) -> Void) {
    StargateClient.log(request: request, urlRequest: urlRequest)
    complete(.success(urlRequest))
  }

  func onResponse(request: AnyRequest, response: AnyResponse) {
    StargateClient.log(response: response)
  }
}

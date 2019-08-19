/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

@available(iOS 10.0, *)
extension StargateClient {

  @discardableResult static public func cancelRequest(_ id : APIClientTaskID) -> Bool {
    return StargateClient.shared.cancelGetFD(requestID: id)
  }

  private func cancelGetFD(requestID : APIClientTaskID) -> Bool {
    if let req = tasks.removeValue(forKey: requestID) {
      req.cancel()
      return true
    }
    return false
  }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import os.log
import StargateKitRequest
import Foundation

@available(iOS 10.0, *)
extension StargateClient {
  enum GetSessionCode : String, RawRepresentable {
    case sessionOK = "104"
  }
  @discardableResult func getSession<T>(request: APIRequest<T>, complete: @escaping (APIResponse<T>) -> Void) -> APIClientTaskID {
    let requestID = APIClientTaskID.init(rawValue: UUID().uuidString)
    
    guard let req = getSession() else {
      os_log("🧨 - %@ failed at line %d", log: StargateClient.log, type: .info, #function, #line)
      return requestID
    }
    
    self.tasks[requestID] = StargateClient.shared.apiClient.makeRequest(req) { [weak self] apiResponse in
      defer { StargateClient.cancelRequest(requestID) }

      switch apiResponse.result {
      case let .success(apiResponseResult):
        switch apiResponseResult {
        case let .status200(apiResponseResult200):
          if let codeCI = apiResponseResult200.codeCI, codeCI == GetSessionCode.sessionOK.rawValue {
            UserDefaults.standard.stargateToken = apiResponseResult200.token ?? StargateClient.Constant.invalidToken
            UserDefaults.standard.stargateSessionID = apiResponseResult200.sessionId
          } else { print(apiResponseResult200) }
        case let .status500(apiResponseResult500): print(apiResponseResult500)
        }
      case let .failure(apiResponseError): print(apiResponseError)
      }
      let previousRequestRetryID = APIClientTaskID.init(rawValue: UUID().uuidString)
      self?.tasks.removeValue(forKey: previousRequestRetryID)?.cancel()
      self?.tasks[previousRequestRetryID] = StargateClient.shared.apiClient.makeRequest(request, complete: complete)
    }
    
    return requestID
  }

  func getSession() -> Optional<StargateKitRequest.Session.GetSession.Request> {
    let uuid = UserDefaults.standard.stargateUUID
    let timeStamp = timeStamptDateFormater.string(from: Date())
    guard let key = "\(StargateClient.Constant.idClient)@\(uuid)@\(timeStamp)@\(StargateClient.Constant.keyCode)".sha1 else {
      os_log("🧨 - %@ failed at line %d", log: StargateClient.log, type: .info, #function, #line)
      return nil
    }

    return StargateKitRequest.Session.GetSession.Request(idClient: StargateClient.Constant.idClient,
                                                         uuId: uuid,
                                                         timeStamp: timeStamp,
                                                         key: key)
  }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation
import Tagged
import StargateKitRequest

@available(iOS 10.0, *)
public final class StargateClient {
  public typealias APIClientTaskID = Tagged<StargateClient, String>
  static let shared = StargateClient()

  var tasks : [APIClientTaskID : CancellableRequest] = [:]
  var extraneousParameter : [URLQueryItem] = []
  var server : StargateClient.Server = .orcpjCD_HTTPS
  let apiClient : APIClient

  lazy var timeStamptDateFormater : DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "yyyyMMddHHmmss"
    df.timeZone = TimeZone(abbreviation: "GMT")
    return df
  }()

  private init() {
    self.apiClient = APIClient(baseURL: self.server.rawValue,
                               defaultHeaders: ["Accept" : "application/json"],
                               behaviours: [StargateKitRequestBehaviour(), StargateKitRequestLogBehaviour()])
  }


  @discardableResult static public func makeRequest<T>(request: APIRequest<T>, complete: @escaping (APIResponse<T>) -> Void) -> APIClientTaskID  {
    return StargateClient.shared.makeRequest(request: request, complete: complete)
  }

  static public func getSession() -> Optional<StargateKitRequest.Session.GetSession.Request>  {
    return StargateClient.shared.getSession()
  }

  static public func appendRequestParameter(queryItems : [URLQueryItem])  {
    StargateClient.shared.extraneousParameter.append(contentsOf: queryItems)
  }

  static public func removeAllRequestParameter()  {
    StargateClient.shared.extraneousParameter.removeAll()
  }

  static public func setServer(_ server : Server)  {
    StargateClient.shared.server = server
  }
  
  static public func getServer() -> Server  {
    return StargateClient.shared.server
  }
  
  private func makeRequest<T>(request: APIRequest<T>, complete: @escaping (APIResponse<T>) -> Void) -> APIClientTaskID  {

    let requestID = APIClientTaskID.init(rawValue: UUID().uuidString)
    self.apiClient.baseURL = self.server.rawValue

    let burrito : (APIResponse<T>) -> Void = { [weak self] apiResponse in
      defer { StargateClient.cancelRequest(requestID) }
      
      if case let .success(apiResponseResult) = apiResponse.result,
        let apiResponseResultSuccess = apiResponseResult.success as? StargateBaseModel,
        apiResponseResultSuccess.code == StargateClient.Constant.sessionExpirer {
        StargateClient.shared.getSession(request: request, complete: complete)
        return
      }
      complete(apiResponse)
    }

    if UserDefaults.standard.stargateToken == StargateClient.Constant.invalidToken {
      return StargateClient.shared.getSession(request: request, complete: complete)
    } else {
      self.tasks[requestID] = self.apiClient.makeRequest(request, complete: burrito)
    }
    return requestID
  }
}

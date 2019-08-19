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
extension StargateClient {
  public static let log : OSLog = {
    let bundleIdentifier  = Bundle.main.bundleIdentifier ?? "com.pagesjaunes"
    let subsystem = "\(bundleIdentifier).stargatekit"
    let category = "StargateKit"
    return OSLog(subsystem: subsystem, category: category)
  }()

  static func log(request: AnyRequest, urlRequest: URLRequest) {
    let allHTTPHeaderFields : [String : String] = urlRequest.allHTTPHeaderFields ?? [:]
    let fullURL = urlRequest.url?.absoluteString ?? ""
    let urlPath = "\(fullURL)\n\(request.greaterDescription)\n\n"
    let parameter = StargateClient.shared.format(parameters: request.parameters, title: "HTTP Parameter")
    let header = StargateClient.shared.format(parameters: allHTTPHeaderFields, title: "HTTP Header")
    if let httpBody = urlRequest.httpBody, let httpBodyString = String(data: httpBody, encoding: .utf8) {
      let body = StargateClient.shared.format(parameters: httpBodyString, title: "Body")
      let jsonObject = try? JSONSerialization.jsonObject(with: httpBody, options: [])
      let jsonPrettyData = jsonObject.flatMap({ try? JSONSerialization.data(withJSONObject: $0, options: .prettyPrinted)  })
      if let jsonPrettyData = jsonPrettyData, let jsonPrettyString = String(data: jsonPrettyData, encoding: .utf8) {
        let JSONBody = StargateClient.shared.format(parameters: jsonPrettyString, title: "JSON Body")
        os_log("↑ %@\n%@%@%@", log: StargateClient.log, type: .info, urlPath, header, parameter, JSONBody)
      } else {
        os_log("↑ %@\n%@%@%@", log: StargateClient.log, type: .info, urlPath, header, parameter, body)
      }
    } else {
      os_log("↑ %@\n%@%@", log: StargateClient.log, type: .info, urlPath, header, parameter)
    }
  }

  static func log(response: AnyResponse) {
    let fullURL = response.urlRequest?.url?.absoluteString ?? ""
    let urlPath = "\(fullURL)\n\(response.description)\n\n"
    let dataString = StargateClient.shared.formatedData(response: response)
    let httpParameter = StargateClient.shared.formatHTTPResponseHTTPHeader(response: response)
    let headerFields = (response.urlResponse?.allHeaderFields ?? [:]) as! [String : Any]
    let httpHeader = StargateClient.shared.format(parameters: headerFields, title: "HTTP Header")
    let timeline = StargateClient.shared.formatedTimeLine(response: response)
    let stringResponse = StargateClient.shared.formattedResponseBody(response: response)
    os_log("↓ %@%@%@%@%@%@", log: StargateClient.log, type: .info, urlPath, httpParameter, httpHeader, dataString, timeline, stringResponse)
  }
}

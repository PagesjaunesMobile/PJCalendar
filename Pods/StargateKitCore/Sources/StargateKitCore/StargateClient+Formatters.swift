/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation
import StargateKitRequest

@available(iOS 10.0, *)
extension AnyRequest {
  var greaterDescription : String {
    var string = "\(service.method) \(path)"
    if !parameters.isEmpty {
      string += "?" + parameters.map {"\($0)=\($1)"}.joined(separator: "&")
    }
    return string
  }
}

@available(iOS 10.0, *)
extension StargateClient {
  func format(input: [URLQueryItem], title : String) -> String {
    let queryItemSerialization = input.reduce("") { (res, queryItem) -> String in
      let tValue = queryItem.value ?? ""
      var value : String = tValue
      if tValue.isEmpty == false {
        value = ": \(tValue)"
      }
      return res.appending("\(queryItem.name)\(value)\n")
    }
    return """
    \(title):

    \(queryItemSerialization)

    """
  }

  func format(parameters : [String : Any], title : String) -> String {
    let httpParameter = parameters.reduce("") { (res, tuple) -> String in
      return res.appending("\(tuple.key): \(tuple.value)\n")
    }

    return """
    \(title):

    \(httpParameter)

    """
  }

  func format(parameters : String, title : String) -> String {
    return """
    \(title):

    \(parameters)

    """
  }
}


@available(iOS 10.0, *)
extension StargateClient {
  func XMLformatter(data: Data) -> String {
    return DefaultFormatter(data: data)
  }

  func JSONformatter(data: Data) -> String {
    if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) {
      return String(describing: jsonData)
    }
    return DefaultFormatter(data: data)
  }

  func DefaultFormatter(data: Data) -> String {
    if let dataString = String(data: data, encoding: String.Encoding.utf8) {
      return dataString
    }
    return "Unable to parse data"
  }

  func formattedResponseBody(response: AnyResponse) -> String {
    guard
      let data = response.data,
      let type = response.urlRequest?.allHTTPHeaderFields?["Accept"]
      else { return "" }

    let output : String
    switch type.lowercased() {
    case "application/json":
      output = JSONformatter(data: data)
    case "application/xml", "text/xml":
      output = XMLformatter(data: data)
    default:
      output = DefaultFormatter(data: data)
    }
    return "Content:\n\(output)\n"
  }

  func formatedTimeLine(response: AnyResponse) -> String {
    guard let timeline = response.timeline else { return "" }

    let latency = String(format: "%.3f", timeline.latency)
    let requestDuration = String(format: "%.3f", timeline.requestDuration)
    let serializationDuration = String(format: "%.3f", timeline.serializationDuration)
    let totalDuration = String(format: "%.3f", timeline.totalDuration)

    return """
    Timeline:

    Latency: \(latency) secs
    Request Duration: \(requestDuration) secs
    Serialization Duration: \(serializationDuration) secs
    Total Duration: \(totalDuration) secs


    """
  }

  func formatedHTTPParameter(response: AnyResponse) -> String {
    let httpParameter = response.request.headers.reduce("") { (res, tuple) -> String in
      return res.appending("\(tuple.key): \(tuple.value)\n")
    }
    return "\(httpParameter)\n"
  }

  func format(input : Data) -> String {
    return "Data: \(input.count) bytes\n"
  }

  func formatedData(response: AnyResponse) -> String {
    if let data = response.data {
      return "\(format(input: data))\n"
    }
    return ""
  }

  func formatHTTPResponseHTTPHeader(response: AnyResponse) -> String {
    guard
      let url = response.urlRequest?.url,
      let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
      let queryItems = components.queryItems
      else { return "" }

    return format(input: queryItems, title: "HTTP Parameter")
  }

}

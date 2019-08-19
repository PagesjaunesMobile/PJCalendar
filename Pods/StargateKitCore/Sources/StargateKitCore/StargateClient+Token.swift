/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation
import os.log

@available(iOS 10.0, *)
extension StargateClient {

  /// Refresh Stargate token for an URL by replacing URL query item with actual stargateToken
  ///
  /// - Parameter url: URL where we replace token query item
  /// - Returns: the new URL with actual stargateToken as token query item
  public static func refreshToken(for url: URL) -> URL {
    var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    if let idx = components?.queryItems?.firstIndex(where: { $0.name == "token" }) {
      components?.queryItems?.remove(at: idx)
    }
    components?.queryItems?.append(URLQueryItem(name: "token", value: UserDefaults.standard.stargateToken))

    guard let newURL = try? components?.asURL() else {
      os_log("🧨 - Refresh the token", log: StargateClient.log, type: .info)
      return url
    }
    #if swift(<5.0)
    guard let finalNewURL = newURL else { return url }
    return finalNewURL
    #else
    return newURL
    #endif
  }


  /// Remove Stargate token from an url
  ///
  /// - Parameter url: URL from where we remove token query item
  /// - Returns: the new URL without any token query item
  public static func removeToken(from url: URL) -> URL {

    var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    if let idx = components?.queryItems?.firstIndex(where: { $0.name == "token" }) {
      components?.queryItems?.remove(at: idx)
    }

    guard let newURL = try? components?.asURL() else {
      os_log("🧨 - Remove the token", log: StargateClient.log, type: .info)
      return url
    }
    #if swift(<5.0)
    guard let finalNewURL = newURL else { return url }
    return finalNewURL
    #else
    return newURL
    #endif
  }
}

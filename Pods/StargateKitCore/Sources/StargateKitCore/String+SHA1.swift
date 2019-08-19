/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation
import CommonCrypto
import os.log

@available(iOS 10.0, *)
extension String {

  public var sha1: String? {
    guard let data = self.data(using: String.Encoding.utf8) else {
      os_log("🧨 - %@ failed at line %d", log: StargateClient.log, type: .info, #function, #line)
      return nil
    }
    let hash = data.withUnsafeBytes { (bytes: UnsafePointer<Data>) -> [UInt8] in
      var hash: [UInt8] = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
      CC_SHA1(bytes, CC_LONG(data.count), &hash)
      return hash
    }
    return hash.map { String(format: "%02x", $0) }.joined()
  }
}

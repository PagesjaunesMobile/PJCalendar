/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCqfd: StargateKitModel {

    public var urlProD: String?

    public init(urlProD: String? = nil) {
        self.urlProD = urlProD
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case urlProD
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        urlProD = try container.decodeIfPresent(.urlProD)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(urlProD, forKey: .urlProD)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCqfd else { return false }
      guard self.urlProD == object.urlProD else { return false }
      return true
    }

    public static func == (lhs: SKRCqfd, rhs: SKRCqfd) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

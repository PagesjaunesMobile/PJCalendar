/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCqlr: StargateKitModel {

    public var urlProA: String?

    public var urlProR: String?

    public init(urlProA: String? = nil, urlProR: String? = nil) {
        self.urlProA = urlProA
        self.urlProR = urlProR
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case urlProA
        case urlProR
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        urlProA = try container.decodeIfPresent(.urlProA)
        urlProR = try container.decodeIfPresent(.urlProR)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(urlProA, forKey: .urlProA)
        try container.encodeIfPresent(urlProR, forKey: .urlProR)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCqlr else { return false }
      guard self.urlProA == object.urlProA else { return false }
      guard self.urlProR == object.urlProR else { return false }
      return true
    }

    public static func == (lhs: SKRCqlr, rhs: SKRCqlr) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

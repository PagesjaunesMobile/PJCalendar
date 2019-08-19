/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRendezvous: StargateKitModel {

    public var rdv: [SKRRdv]?

    public init(rdv: [SKRRdv]? = nil) {
        self.rdv = rdv
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case rdv
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        rdv = try container.decodeArrayIfPresent(.rdv)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(rdv, forKey: .rdv)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRendezvous else { return false }
      guard self.rdv == object.rdv else { return false }
      return true
    }

    public static func == (lhs: SKRRendezvous, rhs: SKRRendezvous) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

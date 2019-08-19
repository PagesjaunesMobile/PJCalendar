/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRActs: StargateKitModel {

    public var act: [SKRActiviteYES]

    public var crc: [SKRCrc]?

    public init(act: [SKRActiviteYES], crc: [SKRCrc]? = nil) {
        self.act = act
        self.crc = crc
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case act
        case crc
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        act = try container.decodeArray(.act)
        crc = try container.decodeArrayIfPresent(.crc)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(act, forKey: .act)
        try container.encodeIfPresent(crc, forKey: .crc)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRActs else { return false }
      guard self.act == object.act else { return false }
      guard self.crc == object.crc else { return false }
      return true
    }

    public static func == (lhs: SKRActs, rhs: SKRActs) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

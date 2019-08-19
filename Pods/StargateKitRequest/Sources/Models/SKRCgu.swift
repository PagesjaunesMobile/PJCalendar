/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCgu: StargateKitModel {

    public var cgu: [SKRCgu]?

    public var valid: Bool?

    public init(cgu: [SKRCgu]? = nil, valid: Bool? = nil) {
        self.cgu = cgu
        self.valid = valid
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case cgu
        case valid
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        cgu = try container.decodeArrayIfPresent(.cgu)
        valid = try container.decodeIfPresent(.valid)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(cgu, forKey: .cgu)
        try container.encodeIfPresent(valid, forKey: .valid)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCgu else { return false }
      guard self.cgu == object.cgu else { return false }
      guard self.valid == object.valid else { return false }
      return true
    }

    public static func == (lhs: SKRCgu, rhs: SKRCgu) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPRoom: StargateKitModel {

    public var base: String?

    public var value: String?

    public init(base: String? = nil, value: String? = nil) {
        self.base = base
        self.value = value
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case base
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        base = try container.decodeIfPresent(.base)
        value = try container.decodeIfPresent(.value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(base, forKey: .base)
        try container.encodeIfPresent(value, forKey: .value)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPRoom else { return false }
      guard self.base == object.base else { return false }
      guard self.value == object.value else { return false }
      return true
    }

    public static func == (lhs: SKRPRoom, rhs: SKRPRoom) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

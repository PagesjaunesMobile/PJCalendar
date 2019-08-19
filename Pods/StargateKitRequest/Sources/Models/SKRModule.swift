/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRModule: StargateKitModel {

    public var item: [SKRItemCommun]?

    public init(item: [SKRItemCommun]? = nil) {
        self.item = item
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case item
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        item = try container.decodeArrayIfPresent(.item)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(item, forKey: .item)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRModule else { return false }
      guard self.item == object.item else { return false }
      return true
    }

    public static func == (lhs: SKRModule, rhs: SKRModule) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

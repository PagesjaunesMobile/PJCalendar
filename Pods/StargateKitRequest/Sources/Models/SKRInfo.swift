/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInfo: StargateKitModel {

    public var item: [SKRItemCommun]

    public var label: String?

    public init(item: [SKRItemCommun], label: String? = nil) {
        self.item = item
        self.label = label
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case item
        case label
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        item = try container.decodeArray(.item)
        label = try container.decodeIfPresent(.label)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(item, forKey: .item)
        try container.encodeIfPresent(label, forKey: .label)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInfo else { return false }
      guard self.item == object.item else { return false }
      guard self.label == object.label else { return false }
      return true
    }

    public static func == (lhs: SKRInfo, rhs: SKRInfo) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

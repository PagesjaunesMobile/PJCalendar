/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContenuPrioritaire: StargateKitModel {

    public var item: [String]?

    public var label: String?

    public var type: String?

    public init(item: [String]? = nil, label: String? = nil, type: String? = nil) {
        self.item = item
        self.label = label
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case item
        case label
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        item = try container.decodeArrayIfPresent(.item)
        label = try container.decodeIfPresent(.label)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContenuPrioritaire else { return false }
      guard self.item == object.item else { return false }
      guard self.label == object.label else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRContenuPrioritaire, rhs: SKRContenuPrioritaire) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

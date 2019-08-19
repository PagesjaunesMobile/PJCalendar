/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCviElement: StargateKitModel {

    public var cviItem: [SKRCviItem]?

    public var label: String?

    public var type: String?

    public var value: String?

    public init(cviItem: [SKRCviItem]? = nil, label: String? = nil, type: String? = nil, value: String? = nil) {
        self.cviItem = cviItem
        self.label = label
        self.type = type
        self.value = value
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case cviItem
        case label
        case type
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        cviItem = try container.decodeArrayIfPresent(.cviItem)
        label = try container.decodeIfPresent(.label)
        type = try container.decodeIfPresent(.type)
        value = try container.decodeIfPresent(.value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(cviItem, forKey: .cviItem)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(value, forKey: .value)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCviElement else { return false }
      guard self.cviItem == object.cviItem else { return false }
      guard self.label == object.label else { return false }
      guard self.type == object.type else { return false }
      guard self.value == object.value else { return false }
      return true
    }

    public static func == (lhs: SKRCviElement, rhs: SKRCviElement) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

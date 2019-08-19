/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCrit: StargateKitModel {

    public var label: String?

    public var norm: String?

    public var type: String?

    public init(label: String? = nil, norm: String? = nil, type: String? = nil) {
        self.label = label
        self.norm = norm
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case norm
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        norm = try container.decodeIfPresent(.norm)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(norm, forKey: .norm)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCrit else { return false }
      guard self.label == object.label else { return false }
      guard self.norm == object.norm else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRCrit, rhs: SKRCrit) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

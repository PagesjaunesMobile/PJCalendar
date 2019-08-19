/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFilters: StargateKitModel {

    public var filter: [SKRFilter]?

    public var group: String?

    public var label: String?

    public var multi: String?

    public var type: String?

    public init(filter: [SKRFilter]? = nil, group: String? = nil, label: String? = nil, multi: String? = nil, type: String? = nil) {
        self.filter = filter
        self.group = group
        self.label = label
        self.multi = multi
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case filter
        case group
        case label
        case multi
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        filter = try container.decodeArrayIfPresent(.filter)
        group = try container.decodeIfPresent(.group)
        label = try container.decodeIfPresent(.label)
        multi = try container.decodeIfPresent(.multi)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(filter, forKey: .filter)
        try container.encodeIfPresent(group, forKey: .group)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(multi, forKey: .multi)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFilters else { return false }
      guard self.filter == object.filter else { return false }
      guard self.group == object.group else { return false }
      guard self.label == object.label else { return false }
      guard self.multi == object.multi else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRFilters, rhs: SKRFilters) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

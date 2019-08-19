/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTeaser: StargateKitModel {

    public var descType: String?

    public var id: String?

    public var label: String?

    public var source: String?

    public init(descType: String? = nil, id: String? = nil, label: String? = nil, source: String? = nil) {
        self.descType = descType
        self.id = id
        self.label = label
        self.source = source
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case descType = "desc_type"
        case id
        case label
        case source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        descType = try container.decodeIfPresent(.descType)
        id = try container.decodeIfPresent(.id)
        label = try container.decodeIfPresent(.label)
        source = try container.decodeIfPresent(.source)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(descType, forKey: .descType)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(source, forKey: .source)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTeaser else { return false }
      guard self.descType == object.descType else { return false }
      guard self.id == object.id else { return false }
      guard self.label == object.label else { return false }
      guard self.source == object.source else { return false }
      return true
    }

    public static func == (lhs: SKRTeaser, rhs: SKRTeaser) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

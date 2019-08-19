/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRChampStructure: StargateKitModel {

    public var item: [SKRItemChampStructure]?

    public var lbl: String?

    public var type: String?

    public init(item: [SKRItemChampStructure]? = nil, lbl: String? = nil, type: String? = nil) {
        self.item = item
        self.lbl = lbl
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case item
        case lbl
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        item = try container.decodeArrayIfPresent(.item)
        lbl = try container.decodeIfPresent(.lbl)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(lbl, forKey: .lbl)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRChampStructure else { return false }
      guard self.item == object.item else { return false }
      guard self.lbl == object.lbl else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRChampStructure, rhs: SKRChampStructure) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

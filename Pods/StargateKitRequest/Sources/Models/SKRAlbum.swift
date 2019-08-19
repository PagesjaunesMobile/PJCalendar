/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAlbum: StargateKitModel {

    public var label: String?

    public var pos: String?

    public var type: String?

    public var typeP: [SKRTypeP]?

    public init(label: String? = nil, pos: String? = nil, type: String? = nil, typeP: [SKRTypeP]? = nil) {
        self.label = label
        self.pos = pos
        self.type = type
        self.typeP = typeP
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case pos
        case type
        case typeP
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        pos = try container.decodeIfPresent(.pos)
        type = try container.decodeIfPresent(.type)
        typeP = try container.decodeArrayIfPresent(.typeP)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(pos, forKey: .pos)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(typeP, forKey: .typeP)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAlbum else { return false }
      guard self.label == object.label else { return false }
      guard self.pos == object.pos else { return false }
      guard self.type == object.type else { return false }
      guard self.typeP == object.typeP else { return false }
      return true
    }

    public static func == (lhs: SKRAlbum, rhs: SKRAlbum) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

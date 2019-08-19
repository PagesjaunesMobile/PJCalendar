/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCategories: StargateKitModel {

    public var categorie: [SKRCategorie]?

    public var label: String?

    public var visible: Int?

    public init(categorie: [SKRCategorie]? = nil, label: String? = nil, visible: Int? = nil) {
        self.categorie = categorie
        self.label = label
        self.visible = visible
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case categorie
        case label
        case visible
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        categorie = try container.decodeArrayIfPresent(.categorie)
        label = try container.decodeIfPresent(.label)
        visible = try container.decodeIfPresent(.visible)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(categorie, forKey: .categorie)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(visible, forKey: .visible)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCategories else { return false }
      guard self.categorie == object.categorie else { return false }
      guard self.label == object.label else { return false }
      guard self.visible == object.visible else { return false }
      return true
    }

    public static func == (lhs: SKRCategories, rhs: SKRCategories) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

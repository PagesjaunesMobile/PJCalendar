/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDispoSanteCategories: StargateKitModel {

    public var category: [SKRItemTransac]?

    public var stitle: String?

    public init(category: [SKRItemTransac]? = nil, stitle: String? = nil) {
        self.category = category
        self.stitle = stitle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case category
        case stitle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        category = try container.decodeArrayIfPresent(.category)
        stitle = try container.decodeIfPresent(.stitle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(stitle, forKey: .stitle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDispoSanteCategories else { return false }
      guard self.category == object.category else { return false }
      guard self.stitle == object.stitle else { return false }
      return true
    }

    public static func == (lhs: SKRDispoSanteCategories, rhs: SKRDispoSanteCategories) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

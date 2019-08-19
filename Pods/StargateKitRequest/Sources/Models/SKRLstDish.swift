/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLstDish: StargateKitModel {

    public var dish: [SKRDish]

    public var title: String?

    public init(dish: [SKRDish], title: String? = nil) {
        self.dish = dish
        self.title = title
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dish
        case title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dish = try container.decodeArray(.dish)
        title = try container.decodeIfPresent(.title)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(dish, forKey: .dish)
        try container.encodeIfPresent(title, forKey: .title)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLstDish else { return false }
      guard self.dish == object.dish else { return false }
      guard self.title == object.title else { return false }
      return true
    }

    public static func == (lhs: SKRLstDish, rhs: SKRLstDish) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

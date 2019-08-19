/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDish: StargateKitModel {

    public var desc: String?

    public var price: String?

    public init(desc: String? = nil, price: String? = nil) {
        self.desc = desc
        self.price = price
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case desc
        case price
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        desc = try container.decodeIfPresent(.desc)
        price = try container.decodeIfPresent(.price)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(desc, forKey: .desc)
        try container.encodeIfPresent(price, forKey: .price)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDish else { return false }
      guard self.desc == object.desc else { return false }
      guard self.price == object.price else { return false }
      return true
    }

    public static func == (lhs: SKRDish, rhs: SKRDish) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTransactionnelOrcAnnuaire: StargateKitModel {

    public var restaurant: SKRTransactionnelRestaurantOrcAnnuaire?

    public init(restaurant: SKRTransactionnelRestaurantOrcAnnuaire? = nil) {
        self.restaurant = restaurant
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case restaurant
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        restaurant = try container.decodeIfPresent(.restaurant)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(restaurant, forKey: .restaurant)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTransactionnelOrcAnnuaire else { return false }
      guard self.restaurant == object.restaurant else { return false }
      return true
    }

    public static func == (lhs: SKRTransactionnelOrcAnnuaire, rhs: SKRTransactionnelOrcAnnuaire) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

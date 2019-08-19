/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTransactionnelOrcFD: StargateKitModel {

    public var restaurant: SKRTransactionnelRestaurantOrcFD?

    public var sante: SKRTransactionnelSanteOrcFD?

    public init(restaurant: SKRTransactionnelRestaurantOrcFD? = nil, sante: SKRTransactionnelSanteOrcFD? = nil) {
        self.restaurant = restaurant
        self.sante = sante
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case restaurant
        case sante
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        restaurant = try container.decodeIfPresent(.restaurant)
        sante = try container.decodeIfPresent(.sante)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(restaurant, forKey: .restaurant)
        try container.encodeIfPresent(sante, forKey: .sante)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTransactionnelOrcFD else { return false }
      guard self.restaurant == object.restaurant else { return false }
      guard self.sante == object.sante else { return false }
      return true
    }

    public static func == (lhs: SKRTransactionnelOrcFD, rhs: SKRTransactionnelOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

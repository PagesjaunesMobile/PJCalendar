/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPromotionsLafourchetteOrcFD: StargateKitModel {

    public var nombreTotalPromotions: Int?

    public var promotions: [SKRPromotionLafourchette]?

    public init(nombreTotalPromotions: Int? = nil, promotions: [SKRPromotionLafourchette]? = nil) {
        self.nombreTotalPromotions = nombreTotalPromotions
        self.promotions = promotions
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nombreTotalPromotions = "nombre_total_promotions"
        case promotions
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nombreTotalPromotions = try container.decodeIfPresent(.nombreTotalPromotions)
        promotions = try container.decodeArrayIfPresent(.promotions)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(nombreTotalPromotions, forKey: .nombreTotalPromotions)
        try container.encodeIfPresent(promotions, forKey: .promotions)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPromotionsLafourchetteOrcFD else { return false }
      guard self.nombreTotalPromotions == object.nombreTotalPromotions else { return false }
      guard self.promotions == object.promotions else { return false }
      return true
    }

    public static func == (lhs: SKRPromotionsLafourchetteOrcFD, rhs: SKRPromotionsLafourchetteOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

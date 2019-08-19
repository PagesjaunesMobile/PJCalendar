/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTransactionnelRestaurantOrcAnnuaire: StargateKitModel {

    public var creneaux: [SKRCreneauDisponibleOrcAnnuaire]?

    public init(creneaux: [SKRCreneauDisponibleOrcAnnuaire]? = nil) {
        self.creneaux = creneaux
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case creneaux
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        creneaux = try container.decodeArrayIfPresent(.creneaux)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(creneaux, forKey: .creneaux)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTransactionnelRestaurantOrcAnnuaire else { return false }
      guard self.creneaux == object.creneaux else { return false }
      return true
    }

    public static func == (lhs: SKRTransactionnelRestaurantOrcAnnuaire, rhs: SKRTransactionnelRestaurantOrcAnnuaire) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

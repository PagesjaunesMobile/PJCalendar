/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDonneesBonsPlansOrcFD: StargateKitModel {

    public var bonsPlans: [SKRBonPlan]?

    public var nombreTotalBonsPlans: Int?

    public init(bonsPlans: [SKRBonPlan]? = nil, nombreTotalBonsPlans: Int? = nil) {
        self.bonsPlans = bonsPlans
        self.nombreTotalBonsPlans = nombreTotalBonsPlans
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case bonsPlans = "bons_plans"
        case nombreTotalBonsPlans = "nombre_total_bons_plans"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        bonsPlans = try container.decodeArrayIfPresent(.bonsPlans)
        nombreTotalBonsPlans = try container.decodeIfPresent(.nombreTotalBonsPlans)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(bonsPlans, forKey: .bonsPlans)
        try container.encodeIfPresent(nombreTotalBonsPlans, forKey: .nombreTotalBonsPlans)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDonneesBonsPlansOrcFD else { return false }
      guard self.bonsPlans == object.bonsPlans else { return false }
      guard self.nombreTotalBonsPlans == object.nombreTotalBonsPlans else { return false }
      return true
    }

    public static func == (lhs: SKRDonneesBonsPlansOrcFD, rhs: SKRDonneesBonsPlansOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

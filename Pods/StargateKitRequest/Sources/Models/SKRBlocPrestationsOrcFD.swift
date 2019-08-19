/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRBlocPrestationsOrcFD: StargateKitModel {

    public var categories: [SKRCategorieOrcFD]?

    public var interventions: [SKRInterventionGenOrcFD]?

    public init(categories: [SKRCategorieOrcFD]? = nil, interventions: [SKRInterventionGenOrcFD]? = nil) {
        self.categories = categories
        self.interventions = interventions
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case categories
        case interventions
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        categories = try container.decodeArrayIfPresent(.categories)
        interventions = try container.decodeArrayIfPresent(.interventions)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(categories, forKey: .categories)
        try container.encodeIfPresent(interventions, forKey: .interventions)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRBlocPrestationsOrcFD else { return false }
      guard self.categories == object.categories else { return false }
      guard self.interventions == object.interventions else { return false }
      return true
    }

    public static func == (lhs: SKRBlocPrestationsOrcFD, rhs: SKRBlocPrestationsOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

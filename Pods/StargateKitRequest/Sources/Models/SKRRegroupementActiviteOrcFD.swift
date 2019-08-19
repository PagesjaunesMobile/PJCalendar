/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRegroupementActiviteOrcFD: StargateKitModel {

    public var isEligibleRemarketing: Bool?

    public var rubriques: [SKRRubriqueApiInscriptionOrcFD]?

    public init(isEligibleRemarketing: Bool? = nil, rubriques: [SKRRubriqueApiInscriptionOrcFD]? = nil) {
        self.isEligibleRemarketing = isEligibleRemarketing
        self.rubriques = rubriques
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case isEligibleRemarketing
        case rubriques
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isEligibleRemarketing = try container.decodeIfPresent(.isEligibleRemarketing)
        rubriques = try container.decodeArrayIfPresent(.rubriques)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(isEligibleRemarketing, forKey: .isEligibleRemarketing)
        try container.encodeIfPresent(rubriques, forKey: .rubriques)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRegroupementActiviteOrcFD else { return false }
      guard self.isEligibleRemarketing == object.isEligibleRemarketing else { return false }
      guard self.rubriques == object.rubriques else { return false }
      return true
    }

    public static func == (lhs: SKRRegroupementActiviteOrcFD, rhs: SKRRegroupementActiviteOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

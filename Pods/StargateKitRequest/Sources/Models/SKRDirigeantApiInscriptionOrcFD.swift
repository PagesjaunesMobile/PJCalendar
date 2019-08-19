/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDirigeantApiInscriptionOrcFD: StargateKitModel {

    public var civiliteNomPrenom: String?

    public var fonction: String?

    public init(civiliteNomPrenom: String? = nil, fonction: String? = nil) {
        self.civiliteNomPrenom = civiliteNomPrenom
        self.fonction = fonction
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case civiliteNomPrenom = "civilite_nom_prenom"
        case fonction
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        civiliteNomPrenom = try container.decodeIfPresent(.civiliteNomPrenom)
        fonction = try container.decodeIfPresent(.fonction)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(civiliteNomPrenom, forKey: .civiliteNomPrenom)
        try container.encodeIfPresent(fonction, forKey: .fonction)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDirigeantApiInscriptionOrcFD else { return false }
      guard self.civiliteNomPrenom == object.civiliteNomPrenom else { return false }
      guard self.fonction == object.fonction else { return false }
      return true
    }

    public static func == (lhs: SKRDirigeantApiInscriptionOrcFD, rhs: SKRDirigeantApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

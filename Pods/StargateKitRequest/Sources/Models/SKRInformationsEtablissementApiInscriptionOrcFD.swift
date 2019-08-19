/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInformationsEtablissementApiInscriptionOrcFD: StargateKitModel {

    public var effectif: String?

    public var effectifDeclare: Int?

    public var naf: String?

    public var siege: Bool?

    public var siret: String?

    public init(effectif: String? = nil, effectifDeclare: Int? = nil, naf: String? = nil, siege: Bool? = nil, siret: String? = nil) {
        self.effectif = effectif
        self.effectifDeclare = effectifDeclare
        self.naf = naf
        self.siege = siege
        self.siret = siret
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case effectif
        case effectifDeclare = "effectif_declare"
        case naf
        case siege
        case siret
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        effectif = try container.decodeIfPresent(.effectif)
        effectifDeclare = try container.decodeIfPresent(.effectifDeclare)
        naf = try container.decodeIfPresent(.naf)
        siege = try container.decodeIfPresent(.siege)
        siret = try container.decodeIfPresent(.siret)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(effectif, forKey: .effectif)
        try container.encodeIfPresent(effectifDeclare, forKey: .effectifDeclare)
        try container.encodeIfPresent(naf, forKey: .naf)
        try container.encodeIfPresent(siege, forKey: .siege)
        try container.encodeIfPresent(siret, forKey: .siret)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInformationsEtablissementApiInscriptionOrcFD else { return false }
      guard self.effectif == object.effectif else { return false }
      guard self.effectifDeclare == object.effectifDeclare else { return false }
      guard self.naf == object.naf else { return false }
      guard self.siege == object.siege else { return false }
      guard self.siret == object.siret else { return false }
      return true
    }

    public static func == (lhs: SKRInformationsEtablissementApiInscriptionOrcFD, rhs: SKRInformationsEtablissementApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

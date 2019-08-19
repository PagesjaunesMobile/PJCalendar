/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRHoraireExceptionnelApiInscriptionOrcFD: StargateKitModel {

    public var creneauHoraire: [SKRCreneauHoraireApiInscriptionOrcFD]?

    public var jour: DateTime?

    public init(creneauHoraire: [SKRCreneauHoraireApiInscriptionOrcFD]? = nil, jour: DateTime? = nil) {
        self.creneauHoraire = creneauHoraire
        self.jour = jour
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case creneauHoraire = "creneau_horaire"
        case jour
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        creneauHoraire = try container.decodeArrayIfPresent(.creneauHoraire)
        jour = try container.decodeIfPresent(.jour)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(creneauHoraire, forKey: .creneauHoraire)
        try container.encodeIfPresent(jour, forKey: .jour)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRHoraireExceptionnelApiInscriptionOrcFD else { return false }
      guard self.creneauHoraire == object.creneauHoraire else { return false }
      guard self.jour == object.jour else { return false }
      return true
    }

    public static func == (lhs: SKRHoraireExceptionnelApiInscriptionOrcFD, rhs: SKRHoraireExceptionnelApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

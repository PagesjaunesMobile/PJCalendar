/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCreneauHoraireApiInscriptionOrcFD: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case defaut = "DEFAUT"
        case avecRdv = "AVEC_RDV"
        case avecSansRdv = "AVEC_SANS_RDV"
    }

    public var heureDebut: String?

    public var heureFin: String?

    public var type: SKRType?

    public init(heureDebut: String? = nil, heureFin: String? = nil, type: SKRType? = nil) {
        self.heureDebut = heureDebut
        self.heureFin = heureFin
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case heureDebut = "heure_debut"
        case heureFin = "heure_fin"
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        heureDebut = try container.decodeIfPresent(.heureDebut)
        heureFin = try container.decodeIfPresent(.heureFin)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(heureDebut, forKey: .heureDebut)
        try container.encodeIfPresent(heureFin, forKey: .heureFin)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCreneauHoraireApiInscriptionOrcFD else { return false }
      guard self.heureDebut == object.heureDebut else { return false }
      guard self.heureFin == object.heureFin else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRCreneauHoraireApiInscriptionOrcFD, rhs: SKRCreneauHoraireApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

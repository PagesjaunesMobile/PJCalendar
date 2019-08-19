/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRChiffresClefsApiInscriptionOrcFD: StargateKitModel {

    public var chiffreAffaire: String?

    public var dateMiseaJour: DateTime?

    public var ebe: String?

    public var evolutionChiffreAffaire: Double?

    public var evolutionEbe: Double?

    public var evolutionResultatNet: Double?

    public var resultatNet: String?

    public init(chiffreAffaire: String? = nil, dateMiseaJour: DateTime? = nil, ebe: String? = nil, evolutionChiffreAffaire: Double? = nil, evolutionEbe: Double? = nil, evolutionResultatNet: Double? = nil, resultatNet: String? = nil) {
        self.chiffreAffaire = chiffreAffaire
        self.dateMiseaJour = dateMiseaJour
        self.ebe = ebe
        self.evolutionChiffreAffaire = evolutionChiffreAffaire
        self.evolutionEbe = evolutionEbe
        self.evolutionResultatNet = evolutionResultatNet
        self.resultatNet = resultatNet
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case chiffreAffaire = "chiffre_affaire"
        case dateMiseaJour = "date_mise_a_jour"
        case ebe
        case evolutionChiffreAffaire = "evolution_chiffre_affaire"
        case evolutionEbe = "evolution_ebe"
        case evolutionResultatNet = "evolution_resultat_net"
        case resultatNet = "resultat_net"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        chiffreAffaire = try container.decodeIfPresent(.chiffreAffaire)
        dateMiseaJour = try container.decodeIfPresent(.dateMiseaJour)
        ebe = try container.decodeIfPresent(.ebe)
        evolutionChiffreAffaire = try container.decodeIfPresent(.evolutionChiffreAffaire)
        evolutionEbe = try container.decodeIfPresent(.evolutionEbe)
        evolutionResultatNet = try container.decodeIfPresent(.evolutionResultatNet)
        resultatNet = try container.decodeIfPresent(.resultatNet)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(chiffreAffaire, forKey: .chiffreAffaire)
        try container.encodeIfPresent(dateMiseaJour, forKey: .dateMiseaJour)
        try container.encodeIfPresent(ebe, forKey: .ebe)
        try container.encodeIfPresent(evolutionChiffreAffaire, forKey: .evolutionChiffreAffaire)
        try container.encodeIfPresent(evolutionEbe, forKey: .evolutionEbe)
        try container.encodeIfPresent(evolutionResultatNet, forKey: .evolutionResultatNet)
        try container.encodeIfPresent(resultatNet, forKey: .resultatNet)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRChiffresClefsApiInscriptionOrcFD else { return false }
      guard self.chiffreAffaire == object.chiffreAffaire else { return false }
      guard self.dateMiseaJour == object.dateMiseaJour else { return false }
      guard self.ebe == object.ebe else { return false }
      guard self.evolutionChiffreAffaire == object.evolutionChiffreAffaire else { return false }
      guard self.evolutionEbe == object.evolutionEbe else { return false }
      guard self.evolutionResultatNet == object.evolutionResultatNet else { return false }
      guard self.resultatNet == object.resultatNet else { return false }
      return true
    }

    public static func == (lhs: SKRChiffresClefsApiInscriptionOrcFD, rhs: SKRChiffresClefsApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

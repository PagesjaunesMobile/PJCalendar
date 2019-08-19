/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAdresseApiInscriptionOrcFD: StargateKitModel {

    public var arrondissement: String?

    public var batiment: String?

    public var boitePostale: String?

    public var codeLocalite: String?

    public var codePostal: String?

    public var complement: String?

    public var libelleLocalite: String?

    public var libellePays: String?

    public var libelleVoie: String?

    public var numeroVoie: String?

    public init(arrondissement: String? = nil, batiment: String? = nil, boitePostale: String? = nil, codeLocalite: String? = nil, codePostal: String? = nil, complement: String? = nil, libelleLocalite: String? = nil, libellePays: String? = nil, libelleVoie: String? = nil, numeroVoie: String? = nil) {
        self.arrondissement = arrondissement
        self.batiment = batiment
        self.boitePostale = boitePostale
        self.codeLocalite = codeLocalite
        self.codePostal = codePostal
        self.complement = complement
        self.libelleLocalite = libelleLocalite
        self.libellePays = libellePays
        self.libelleVoie = libelleVoie
        self.numeroVoie = numeroVoie
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case arrondissement
        case batiment
        case boitePostale = "boite_postale"
        case codeLocalite = "code_localite"
        case codePostal = "code_postal"
        case complement
        case libelleLocalite = "libelle_localite"
        case libellePays = "libelle_pays"
        case libelleVoie = "libelle_voie"
        case numeroVoie = "numero_voie"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        arrondissement = try container.decodeIfPresent(.arrondissement)
        batiment = try container.decodeIfPresent(.batiment)
        boitePostale = try container.decodeIfPresent(.boitePostale)
        codeLocalite = try container.decodeIfPresent(.codeLocalite)
        codePostal = try container.decodeIfPresent(.codePostal)
        complement = try container.decodeIfPresent(.complement)
        libelleLocalite = try container.decodeIfPresent(.libelleLocalite)
        libellePays = try container.decodeIfPresent(.libellePays)
        libelleVoie = try container.decodeIfPresent(.libelleVoie)
        numeroVoie = try container.decodeIfPresent(.numeroVoie)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(arrondissement, forKey: .arrondissement)
        try container.encodeIfPresent(batiment, forKey: .batiment)
        try container.encodeIfPresent(boitePostale, forKey: .boitePostale)
        try container.encodeIfPresent(codeLocalite, forKey: .codeLocalite)
        try container.encodeIfPresent(codePostal, forKey: .codePostal)
        try container.encodeIfPresent(complement, forKey: .complement)
        try container.encodeIfPresent(libelleLocalite, forKey: .libelleLocalite)
        try container.encodeIfPresent(libellePays, forKey: .libellePays)
        try container.encodeIfPresent(libelleVoie, forKey: .libelleVoie)
        try container.encodeIfPresent(numeroVoie, forKey: .numeroVoie)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAdresseApiInscriptionOrcFD else { return false }
      guard self.arrondissement == object.arrondissement else { return false }
      guard self.batiment == object.batiment else { return false }
      guard self.boitePostale == object.boitePostale else { return false }
      guard self.codeLocalite == object.codeLocalite else { return false }
      guard self.codePostal == object.codePostal else { return false }
      guard self.complement == object.complement else { return false }
      guard self.libelleLocalite == object.libelleLocalite else { return false }
      guard self.libellePays == object.libellePays else { return false }
      guard self.libelleVoie == object.libelleVoie else { return false }
      guard self.numeroVoie == object.numeroVoie else { return false }
      return true
    }

    public static func == (lhs: SKRAdresseApiInscriptionOrcFD, rhs: SKRAdresseApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

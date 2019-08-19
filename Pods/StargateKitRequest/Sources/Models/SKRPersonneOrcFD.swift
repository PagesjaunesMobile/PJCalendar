/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPersonneOrcFD: StargateKitModel {

    public var activite: String?

    public var administration: String?

    public var adresse: String?

    public var capital: String?

    public var denomination: String?

    public var denominationEirl: String?

    public var enseigne: String?

    public var formeJuridique: String?

    public var immatriculation: String?

    public var nationalite: String?

    public var nom: String?

    public var nomCommercial: String?

    public var nomUsage: String?

    public var prenoms: String?

    public var pseudonyme: String?

    public var registreMetiers: String?

    public var sigle: String?

    public init(activite: String? = nil, administration: String? = nil, adresse: String? = nil, capital: String? = nil, denomination: String? = nil, denominationEirl: String? = nil, enseigne: String? = nil, formeJuridique: String? = nil, immatriculation: String? = nil, nationalite: String? = nil, nom: String? = nil, nomCommercial: String? = nil, nomUsage: String? = nil, prenoms: String? = nil, pseudonyme: String? = nil, registreMetiers: String? = nil, sigle: String? = nil) {
        self.activite = activite
        self.administration = administration
        self.adresse = adresse
        self.capital = capital
        self.denomination = denomination
        self.denominationEirl = denominationEirl
        self.enseigne = enseigne
        self.formeJuridique = formeJuridique
        self.immatriculation = immatriculation
        self.nationalite = nationalite
        self.nom = nom
        self.nomCommercial = nomCommercial
        self.nomUsage = nomUsage
        self.prenoms = prenoms
        self.pseudonyme = pseudonyme
        self.registreMetiers = registreMetiers
        self.sigle = sigle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case activite
        case administration
        case adresse
        case capital
        case denomination
        case denominationEirl = "denomination_eirl"
        case enseigne
        case formeJuridique = "forme_juridique"
        case immatriculation
        case nationalite
        case nom
        case nomCommercial = "nom_commercial"
        case nomUsage = "nom_usage"
        case prenoms
        case pseudonyme
        case registreMetiers = "registre_metiers"
        case sigle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        activite = try container.decodeIfPresent(.activite)
        administration = try container.decodeIfPresent(.administration)
        adresse = try container.decodeIfPresent(.adresse)
        capital = try container.decodeIfPresent(.capital)
        denomination = try container.decodeIfPresent(.denomination)
        denominationEirl = try container.decodeIfPresent(.denominationEirl)
        enseigne = try container.decodeIfPresent(.enseigne)
        formeJuridique = try container.decodeIfPresent(.formeJuridique)
        immatriculation = try container.decodeIfPresent(.immatriculation)
        nationalite = try container.decodeIfPresent(.nationalite)
        nom = try container.decodeIfPresent(.nom)
        nomCommercial = try container.decodeIfPresent(.nomCommercial)
        nomUsage = try container.decodeIfPresent(.nomUsage)
        prenoms = try container.decodeIfPresent(.prenoms)
        pseudonyme = try container.decodeIfPresent(.pseudonyme)
        registreMetiers = try container.decodeIfPresent(.registreMetiers)
        sigle = try container.decodeIfPresent(.sigle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(activite, forKey: .activite)
        try container.encodeIfPresent(administration, forKey: .administration)
        try container.encodeIfPresent(adresse, forKey: .adresse)
        try container.encodeIfPresent(capital, forKey: .capital)
        try container.encodeIfPresent(denomination, forKey: .denomination)
        try container.encodeIfPresent(denominationEirl, forKey: .denominationEirl)
        try container.encodeIfPresent(enseigne, forKey: .enseigne)
        try container.encodeIfPresent(formeJuridique, forKey: .formeJuridique)
        try container.encodeIfPresent(immatriculation, forKey: .immatriculation)
        try container.encodeIfPresent(nationalite, forKey: .nationalite)
        try container.encodeIfPresent(nom, forKey: .nom)
        try container.encodeIfPresent(nomCommercial, forKey: .nomCommercial)
        try container.encodeIfPresent(nomUsage, forKey: .nomUsage)
        try container.encodeIfPresent(prenoms, forKey: .prenoms)
        try container.encodeIfPresent(pseudonyme, forKey: .pseudonyme)
        try container.encodeIfPresent(registreMetiers, forKey: .registreMetiers)
        try container.encodeIfPresent(sigle, forKey: .sigle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPersonneOrcFD else { return false }
      guard self.activite == object.activite else { return false }
      guard self.administration == object.administration else { return false }
      guard self.adresse == object.adresse else { return false }
      guard self.capital == object.capital else { return false }
      guard self.denomination == object.denomination else { return false }
      guard self.denominationEirl == object.denominationEirl else { return false }
      guard self.enseigne == object.enseigne else { return false }
      guard self.formeJuridique == object.formeJuridique else { return false }
      guard self.immatriculation == object.immatriculation else { return false }
      guard self.nationalite == object.nationalite else { return false }
      guard self.nom == object.nom else { return false }
      guard self.nomCommercial == object.nomCommercial else { return false }
      guard self.nomUsage == object.nomUsage else { return false }
      guard self.prenoms == object.prenoms else { return false }
      guard self.pseudonyme == object.pseudonyme else { return false }
      guard self.registreMetiers == object.registreMetiers else { return false }
      guard self.sigle == object.sigle else { return false }
      return true
    }

    public static func == (lhs: SKRPersonneOrcFD, rhs: SKRPersonneOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

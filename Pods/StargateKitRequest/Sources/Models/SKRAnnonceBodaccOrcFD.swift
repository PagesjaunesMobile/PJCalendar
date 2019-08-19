/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAnnonceBodaccOrcFD: StargateKitModel {

    public enum SKROrigine: String, Codable, Hashable, CaseIterable {
        case rcsABxa = "RCS_A_BXA"
        case rcsBBxb = "RCS_B_BXB"
        case pclBxa = "PCL_BXA"
        case bilanBxc = "BILAN_BXC"
    }

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case annonce = "ANNONCE"
        case creation = "CREATION"
        case rectificatif = "RECTIFICATIF"
        case annulation = "ANNULATION"
    }

    public var acte: SKRActeOrcFD?

    public var adresse: String?

    public var avisPrecedent: SKRAvisPrecedentOrcFD?

    public var dateParution: String?

    public var denomination: String?

    public var depot: SKRDepotOrcFD?

    public var etablissements: [SKREtablissementBodaccOrcFD]?

    public var immatriculation: String?

    public var jugement: SKRJugementOrcFD?

    public var origine: SKROrigine?

    public var parution: String?

    public var personnes: [SKRPersonneOrcFD]?

    public var precedentsExploitants: [SKRPersonneOrcFD]?

    public var precedentsProprietaires: [SKRPersonneOrcFD]?

    public var type: SKRType?

    public init(acte: SKRActeOrcFD? = nil, adresse: String? = nil, avisPrecedent: SKRAvisPrecedentOrcFD? = nil, dateParution: String? = nil, denomination: String? = nil, depot: SKRDepotOrcFD? = nil, etablissements: [SKREtablissementBodaccOrcFD]? = nil, immatriculation: String? = nil, jugement: SKRJugementOrcFD? = nil, origine: SKROrigine? = nil, parution: String? = nil, personnes: [SKRPersonneOrcFD]? = nil, precedentsExploitants: [SKRPersonneOrcFD]? = nil, precedentsProprietaires: [SKRPersonneOrcFD]? = nil, type: SKRType? = nil) {
        self.acte = acte
        self.adresse = adresse
        self.avisPrecedent = avisPrecedent
        self.dateParution = dateParution
        self.denomination = denomination
        self.depot = depot
        self.etablissements = etablissements
        self.immatriculation = immatriculation
        self.jugement = jugement
        self.origine = origine
        self.parution = parution
        self.personnes = personnes
        self.precedentsExploitants = precedentsExploitants
        self.precedentsProprietaires = precedentsProprietaires
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case acte
        case adresse
        case avisPrecedent = "avis_precedent"
        case dateParution = "date_parution"
        case denomination
        case depot
        case etablissements
        case immatriculation
        case jugement
        case origine
        case parution
        case personnes
        case precedentsExploitants = "precedents_exploitants"
        case precedentsProprietaires = "precedents_proprietaires"
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        acte = try container.decodeIfPresent(.acte)
        adresse = try container.decodeIfPresent(.adresse)
        avisPrecedent = try container.decodeIfPresent(.avisPrecedent)
        dateParution = try container.decodeIfPresent(.dateParution)
        denomination = try container.decodeIfPresent(.denomination)
        depot = try container.decodeIfPresent(.depot)
        etablissements = try container.decodeArrayIfPresent(.etablissements)
        immatriculation = try container.decodeIfPresent(.immatriculation)
        jugement = try container.decodeIfPresent(.jugement)
        origine = try container.decodeIfPresent(.origine)
        parution = try container.decodeIfPresent(.parution)
        personnes = try container.decodeArrayIfPresent(.personnes)
        precedentsExploitants = try container.decodeArrayIfPresent(.precedentsExploitants)
        precedentsProprietaires = try container.decodeArrayIfPresent(.precedentsProprietaires)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(acte, forKey: .acte)
        try container.encodeIfPresent(adresse, forKey: .adresse)
        try container.encodeIfPresent(avisPrecedent, forKey: .avisPrecedent)
        try container.encodeIfPresent(dateParution, forKey: .dateParution)
        try container.encodeIfPresent(denomination, forKey: .denomination)
        try container.encodeIfPresent(depot, forKey: .depot)
        try container.encodeIfPresent(etablissements, forKey: .etablissements)
        try container.encodeIfPresent(immatriculation, forKey: .immatriculation)
        try container.encodeIfPresent(jugement, forKey: .jugement)
        try container.encodeIfPresent(origine, forKey: .origine)
        try container.encodeIfPresent(parution, forKey: .parution)
        try container.encodeIfPresent(personnes, forKey: .personnes)
        try container.encodeIfPresent(precedentsExploitants, forKey: .precedentsExploitants)
        try container.encodeIfPresent(precedentsProprietaires, forKey: .precedentsProprietaires)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAnnonceBodaccOrcFD else { return false }
      guard self.acte == object.acte else { return false }
      guard self.adresse == object.adresse else { return false }
      guard self.avisPrecedent == object.avisPrecedent else { return false }
      guard self.dateParution == object.dateParution else { return false }
      guard self.denomination == object.denomination else { return false }
      guard self.depot == object.depot else { return false }
      guard self.etablissements == object.etablissements else { return false }
      guard self.immatriculation == object.immatriculation else { return false }
      guard self.jugement == object.jugement else { return false }
      guard self.origine == object.origine else { return false }
      guard self.parution == object.parution else { return false }
      guard self.personnes == object.personnes else { return false }
      guard self.precedentsExploitants == object.precedentsExploitants else { return false }
      guard self.precedentsProprietaires == object.precedentsProprietaires else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRAnnonceBodaccOrcFD, rhs: SKRAnnonceBodaccOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

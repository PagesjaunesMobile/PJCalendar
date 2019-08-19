/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREquipementsSportifsOrcFD: StargateKitModel {

    public enum SKRTypeSource: String, Codable, Hashable, CaseIterable {
        case cviv = "CVIV"
        case dv = "DV"
        case de = "DE"
        case partenaire = "PARTENAIRE"
        case search = "SEARCH"
        case ameli = "AMELI"
    }

    public var activites: [String]?

    public var affichageSeo: Bool?

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var dateMiseaJour: DateTime?

    public var listeCodesRubriques: [String]?

    public var typeSource: SKRTypeSource?

    public init(activites: [String]? = nil, affichageSeo: Bool? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, dateMiseaJour: DateTime? = nil, listeCodesRubriques: [String]? = nil, typeSource: SKRTypeSource? = nil) {
        self.activites = activites
        self.affichageSeo = affichageSeo
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.dateMiseaJour = dateMiseaJour
        self.listeCodesRubriques = listeCodesRubriques
        self.typeSource = typeSource
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case activites
        case affichageSeo = "affichage_seo"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case dateMiseaJour = "date_mise_a_jour"
        case listeCodesRubriques
        case typeSource = "type_source"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        activites = try container.decodeArrayIfPresent(.activites)
        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        dateMiseaJour = try container.decodeIfPresent(.dateMiseaJour)
        listeCodesRubriques = try container.decodeArrayIfPresent(.listeCodesRubriques)
        typeSource = try container.decodeIfPresent(.typeSource)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(activites, forKey: .activites)
        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(dateMiseaJour, forKey: .dateMiseaJour)
        try container.encodeIfPresent(listeCodesRubriques, forKey: .listeCodesRubriques)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREquipementsSportifsOrcFD else { return false }
      guard self.activites == object.activites else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.dateMiseaJour == object.dateMiseaJour else { return false }
      guard self.listeCodesRubriques == object.listeCodesRubriques else { return false }
      guard self.typeSource == object.typeSource else { return false }
      return true
    }

    public static func == (lhs: SKREquipementsSportifsOrcFD, rhs: SKREquipementsSportifsOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

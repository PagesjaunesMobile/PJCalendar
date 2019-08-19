/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMasquableSEOElementListeOrcFDCategorieOrcFD: StargateKitModel {

    public enum SKRTypeSource: String, Codable, Hashable, CaseIterable {
        case cviv = "CVIV"
        case dv = "DV"
        case de = "DE"
        case partenaire = "PARTENAIRE"
        case search = "SEARCH"
        case ameli = "AMELI"
    }

    public var affichageSeo: Bool?

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var typeSource: SKRTypeSource?

    public var valeurs: [SKRCategorieOrcFD]?

    public init(affichageSeo: Bool? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, typeSource: SKRTypeSource? = nil, valeurs: [SKRCategorieOrcFD]? = nil) {
        self.affichageSeo = affichageSeo
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.typeSource = typeSource
        self.valeurs = valeurs
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case typeSource = "type_source"
        case valeurs
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        typeSource = try container.decodeIfPresent(.typeSource)
        valeurs = try container.decodeArrayIfPresent(.valeurs)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
        try container.encodeIfPresent(valeurs, forKey: .valeurs)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMasquableSEOElementListeOrcFDCategorieOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.typeSource == object.typeSource else { return false }
      guard self.valeurs == object.valeurs else { return false }
      return true
    }

    public static func == (lhs: SKRMasquableSEOElementListeOrcFDCategorieOrcFD, rhs: SKRMasquableSEOElementListeOrcFDCategorieOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

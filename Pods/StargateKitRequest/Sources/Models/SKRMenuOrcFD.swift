/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMenuOrcFD: StargateKitModel {

    public enum SKRTypeMenu: String, Codable, Hashable, CaseIterable {
        case laFourchette = "LA_FOURCHETTE"
        case pvi = "PVI"
    }

    public enum SKRTypeSource: String, Codable, Hashable, CaseIterable {
        case cviv = "CVIV"
        case dv = "DV"
        case de = "DE"
        case partenaire = "PARTENAIRE"
        case search = "SEARCH"
        case ameli = "AMELI"
    }

    public var affichageSeo: Bool?

    public var cartes: [SKRCarteApiInscriptionOrcFD]?

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var formules: [SKRFormuleApiInscriptionOrcFD]?

    public var typeMenu: SKRTypeMenu?

    public var typeSource: SKRTypeSource?

    public init(affichageSeo: Bool? = nil, cartes: [SKRCarteApiInscriptionOrcFD]? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, formules: [SKRFormuleApiInscriptionOrcFD]? = nil, typeMenu: SKRTypeMenu? = nil, typeSource: SKRTypeSource? = nil) {
        self.affichageSeo = affichageSeo
        self.cartes = cartes
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.formules = formules
        self.typeMenu = typeMenu
        self.typeSource = typeSource
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case cartes
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case formules
        case typeMenu = "type_menu"
        case typeSource = "type_source"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        cartes = try container.decodeArrayIfPresent(.cartes)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        formules = try container.decodeArrayIfPresent(.formules)
        typeMenu = try container.decodeIfPresent(.typeMenu)
        typeSource = try container.decodeIfPresent(.typeSource)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(cartes, forKey: .cartes)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(formules, forKey: .formules)
        try container.encodeIfPresent(typeMenu, forKey: .typeMenu)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMenuOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.cartes == object.cartes else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.formules == object.formules else { return false }
      guard self.typeMenu == object.typeMenu else { return false }
      guard self.typeSource == object.typeSource else { return false }
      return true
    }

    public static func == (lhs: SKRMenuOrcFD, rhs: SKRMenuOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

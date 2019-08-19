/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLienVersSiteReseauSocialOrcFD: StargateKitModel {

    public enum SKRBrouillageSeo: String, Codable, Hashable, CaseIterable {
        case aucun = "AUCUN"
        case basique = "BASIQUE"
    }

    public enum SKRTypeLien: String, Codable, Hashable, CaseIterable {
        case lienVersSitePartenaire = "LIEN_VERS_SITE_PARTENAIRE"
        case sitePrivilege = "SITE_PRIVILEGE"
        case sitePrivilegeOptLienSupplementaire = "SITE_PRIVILEGE_OPT_LIEN_SUPPLEMENTAIRE"
        case pvi = "PVI"
        case leadformance = "LEADFORMANCE"
        case standard = "STANDARD"
        case sitePresence = "SITE_PRESENCE"
        case pviChute = "PVI_CHUTE"
        case lvsGratuitPvi = "LVS_GRATUIT_PVI"
        case lvsGratuitSelfcare = "LVS_GRATUIT_SELFCARE"
        case lvsGratuitHistorique = "LVS_GRATUIT_HISTORIQUE"
        case facebookPayant = "FACEBOOK_PAYANT"
        case facebookGratuit = "FACEBOOK_GRATUIT"
        case facebook = "FACEBOOK"
        case twitter = "TWITTER"
        case blog = "BLOG"
        case viadeo = "VIADEO"
        case linkedin = "LINKEDIN"
        case xing = "XING"
        case sitePremium = "SITE_PREMIUM"
        case siteStarter = "SITE_STARTER"
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

    public var brouillageSeo: SKRBrouillageSeo?

    public var codesRubriques: [String]?

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var libelle: String?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var typeLien: SKRTypeLien?

    public var typeSource: SKRTypeSource?

    public var url: String?

    public init(affichageSeo: Bool? = nil, brouillageSeo: SKRBrouillageSeo? = nil, codesRubriques: [String]? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, libelle: String? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, typeLien: SKRTypeLien? = nil, typeSource: SKRTypeSource? = nil, url: String? = nil) {
        self.affichageSeo = affichageSeo
        self.brouillageSeo = brouillageSeo
        self.codesRubriques = codesRubriques
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.libelle = libelle
        self.produitPublicitaire = produitPublicitaire
        self.typeLien = typeLien
        self.typeSource = typeSource
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case brouillageSeo = "brouillage_seo"
        case codesRubriques = "codes_rubriques"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case libelle
        case produitPublicitaire = "produit_publicitaire"
        case typeLien = "type_lien"
        case typeSource = "type_source"
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        brouillageSeo = try container.decodeIfPresent(.brouillageSeo)
        codesRubriques = try container.decodeArrayIfPresent(.codesRubriques)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        libelle = try container.decodeIfPresent(.libelle)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        typeLien = try container.decodeIfPresent(.typeLien)
        typeSource = try container.decodeIfPresent(.typeSource)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(brouillageSeo, forKey: .brouillageSeo)
        try container.encodeIfPresent(codesRubriques, forKey: .codesRubriques)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(typeLien, forKey: .typeLien)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLienVersSiteReseauSocialOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.brouillageSeo == object.brouillageSeo else { return false }
      guard self.codesRubriques == object.codesRubriques else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.typeLien == object.typeLien else { return false }
      guard self.typeSource == object.typeSource else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRLienVersSiteReseauSocialOrcFD, rhs: SKRLienVersSiteReseauSocialOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

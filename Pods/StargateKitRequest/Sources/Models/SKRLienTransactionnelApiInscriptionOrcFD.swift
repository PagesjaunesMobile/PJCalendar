/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLienTransactionnelApiInscriptionOrcFD: StargateKitModel {

    public enum SKRTypeLien: String, Codable, Hashable, CaseIterable {
        case sitePrivilege = "SITE_PRIVILEGE"
        case sitePrivilegeOptLienSupplementaire = "SITE_PRIVILEGE_OPT_LIEN_SUPPLEMENTAIRE"
        case pvi = "PVI"
        case leadformance = "LEADFORMANCE"
        case lienVersSite = "LIEN_VERS_SITE"
        case lienVersSitePartenaire = "LIEN_VERS_SITE_PARTENAIRE"
        case siteWebPayant = "SITE_WEB_PAYANT"
        case siteWebGratuit = "SITE_WEB_GRATUIT"
        case transactionnel = "TRANSACTIONNEL"
        case reseauxSociaux = "RESEAUX_SOCIAUX"
        case laFourchette = "LA_FOURCHETTE"
        case sitePremium = "SITE_PREMIUM"
        case siteStarter = "SITE_STARTER"
    }

    public enum SKRTypeLienTransactionnel: String, Codable, Hashable, CaseIterable {
        case commander = "COMMANDER"
        case prendreRdvExterne = "PRENDRE_RDV_EXTERNE"
        case prendreRdvClicRdv = "PRENDRE_RDV_CLIC_RDV"
        case reserver = "RESERVER"
        case reserverAccor = "RESERVER_ACCOR"
        case reserverLaFourchette = "RESERVER_LA_FOURCHETTE"
        case reserverLaFourchetteSimple = "RESERVER_LA_FOURCHETTE_SIMPLE"
        case reserverClicrdv = "RESERVER_CLICRDV"
        case reserverChambre = "RESERVER_CHAMBRE"
        case devis = "DEVIS"
        case estimerBien = "ESTIMER_BIEN"
        case consulterCatalogue = "CONSULTER_CATALOGUE"
        case telechargerCatalogue = "TELECHARGER_CATALOGUE"
        case demanderCatalogue = "DEMANDER_CATALOGUE"
        case faireUnDonMailForGood = "FAIRE_UN_DON_MAIL_FOR_GOOD"
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

    public var codeEtablissement: [String]?

    public var codeRubrique: [String]?

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var identifiant: String?

    public var libelle: String?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var typeLien: SKRTypeLien?

    public var typeLienTransactionnel: SKRTypeLienTransactionnel?

    public var typeSource: SKRTypeSource?

    public var url: String?

    public init(affichageSeo: Bool? = nil, codeEtablissement: [String]? = nil, codeRubrique: [String]? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, identifiant: String? = nil, libelle: String? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, typeLien: SKRTypeLien? = nil, typeLienTransactionnel: SKRTypeLienTransactionnel? = nil, typeSource: SKRTypeSource? = nil, url: String? = nil) {
        self.affichageSeo = affichageSeo
        self.codeEtablissement = codeEtablissement
        self.codeRubrique = codeRubrique
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.identifiant = identifiant
        self.libelle = libelle
        self.produitPublicitaire = produitPublicitaire
        self.typeLien = typeLien
        self.typeLienTransactionnel = typeLienTransactionnel
        self.typeSource = typeSource
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case codeEtablissement = "code_etablissement"
        case codeRubrique = "code_rubrique"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case identifiant
        case libelle
        case produitPublicitaire = "produit_publicitaire"
        case typeLien = "type_lien"
        case typeLienTransactionnel = "type_lien_transactionnel"
        case typeSource = "type_source"
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        codeEtablissement = try container.decodeArrayIfPresent(.codeEtablissement)
        codeRubrique = try container.decodeArrayIfPresent(.codeRubrique)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        identifiant = try container.decodeIfPresent(.identifiant)
        libelle = try container.decodeIfPresent(.libelle)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        typeLien = try container.decodeIfPresent(.typeLien)
        typeLienTransactionnel = try container.decodeIfPresent(.typeLienTransactionnel)
        typeSource = try container.decodeIfPresent(.typeSource)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(codeEtablissement, forKey: .codeEtablissement)
        try container.encodeIfPresent(codeRubrique, forKey: .codeRubrique)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(identifiant, forKey: .identifiant)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(typeLien, forKey: .typeLien)
        try container.encodeIfPresent(typeLienTransactionnel, forKey: .typeLienTransactionnel)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLienTransactionnelApiInscriptionOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.codeEtablissement == object.codeEtablissement else { return false }
      guard self.codeRubrique == object.codeRubrique else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.identifiant == object.identifiant else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.typeLien == object.typeLien else { return false }
      guard self.typeLienTransactionnel == object.typeLienTransactionnel else { return false }
      guard self.typeSource == object.typeSource else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRLienTransactionnelApiInscriptionOrcFD, rhs: SKRLienTransactionnelApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

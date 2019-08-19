/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDonneesSousTitresOrcFD: StargateKitModel {

    public enum SKRTypeProfilFiltrage: String, Codable, Hashable, CaseIterable {
        case fixe = "FIXE"
        case mobile = "MOBILE"
        case mappy = "MAPPY"
        case pfLogoPhoto = "PF_LOGO_PHOTO"
        case forceExclusion = "FORCE_EXCLUSION"
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

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var editable: Bool?

    public var libelleLogos: [SKRLibelleLogoOrcFD]?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var sousTitre: String?

    public var typeProfilFiltrage: SKRTypeProfilFiltrage?

    public var typeSource: SKRTypeSource?

    public init(affichageSeo: Bool? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, editable: Bool? = nil, libelleLogos: [SKRLibelleLogoOrcFD]? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, sousTitre: String? = nil, typeProfilFiltrage: SKRTypeProfilFiltrage? = nil, typeSource: SKRTypeSource? = nil) {
        self.affichageSeo = affichageSeo
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.editable = editable
        self.libelleLogos = libelleLogos
        self.produitPublicitaire = produitPublicitaire
        self.sousTitre = sousTitre
        self.typeProfilFiltrage = typeProfilFiltrage
        self.typeSource = typeSource
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case editable
        case libelleLogos
        case produitPublicitaire = "produit_publicitaire"
        case sousTitre = "sous_titre"
        case typeProfilFiltrage = "type_profil_filtrage"
        case typeSource = "type_source"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        editable = try container.decodeIfPresent(.editable)
        libelleLogos = try container.decodeArrayIfPresent(.libelleLogos)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        sousTitre = try container.decodeIfPresent(.sousTitre)
        typeProfilFiltrage = try container.decodeIfPresent(.typeProfilFiltrage)
        typeSource = try container.decodeIfPresent(.typeSource)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(editable, forKey: .editable)
        try container.encodeIfPresent(libelleLogos, forKey: .libelleLogos)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(sousTitre, forKey: .sousTitre)
        try container.encodeIfPresent(typeProfilFiltrage, forKey: .typeProfilFiltrage)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDonneesSousTitresOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.editable == object.editable else { return false }
      guard self.libelleLogos == object.libelleLogos else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.sousTitre == object.sousTitre else { return false }
      guard self.typeProfilFiltrage == object.typeProfilFiltrage else { return false }
      guard self.typeSource == object.typeSource else { return false }
      return true
    }

    public static func == (lhs: SKRDonneesSousTitresOrcFD, rhs: SKRDonneesSousTitresOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

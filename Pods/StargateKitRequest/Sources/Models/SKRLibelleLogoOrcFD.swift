/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLibelleLogoOrcFD: StargateKitModel {

    public enum SKRTypeEtablissement: String, Codable, Hashable, CaseIterable {
        case hotel = "HOTEL"
        case chambreHote = "CHAMBRE_HOTE"
        case gite = "GITE"
        case camping = "CAMPING"
        case restaurant = "RESTAURANT"
    }

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

    public var description: String?

    public var editable: Bool?

    public var id14f: String?

    public var libelle: String?

    public var listeCodesRubriques: [String]?

    public var logo: String?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var type14f: Bool?

    public var typeEtablissement: SKRTypeEtablissement?

    public var typeProfilFiltrage: SKRTypeProfilFiltrage?

    public var typeSource: SKRTypeSource?

    public init(affichageSeo: Bool? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, description: String? = nil, editable: Bool? = nil, id14f: String? = nil, libelle: String? = nil, listeCodesRubriques: [String]? = nil, logo: String? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, type14f: Bool? = nil, typeEtablissement: SKRTypeEtablissement? = nil, typeProfilFiltrage: SKRTypeProfilFiltrage? = nil, typeSource: SKRTypeSource? = nil) {
        self.affichageSeo = affichageSeo
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.description = description
        self.editable = editable
        self.id14f = id14f
        self.libelle = libelle
        self.listeCodesRubriques = listeCodesRubriques
        self.logo = logo
        self.produitPublicitaire = produitPublicitaire
        self.type14f = type14f
        self.typeEtablissement = typeEtablissement
        self.typeProfilFiltrage = typeProfilFiltrage
        self.typeSource = typeSource
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case description
        case editable
        case id14f = "id_14f"
        case libelle
        case listeCodesRubriques
        case logo
        case produitPublicitaire = "produit_publicitaire"
        case type14f
        case typeEtablissement = "type_etablissement"
        case typeProfilFiltrage = "type_profil_filtrage"
        case typeSource = "type_source"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        description = try container.decodeIfPresent(.description)
        editable = try container.decodeIfPresent(.editable)
        id14f = try container.decodeIfPresent(.id14f)
        libelle = try container.decodeIfPresent(.libelle)
        listeCodesRubriques = try container.decodeArrayIfPresent(.listeCodesRubriques)
        logo = try container.decodeIfPresent(.logo)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        type14f = try container.decodeIfPresent(.type14f)
        typeEtablissement = try container.decodeIfPresent(.typeEtablissement)
        typeProfilFiltrage = try container.decodeIfPresent(.typeProfilFiltrage)
        typeSource = try container.decodeIfPresent(.typeSource)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(editable, forKey: .editable)
        try container.encodeIfPresent(id14f, forKey: .id14f)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(listeCodesRubriques, forKey: .listeCodesRubriques)
        try container.encodeIfPresent(logo, forKey: .logo)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(type14f, forKey: .type14f)
        try container.encodeIfPresent(typeEtablissement, forKey: .typeEtablissement)
        try container.encodeIfPresent(typeProfilFiltrage, forKey: .typeProfilFiltrage)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLibelleLogoOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.description == object.description else { return false }
      guard self.editable == object.editable else { return false }
      guard self.id14f == object.id14f else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.listeCodesRubriques == object.listeCodesRubriques else { return false }
      guard self.logo == object.logo else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.type14f == object.type14f else { return false }
      guard self.typeEtablissement == object.typeEtablissement else { return false }
      guard self.typeProfilFiltrage == object.typeProfilFiltrage else { return false }
      guard self.typeSource == object.typeSource else { return false }
      return true
    }

    public static func == (lhs: SKRLibelleLogoOrcFD, rhs: SKRLibelleLogoOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

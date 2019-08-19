/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDescription: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case leadformance = "LEADFORMANCE"
        case partenaireHotel = "PARTENAIRE_HOTEL"
        case partenaireRestaurant = "PARTENAIRE_RESTAURANT"
        case cvivDescriptionCourte = "CVIV_DESCRIPTION_COURTE"
        case cvivDescriptionLongue = "CVIV_DESCRIPTION_LONGUE"
        case cvivSlogan = "CVIV_SLOGAN"
        case partenairePjdoc = "PARTENAIRE_PJDOC"
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

    public enum SKRTypeTemplate: String, Codable, Hashable, CaseIterable {
        case t1 = "T1"
        case t2 = "T2"
        case t3 = "T3"
        case t3b = "T3b"
        case t4 = "T4"
        case t4b = "T4b"
        case t5 = "T5"
        case t6 = "T6"
        case t7 = "T7"
        case t8 = "T8"
    }

    public var affichageSeo: Bool?

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var listeCodesRubriques: [String]?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var texte: String?

    public var type: SKRType?

    public var typeProfilFiltrage: SKRTypeProfilFiltrage?

    public var typeSource: SKRTypeSource?

    public var typeTemplate: SKRTypeTemplate?

    public init(affichageSeo: Bool? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, listeCodesRubriques: [String]? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, texte: String? = nil, type: SKRType? = nil, typeProfilFiltrage: SKRTypeProfilFiltrage? = nil, typeSource: SKRTypeSource? = nil, typeTemplate: SKRTypeTemplate? = nil) {
        self.affichageSeo = affichageSeo
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.listeCodesRubriques = listeCodesRubriques
        self.produitPublicitaire = produitPublicitaire
        self.texte = texte
        self.type = type
        self.typeProfilFiltrage = typeProfilFiltrage
        self.typeSource = typeSource
        self.typeTemplate = typeTemplate
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case listeCodesRubriques
        case produitPublicitaire = "produit_publicitaire"
        case texte
        case type
        case typeProfilFiltrage = "type_profil_filtrage"
        case typeSource = "type_source"
        case typeTemplate = "type_template"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        listeCodesRubriques = try container.decodeArrayIfPresent(.listeCodesRubriques)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        texte = try container.decodeIfPresent(.texte)
        type = try container.decodeIfPresent(.type)
        typeProfilFiltrage = try container.decodeIfPresent(.typeProfilFiltrage)
        typeSource = try container.decodeIfPresent(.typeSource)
        typeTemplate = try container.decodeIfPresent(.typeTemplate)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(listeCodesRubriques, forKey: .listeCodesRubriques)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(texte, forKey: .texte)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(typeProfilFiltrage, forKey: .typeProfilFiltrage)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
        try container.encodeIfPresent(typeTemplate, forKey: .typeTemplate)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDescription else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.listeCodesRubriques == object.listeCodesRubriques else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.texte == object.texte else { return false }
      guard self.type == object.type else { return false }
      guard self.typeProfilFiltrage == object.typeProfilFiltrage else { return false }
      guard self.typeSource == object.typeSource else { return false }
      guard self.typeTemplate == object.typeTemplate else { return false }
      return true
    }

    public static func == (lhs: SKRDescription, rhs: SKRDescription) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

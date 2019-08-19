/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRVitrineProduitsServicesOrcFD: StargateKitModel {

    public enum SKRTypeSource: String, Codable, Hashable, CaseIterable {
        case cviv = "CVIV"
        case dv = "DV"
        case de = "DE"
        case partenaire = "PARTENAIRE"
        case search = "SEARCH"
        case ameli = "AMELI"
    }

    public enum SKRVerticalisationVitrineProduitsServices: String, Codable, Hashable, CaseIterable {
        case produit = "PRODUIT"
        case realisation = "REALISATION"
    }

    public var affichageSeo: Bool?

    public var categoriesDisponibles: [SKRCategorieApiInscriptionOrcFD]?

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var listeCodesRubriques: [String]?

    public var nombreProduits: Int?

    public var nombreServices: Int?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var produitsServices: [SKRServiceProduit]?

    public var reference: String?

    public var typeSource: SKRTypeSource?

    public var verticalisationVitrineProduitsServices: SKRVerticalisationVitrineProduitsServices?

    public init(affichageSeo: Bool? = nil, categoriesDisponibles: [SKRCategorieApiInscriptionOrcFD]? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, listeCodesRubriques: [String]? = nil, nombreProduits: Int? = nil, nombreServices: Int? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, produitsServices: [SKRServiceProduit]? = nil, reference: String? = nil, typeSource: SKRTypeSource? = nil, verticalisationVitrineProduitsServices: SKRVerticalisationVitrineProduitsServices? = nil) {
        self.affichageSeo = affichageSeo
        self.categoriesDisponibles = categoriesDisponibles
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.listeCodesRubriques = listeCodesRubriques
        self.nombreProduits = nombreProduits
        self.nombreServices = nombreServices
        self.produitPublicitaire = produitPublicitaire
        self.produitsServices = produitsServices
        self.reference = reference
        self.typeSource = typeSource
        self.verticalisationVitrineProduitsServices = verticalisationVitrineProduitsServices
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case categoriesDisponibles = "categories_disponibles"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case listeCodesRubriques
        case nombreProduits = "nombre_produits"
        case nombreServices = "nombre_services"
        case produitPublicitaire = "produit_publicitaire"
        case produitsServices = "produits_services"
        case reference
        case typeSource = "type_source"
        case verticalisationVitrineProduitsServices = "verticalisation_vitrine_produits_services"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        categoriesDisponibles = try container.decodeArrayIfPresent(.categoriesDisponibles)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        listeCodesRubriques = try container.decodeArrayIfPresent(.listeCodesRubriques)
        nombreProduits = try container.decodeIfPresent(.nombreProduits)
        nombreServices = try container.decodeIfPresent(.nombreServices)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        produitsServices = try container.decodeArrayIfPresent(.produitsServices)
        reference = try container.decodeIfPresent(.reference)
        typeSource = try container.decodeIfPresent(.typeSource)
        verticalisationVitrineProduitsServices = try container.decodeIfPresent(.verticalisationVitrineProduitsServices)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(categoriesDisponibles, forKey: .categoriesDisponibles)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(listeCodesRubriques, forKey: .listeCodesRubriques)
        try container.encodeIfPresent(nombreProduits, forKey: .nombreProduits)
        try container.encodeIfPresent(nombreServices, forKey: .nombreServices)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(produitsServices, forKey: .produitsServices)
        try container.encodeIfPresent(reference, forKey: .reference)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
        try container.encodeIfPresent(verticalisationVitrineProduitsServices, forKey: .verticalisationVitrineProduitsServices)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRVitrineProduitsServicesOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.categoriesDisponibles == object.categoriesDisponibles else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.listeCodesRubriques == object.listeCodesRubriques else { return false }
      guard self.nombreProduits == object.nombreProduits else { return false }
      guard self.nombreServices == object.nombreServices else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.produitsServices == object.produitsServices else { return false }
      guard self.reference == object.reference else { return false }
      guard self.typeSource == object.typeSource else { return false }
      guard self.verticalisationVitrineProduitsServices == object.verticalisationVitrineProduitsServices else { return false }
      return true
    }

    public static func == (lhs: SKRVitrineProduitsServicesOrcFD, rhs: SKRVitrineProduitsServicesOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCapaciteAccueil: StargateKitModel {

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

    public var capaciteAccueil: String?

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var editable: Bool?

    public var id14f: String?

    public var listeCodesRubriques: [String]?

    public var nombreBatiments: String?

    public var nombreChambres: String?

    public var nombreEtages: String?

    public var nombreSallesReunion: String?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var typeEtablissement: SKRTypeEtablissement?

    public var typeProfilFiltrage: SKRTypeProfilFiltrage?

    public var typeSource: SKRTypeSource?

    public init(affichageSeo: Bool? = nil, capaciteAccueil: String? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, editable: Bool? = nil, id14f: String? = nil, listeCodesRubriques: [String]? = nil, nombreBatiments: String? = nil, nombreChambres: String? = nil, nombreEtages: String? = nil, nombreSallesReunion: String? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, typeEtablissement: SKRTypeEtablissement? = nil, typeProfilFiltrage: SKRTypeProfilFiltrage? = nil, typeSource: SKRTypeSource? = nil) {
        self.affichageSeo = affichageSeo
        self.capaciteAccueil = capaciteAccueil
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.editable = editable
        self.id14f = id14f
        self.listeCodesRubriques = listeCodesRubriques
        self.nombreBatiments = nombreBatiments
        self.nombreChambres = nombreChambres
        self.nombreEtages = nombreEtages
        self.nombreSallesReunion = nombreSallesReunion
        self.produitPublicitaire = produitPublicitaire
        self.typeEtablissement = typeEtablissement
        self.typeProfilFiltrage = typeProfilFiltrage
        self.typeSource = typeSource
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case capaciteAccueil = "capacite_accueil"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case editable
        case id14f = "id_14f"
        case listeCodesRubriques
        case nombreBatiments = "nombre_batiments"
        case nombreChambres = "nombre_chambres"
        case nombreEtages = "nombre_etages"
        case nombreSallesReunion = "nombre_salles_reunion"
        case produitPublicitaire = "produit_publicitaire"
        case typeEtablissement = "type_etablissement"
        case typeProfilFiltrage = "type_profil_filtrage"
        case typeSource = "type_source"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        capaciteAccueil = try container.decodeIfPresent(.capaciteAccueil)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        editable = try container.decodeIfPresent(.editable)
        id14f = try container.decodeIfPresent(.id14f)
        listeCodesRubriques = try container.decodeArrayIfPresent(.listeCodesRubriques)
        nombreBatiments = try container.decodeIfPresent(.nombreBatiments)
        nombreChambres = try container.decodeIfPresent(.nombreChambres)
        nombreEtages = try container.decodeIfPresent(.nombreEtages)
        nombreSallesReunion = try container.decodeIfPresent(.nombreSallesReunion)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        typeEtablissement = try container.decodeIfPresent(.typeEtablissement)
        typeProfilFiltrage = try container.decodeIfPresent(.typeProfilFiltrage)
        typeSource = try container.decodeIfPresent(.typeSource)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(capaciteAccueil, forKey: .capaciteAccueil)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(editable, forKey: .editable)
        try container.encodeIfPresent(id14f, forKey: .id14f)
        try container.encodeIfPresent(listeCodesRubriques, forKey: .listeCodesRubriques)
        try container.encodeIfPresent(nombreBatiments, forKey: .nombreBatiments)
        try container.encodeIfPresent(nombreChambres, forKey: .nombreChambres)
        try container.encodeIfPresent(nombreEtages, forKey: .nombreEtages)
        try container.encodeIfPresent(nombreSallesReunion, forKey: .nombreSallesReunion)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(typeEtablissement, forKey: .typeEtablissement)
        try container.encodeIfPresent(typeProfilFiltrage, forKey: .typeProfilFiltrage)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCapaciteAccueil else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.capaciteAccueil == object.capaciteAccueil else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.editable == object.editable else { return false }
      guard self.id14f == object.id14f else { return false }
      guard self.listeCodesRubriques == object.listeCodesRubriques else { return false }
      guard self.nombreBatiments == object.nombreBatiments else { return false }
      guard self.nombreChambres == object.nombreChambres else { return false }
      guard self.nombreEtages == object.nombreEtages else { return false }
      guard self.nombreSallesReunion == object.nombreSallesReunion else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.typeEtablissement == object.typeEtablissement else { return false }
      guard self.typeProfilFiltrage == object.typeProfilFiltrage else { return false }
      guard self.typeSource == object.typeSource else { return false }
      return true
    }

    public static func == (lhs: SKRCapaciteAccueil, rhs: SKRCapaciteAccueil) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

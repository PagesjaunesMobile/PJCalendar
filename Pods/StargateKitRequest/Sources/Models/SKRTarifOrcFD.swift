/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTarifOrcFD: StargateKitModel {

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

    public var categorie: Int?

    public var contenuSpecifiqueHebergement: Bool?

    public var contenuSpecifiqueRestaurant: Bool?

    public var editable: Bool?

    public var id14f: String?

    public var listeCodesRubriques: [String]?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var type: String?

    public var typeEtablissement: SKRTypeEtablissement?

    public var typeProfilFiltrage: SKRTypeProfilFiltrage?

    public var typeSource: SKRTypeSource?

    public var valeur: String?

    public var valeurMidi: String?

    public var valeurSoir: String?

    public init(affichageSeo: Bool? = nil, categorie: Int? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, editable: Bool? = nil, id14f: String? = nil, listeCodesRubriques: [String]? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, type: String? = nil, typeEtablissement: SKRTypeEtablissement? = nil, typeProfilFiltrage: SKRTypeProfilFiltrage? = nil, typeSource: SKRTypeSource? = nil, valeur: String? = nil, valeurMidi: String? = nil, valeurSoir: String? = nil) {
        self.affichageSeo = affichageSeo
        self.categorie = categorie
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.editable = editable
        self.id14f = id14f
        self.listeCodesRubriques = listeCodesRubriques
        self.produitPublicitaire = produitPublicitaire
        self.type = type
        self.typeEtablissement = typeEtablissement
        self.typeProfilFiltrage = typeProfilFiltrage
        self.typeSource = typeSource
        self.valeur = valeur
        self.valeurMidi = valeurMidi
        self.valeurSoir = valeurSoir
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case categorie
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case editable
        case id14f = "id_14f"
        case listeCodesRubriques
        case produitPublicitaire = "produit_publicitaire"
        case type
        case typeEtablissement = "type_etablissement"
        case typeProfilFiltrage = "type_profil_filtrage"
        case typeSource = "type_source"
        case valeur
        case valeurMidi = "valeur_midi"
        case valeurSoir = "valeur_soir"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        categorie = try container.decodeIfPresent(.categorie)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        editable = try container.decodeIfPresent(.editable)
        id14f = try container.decodeIfPresent(.id14f)
        listeCodesRubriques = try container.decodeArrayIfPresent(.listeCodesRubriques)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        type = try container.decodeIfPresent(.type)
        typeEtablissement = try container.decodeIfPresent(.typeEtablissement)
        typeProfilFiltrage = try container.decodeIfPresent(.typeProfilFiltrage)
        typeSource = try container.decodeIfPresent(.typeSource)
        valeur = try container.decodeIfPresent(.valeur)
        valeurMidi = try container.decodeIfPresent(.valeurMidi)
        valeurSoir = try container.decodeIfPresent(.valeurSoir)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(categorie, forKey: .categorie)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(editable, forKey: .editable)
        try container.encodeIfPresent(id14f, forKey: .id14f)
        try container.encodeIfPresent(listeCodesRubriques, forKey: .listeCodesRubriques)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(typeEtablissement, forKey: .typeEtablissement)
        try container.encodeIfPresent(typeProfilFiltrage, forKey: .typeProfilFiltrage)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
        try container.encodeIfPresent(valeur, forKey: .valeur)
        try container.encodeIfPresent(valeurMidi, forKey: .valeurMidi)
        try container.encodeIfPresent(valeurSoir, forKey: .valeurSoir)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTarifOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.categorie == object.categorie else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.editable == object.editable else { return false }
      guard self.id14f == object.id14f else { return false }
      guard self.listeCodesRubriques == object.listeCodesRubriques else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.type == object.type else { return false }
      guard self.typeEtablissement == object.typeEtablissement else { return false }
      guard self.typeProfilFiltrage == object.typeProfilFiltrage else { return false }
      guard self.typeSource == object.typeSource else { return false }
      guard self.valeur == object.valeur else { return false }
      guard self.valeurMidi == object.valeurMidi else { return false }
      guard self.valeurSoir == object.valeurSoir else { return false }
      return true
    }

    public static func == (lhs: SKRTarifOrcFD, rhs: SKRTarifOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

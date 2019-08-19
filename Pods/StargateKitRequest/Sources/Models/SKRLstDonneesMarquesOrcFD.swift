/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLstDonneesMarquesOrcFD: StargateKitModel {

    public enum SKRTypeMarques: String, Codable, Hashable, CaseIterable {
        case search = "SEARCH"
        case buc = "BUC"
        case cviv = "CVIV"
        case dv = "DV"
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

    public var editable: Bool?

    public var id14f: String?

    public var listeCodesRubriques: [String]?

    public var marques: [SKRMarqueOrcFD]?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var typeMarques: SKRTypeMarques?

    public var typeProfilFiltrage: SKRTypeProfilFiltrage?

    public var typeSource: SKRTypeSource?

    public init(affichageSeo: Bool? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, editable: Bool? = nil, id14f: String? = nil, listeCodesRubriques: [String]? = nil, marques: [SKRMarqueOrcFD]? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, typeMarques: SKRTypeMarques? = nil, typeProfilFiltrage: SKRTypeProfilFiltrage? = nil, typeSource: SKRTypeSource? = nil) {
        self.affichageSeo = affichageSeo
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.editable = editable
        self.id14f = id14f
        self.listeCodesRubriques = listeCodesRubriques
        self.marques = marques
        self.produitPublicitaire = produitPublicitaire
        self.typeMarques = typeMarques
        self.typeProfilFiltrage = typeProfilFiltrage
        self.typeSource = typeSource
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case editable
        case id14f = "id_14f"
        case listeCodesRubriques
        case marques
        case produitPublicitaire = "produit_publicitaire"
        case typeMarques = "type_marques"
        case typeProfilFiltrage = "type_profil_filtrage"
        case typeSource = "type_source"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        editable = try container.decodeIfPresent(.editable)
        id14f = try container.decodeIfPresent(.id14f)
        listeCodesRubriques = try container.decodeArrayIfPresent(.listeCodesRubriques)
        marques = try container.decodeArrayIfPresent(.marques)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        typeMarques = try container.decodeIfPresent(.typeMarques)
        typeProfilFiltrage = try container.decodeIfPresent(.typeProfilFiltrage)
        typeSource = try container.decodeIfPresent(.typeSource)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(editable, forKey: .editable)
        try container.encodeIfPresent(id14f, forKey: .id14f)
        try container.encodeIfPresent(listeCodesRubriques, forKey: .listeCodesRubriques)
        try container.encodeIfPresent(marques, forKey: .marques)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(typeMarques, forKey: .typeMarques)
        try container.encodeIfPresent(typeProfilFiltrage, forKey: .typeProfilFiltrage)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLstDonneesMarquesOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.editable == object.editable else { return false }
      guard self.id14f == object.id14f else { return false }
      guard self.listeCodesRubriques == object.listeCodesRubriques else { return false }
      guard self.marques == object.marques else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.typeMarques == object.typeMarques else { return false }
      guard self.typeProfilFiltrage == object.typeProfilFiltrage else { return false }
      guard self.typeSource == object.typeSource else { return false }
      return true
    }

    public static func == (lhs: SKRLstDonneesMarquesOrcFD, rhs: SKRLstDonneesMarquesOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

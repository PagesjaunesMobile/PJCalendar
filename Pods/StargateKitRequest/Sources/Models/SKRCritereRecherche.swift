/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCritereRecherche: StargateKitModel {

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

    public var criteres: [String]?

    public var criteresRecherche: [SKRCritereRechercheOrcFD]?

    public var libelle: String?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var typeSource: SKRTypeSource?

    public init(affichageSeo: Bool? = nil, codeEtablissement: [String]? = nil, codeRubrique: [String]? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, criteres: [String]? = nil, criteresRecherche: [SKRCritereRechercheOrcFD]? = nil, libelle: String? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, typeSource: SKRTypeSource? = nil) {
        self.affichageSeo = affichageSeo
        self.codeEtablissement = codeEtablissement
        self.codeRubrique = codeRubrique
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.criteres = criteres
        self.criteresRecherche = criteresRecherche
        self.libelle = libelle
        self.produitPublicitaire = produitPublicitaire
        self.typeSource = typeSource
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case codeEtablissement = "code_etablissement"
        case codeRubrique = "code_rubrique"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case criteres
        case criteresRecherche
        case libelle
        case produitPublicitaire = "produit_publicitaire"
        case typeSource = "type_source"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        codeEtablissement = try container.decodeArrayIfPresent(.codeEtablissement)
        codeRubrique = try container.decodeArrayIfPresent(.codeRubrique)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        criteres = try container.decodeArrayIfPresent(.criteres)
        criteresRecherche = try container.decodeArrayIfPresent(.criteresRecherche)
        libelle = try container.decodeIfPresent(.libelle)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        typeSource = try container.decodeIfPresent(.typeSource)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(codeEtablissement, forKey: .codeEtablissement)
        try container.encodeIfPresent(codeRubrique, forKey: .codeRubrique)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(criteres, forKey: .criteres)
        try container.encodeIfPresent(criteresRecherche, forKey: .criteresRecherche)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCritereRecherche else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.codeEtablissement == object.codeEtablissement else { return false }
      guard self.codeRubrique == object.codeRubrique else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.criteres == object.criteres else { return false }
      guard self.criteresRecherche == object.criteresRecherche else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.typeSource == object.typeSource else { return false }
      return true
    }

    public static func == (lhs: SKRCritereRecherche, rhs: SKRCritereRecherche) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

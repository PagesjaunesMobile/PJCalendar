/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRServiceProduit: StargateKitModel {

    public enum SKRSousType: String, Codable, Hashable, CaseIterable {
        case produit = "PRODUIT"
        case service = "SERVICE"
    }

    public enum SKRTypePpp: String, Codable, Hashable, CaseIterable {
        case produitService = "PRODUIT_SERVICE"
        case annonceImmo = "ANNONCE_IMMO"
        case annonceAuto = "ANNONCE_AUTO"
        case annonceMoto = "ANNONCE_MOTO"
        case bonPlan = "BON_PLAN"
    }

    public enum SKRVerticalisationVitrineProduitsServices: String, Codable, Hashable, CaseIterable {
        case produit = "PRODUIT"
        case realisation = "REALISATION"
    }

    public var categorie: String?

    public var codeEan: String?

    public var description: String?

    public var ecotaxe: Float?

    public var id: String?

    public var identifiantPpp: String?

    public var infosGenerales: String?

    public var marque: String?

    public var prix: Float?

    public var prixaPartirDe: Bool?

    public var prixTtc: Bool?

    public var reference: String?

    public var sousType: SKRSousType?

    public var titre: String?

    public var typePpp: SKRTypePpp?

    public var uRLVisuel: String?

    public var verticalisationVitrineProduitsServices: SKRVerticalisationVitrineProduitsServices?

    public var visuels: [SKRVisuelPPPApiInscriptionOrcFD]?

    public init(categorie: String? = nil, codeEan: String? = nil, description: String? = nil, ecotaxe: Float? = nil, id: String? = nil, identifiantPpp: String? = nil, infosGenerales: String? = nil, marque: String? = nil, prix: Float? = nil, prixaPartirDe: Bool? = nil, prixTtc: Bool? = nil, reference: String? = nil, sousType: SKRSousType? = nil, titre: String? = nil, typePpp: SKRTypePpp? = nil, uRLVisuel: String? = nil, verticalisationVitrineProduitsServices: SKRVerticalisationVitrineProduitsServices? = nil, visuels: [SKRVisuelPPPApiInscriptionOrcFD]? = nil) {
        self.categorie = categorie
        self.codeEan = codeEan
        self.description = description
        self.ecotaxe = ecotaxe
        self.id = id
        self.identifiantPpp = identifiantPpp
        self.infosGenerales = infosGenerales
        self.marque = marque
        self.prix = prix
        self.prixaPartirDe = prixaPartirDe
        self.prixTtc = prixTtc
        self.reference = reference
        self.sousType = sousType
        self.titre = titre
        self.typePpp = typePpp
        self.uRLVisuel = uRLVisuel
        self.verticalisationVitrineProduitsServices = verticalisationVitrineProduitsServices
        self.visuels = visuels
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case categorie
        case codeEan = "code_ean"
        case description
        case ecotaxe
        case id
        case identifiantPpp = "identifiant_ppp"
        case infosGenerales = "infos_generales"
        case marque
        case prix
        case prixaPartirDe = "prix_a_partir_de"
        case prixTtc = "prix_ttc"
        case reference
        case sousType = "sous_type"
        case titre
        case typePpp = "type_ppp"
        case uRLVisuel = "url_visuel"
        case verticalisationVitrineProduitsServices = "verticalisation_vitrine_produits_services"
        case visuels
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        categorie = try container.decodeIfPresent(.categorie)
        codeEan = try container.decodeIfPresent(.codeEan)
        description = try container.decodeIfPresent(.description)
        ecotaxe = try container.decodeIfPresent(.ecotaxe)
        id = try container.decodeIfPresent(.id)
        identifiantPpp = try container.decodeIfPresent(.identifiantPpp)
        infosGenerales = try container.decodeIfPresent(.infosGenerales)
        marque = try container.decodeIfPresent(.marque)
        prix = try container.decodeIfPresent(.prix)
        prixaPartirDe = try container.decodeIfPresent(.prixaPartirDe)
        prixTtc = try container.decodeIfPresent(.prixTtc)
        reference = try container.decodeIfPresent(.reference)
        sousType = try container.decodeIfPresent(.sousType)
        titre = try container.decodeIfPresent(.titre)
        typePpp = try container.decodeIfPresent(.typePpp)
        uRLVisuel = try container.decodeIfPresent(.uRLVisuel)
        verticalisationVitrineProduitsServices = try container.decodeIfPresent(.verticalisationVitrineProduitsServices)
        visuels = try container.decodeArrayIfPresent(.visuels)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(categorie, forKey: .categorie)
        try container.encodeIfPresent(codeEan, forKey: .codeEan)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(ecotaxe, forKey: .ecotaxe)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(identifiantPpp, forKey: .identifiantPpp)
        try container.encodeIfPresent(infosGenerales, forKey: .infosGenerales)
        try container.encodeIfPresent(marque, forKey: .marque)
        try container.encodeIfPresent(prix, forKey: .prix)
        try container.encodeIfPresent(prixaPartirDe, forKey: .prixaPartirDe)
        try container.encodeIfPresent(prixTtc, forKey: .prixTtc)
        try container.encodeIfPresent(reference, forKey: .reference)
        try container.encodeIfPresent(sousType, forKey: .sousType)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(typePpp, forKey: .typePpp)
        try container.encodeIfPresent(uRLVisuel, forKey: .uRLVisuel)
        try container.encodeIfPresent(verticalisationVitrineProduitsServices, forKey: .verticalisationVitrineProduitsServices)
        try container.encodeIfPresent(visuels, forKey: .visuels)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRServiceProduit else { return false }
      guard self.categorie == object.categorie else { return false }
      guard self.codeEan == object.codeEan else { return false }
      guard self.description == object.description else { return false }
      guard self.ecotaxe == object.ecotaxe else { return false }
      guard self.id == object.id else { return false }
      guard self.identifiantPpp == object.identifiantPpp else { return false }
      guard self.infosGenerales == object.infosGenerales else { return false }
      guard self.marque == object.marque else { return false }
      guard self.prix == object.prix else { return false }
      guard self.prixaPartirDe == object.prixaPartirDe else { return false }
      guard self.prixTtc == object.prixTtc else { return false }
      guard self.reference == object.reference else { return false }
      guard self.sousType == object.sousType else { return false }
      guard self.titre == object.titre else { return false }
      guard self.typePpp == object.typePpp else { return false }
      guard self.uRLVisuel == object.uRLVisuel else { return false }
      guard self.verticalisationVitrineProduitsServices == object.verticalisationVitrineProduitsServices else { return false }
      guard self.visuels == object.visuels else { return false }
      return true
    }

    public static func == (lhs: SKRServiceProduit, rhs: SKRServiceProduit) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

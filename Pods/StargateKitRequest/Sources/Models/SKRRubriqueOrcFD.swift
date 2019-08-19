/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRubriqueOrcFD: StargateKitModel {

    public enum SKRVerticalisationVitrineProduitsServices: String, Codable, Hashable, CaseIterable {
        case produit = "PRODUIT"
        case realisation = "REALISATION"
    }

    public var codeAn9: String?

    public var libelle: String?

    public var lienRetourResultat: String?

    public var reglemente: String?

    public var remarketing: SKRRemarketingApiInscriptionOrcFD?

    public var segment: SKRSegmentApiInscriptionOrcFD?

    public var urgence: Bool?

    public var verticalisationVitrineProduitsServices: SKRVerticalisationVitrineProduitsServices?

    public init(codeAn9: String? = nil, libelle: String? = nil, lienRetourResultat: String? = nil, reglemente: String? = nil, remarketing: SKRRemarketingApiInscriptionOrcFD? = nil, segment: SKRSegmentApiInscriptionOrcFD? = nil, urgence: Bool? = nil, verticalisationVitrineProduitsServices: SKRVerticalisationVitrineProduitsServices? = nil) {
        self.codeAn9 = codeAn9
        self.libelle = libelle
        self.lienRetourResultat = lienRetourResultat
        self.reglemente = reglemente
        self.remarketing = remarketing
        self.segment = segment
        self.urgence = urgence
        self.verticalisationVitrineProduitsServices = verticalisationVitrineProduitsServices
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case codeAn9 = "code_an9"
        case libelle
        case lienRetourResultat = "lien_retour_resultat"
        case reglemente
        case remarketing
        case segment
        case urgence
        case verticalisationVitrineProduitsServices = "verticalisation_vitrine_produits_services"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        codeAn9 = try container.decodeIfPresent(.codeAn9)
        libelle = try container.decodeIfPresent(.libelle)
        lienRetourResultat = try container.decodeIfPresent(.lienRetourResultat)
        reglemente = try container.decodeIfPresent(.reglemente)
        remarketing = try container.decodeIfPresent(.remarketing)
        segment = try container.decodeIfPresent(.segment)
        urgence = try container.decodeIfPresent(.urgence)
        verticalisationVitrineProduitsServices = try container.decodeIfPresent(.verticalisationVitrineProduitsServices)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(codeAn9, forKey: .codeAn9)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(lienRetourResultat, forKey: .lienRetourResultat)
        try container.encodeIfPresent(reglemente, forKey: .reglemente)
        try container.encodeIfPresent(remarketing, forKey: .remarketing)
        try container.encodeIfPresent(segment, forKey: .segment)
        try container.encodeIfPresent(urgence, forKey: .urgence)
        try container.encodeIfPresent(verticalisationVitrineProduitsServices, forKey: .verticalisationVitrineProduitsServices)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRubriqueOrcFD else { return false }
      guard self.codeAn9 == object.codeAn9 else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.lienRetourResultat == object.lienRetourResultat else { return false }
      guard self.reglemente == object.reglemente else { return false }
      guard self.remarketing == object.remarketing else { return false }
      guard self.segment == object.segment else { return false }
      guard self.urgence == object.urgence else { return false }
      guard self.verticalisationVitrineProduitsServices == object.verticalisationVitrineProduitsServices else { return false }
      return true
    }

    public static func == (lhs: SKRRubriqueOrcFD, rhs: SKRRubriqueOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

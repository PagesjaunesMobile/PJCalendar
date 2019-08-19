/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRubriqueApiInscriptionOrcFD: StargateKitModel {

    public enum SKRTypeParcoursTransac: String, Codable, Hashable, CaseIterable {
        case generique = "GENERIQUE"
        case parCreneaux = "PAR_CRENEAUX"
        case parPrestations = "PAR_PRESTATIONS"
    }

    public enum SKRTypeRisque: String, Codable, Hashable, CaseIterable {
        case sansObjet = "SANS_OBJET"
        case professionARisque = "PROFESSION_A_RISQUE"
        case reglementee = "REGLEMENTEE"
    }

    public enum SKRVerticalisationVitrineProduitsServices: String, Codable, Hashable, CaseIterable {
        case produit = "PRODUIT"
        case realisation = "REALISATION"
    }

    public var codeAn8: String?

    public var codeAn9: String?

    public var critereContributif: [SKRCritereContributifApiInscriptionOrcFD]?

    public var eligibleContributif: Bool?

    public var eligiblePhotos: Bool?

    public var libelle: String?

    public var lienRetourResultat: String?

    public var remarketing: SKRRemarketingApiInscriptionOrcFD?

    public var segment: SKRSegmentApiInscriptionOrcFD?

    public var sensible: Bool?

    public var thematiqueTransac: String?

    public var typeParcoursTransac: SKRTypeParcoursTransac?

    public var typeRisque: SKRTypeRisque?

    public var urgence: Bool?

    public var verticalisationVitrineProduitsServices: SKRVerticalisationVitrineProduitsServices?

    public init(codeAn8: String? = nil, codeAn9: String? = nil, critereContributif: [SKRCritereContributifApiInscriptionOrcFD]? = nil, eligibleContributif: Bool? = nil, eligiblePhotos: Bool? = nil, libelle: String? = nil, lienRetourResultat: String? = nil, remarketing: SKRRemarketingApiInscriptionOrcFD? = nil, segment: SKRSegmentApiInscriptionOrcFD? = nil, sensible: Bool? = nil, thematiqueTransac: String? = nil, typeParcoursTransac: SKRTypeParcoursTransac? = nil, typeRisque: SKRTypeRisque? = nil, urgence: Bool? = nil, verticalisationVitrineProduitsServices: SKRVerticalisationVitrineProduitsServices? = nil) {
        self.codeAn8 = codeAn8
        self.codeAn9 = codeAn9
        self.critereContributif = critereContributif
        self.eligibleContributif = eligibleContributif
        self.eligiblePhotos = eligiblePhotos
        self.libelle = libelle
        self.lienRetourResultat = lienRetourResultat
        self.remarketing = remarketing
        self.segment = segment
        self.sensible = sensible
        self.thematiqueTransac = thematiqueTransac
        self.typeParcoursTransac = typeParcoursTransac
        self.typeRisque = typeRisque
        self.urgence = urgence
        self.verticalisationVitrineProduitsServices = verticalisationVitrineProduitsServices
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case codeAn8 = "code_an8"
        case codeAn9 = "code_an9"
        case critereContributif = "critere_contributif"
        case eligibleContributif = "eligible_contributif"
        case eligiblePhotos = "eligible_photos"
        case libelle
        case lienRetourResultat = "lien_retour_resultat"
        case remarketing
        case segment
        case sensible
        case thematiqueTransac = "thematique_transac"
        case typeParcoursTransac = "type_parcours_transac"
        case typeRisque = "type_risque"
        case urgence
        case verticalisationVitrineProduitsServices = "verticalisation_vitrine_produits_services"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        codeAn8 = try container.decodeIfPresent(.codeAn8)
        codeAn9 = try container.decodeIfPresent(.codeAn9)
        critereContributif = try container.decodeArrayIfPresent(.critereContributif)
        eligibleContributif = try container.decodeIfPresent(.eligibleContributif)
        eligiblePhotos = try container.decodeIfPresent(.eligiblePhotos)
        libelle = try container.decodeIfPresent(.libelle)
        lienRetourResultat = try container.decodeIfPresent(.lienRetourResultat)
        remarketing = try container.decodeIfPresent(.remarketing)
        segment = try container.decodeIfPresent(.segment)
        sensible = try container.decodeIfPresent(.sensible)
        thematiqueTransac = try container.decodeIfPresent(.thematiqueTransac)
        typeParcoursTransac = try container.decodeIfPresent(.typeParcoursTransac)
        typeRisque = try container.decodeIfPresent(.typeRisque)
        urgence = try container.decodeIfPresent(.urgence)
        verticalisationVitrineProduitsServices = try container.decodeIfPresent(.verticalisationVitrineProduitsServices)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(codeAn8, forKey: .codeAn8)
        try container.encodeIfPresent(codeAn9, forKey: .codeAn9)
        try container.encodeIfPresent(critereContributif, forKey: .critereContributif)
        try container.encodeIfPresent(eligibleContributif, forKey: .eligibleContributif)
        try container.encodeIfPresent(eligiblePhotos, forKey: .eligiblePhotos)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(lienRetourResultat, forKey: .lienRetourResultat)
        try container.encodeIfPresent(remarketing, forKey: .remarketing)
        try container.encodeIfPresent(segment, forKey: .segment)
        try container.encodeIfPresent(sensible, forKey: .sensible)
        try container.encodeIfPresent(thematiqueTransac, forKey: .thematiqueTransac)
        try container.encodeIfPresent(typeParcoursTransac, forKey: .typeParcoursTransac)
        try container.encodeIfPresent(typeRisque, forKey: .typeRisque)
        try container.encodeIfPresent(urgence, forKey: .urgence)
        try container.encodeIfPresent(verticalisationVitrineProduitsServices, forKey: .verticalisationVitrineProduitsServices)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRubriqueApiInscriptionOrcFD else { return false }
      guard self.codeAn8 == object.codeAn8 else { return false }
      guard self.codeAn9 == object.codeAn9 else { return false }
      guard self.critereContributif == object.critereContributif else { return false }
      guard self.eligibleContributif == object.eligibleContributif else { return false }
      guard self.eligiblePhotos == object.eligiblePhotos else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.lienRetourResultat == object.lienRetourResultat else { return false }
      guard self.remarketing == object.remarketing else { return false }
      guard self.segment == object.segment else { return false }
      guard self.sensible == object.sensible else { return false }
      guard self.thematiqueTransac == object.thematiqueTransac else { return false }
      guard self.typeParcoursTransac == object.typeParcoursTransac else { return false }
      guard self.typeRisque == object.typeRisque else { return false }
      guard self.urgence == object.urgence else { return false }
      guard self.verticalisationVitrineProduitsServices == object.verticalisationVitrineProduitsServices else { return false }
      return true
    }

    public static func == (lhs: SKRRubriqueApiInscriptionOrcFD, rhs: SKRRubriqueApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRHoraire: StargateKitModel {

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

    public var fermeturesExceptionnelles: [SKRHoraireExceptionnelApiInscriptionOrcFD]?

    public var joursFeriesFermes: Bool?

    public var joursOuverture: [SKRJourOuverture]?

    public var ouvert2424: Bool?

    public var ouverturesExceptionnelles: [SKRHoraireExceptionnelApiInscriptionOrcFD]?

    public var periodesFermeture: [SKRPeriodeFermeture]?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var typeProfilFiltrage: SKRTypeProfilFiltrage?

    public var typeSource: SKRTypeSource?

    public init(affichageSeo: Bool? = nil, contenuSpecifiqueHebergement: Bool? = nil, contenuSpecifiqueRestaurant: Bool? = nil, fermeturesExceptionnelles: [SKRHoraireExceptionnelApiInscriptionOrcFD]? = nil, joursFeriesFermes: Bool? = nil, joursOuverture: [SKRJourOuverture]? = nil, ouvert2424: Bool? = nil, ouverturesExceptionnelles: [SKRHoraireExceptionnelApiInscriptionOrcFD]? = nil, periodesFermeture: [SKRPeriodeFermeture]? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, typeProfilFiltrage: SKRTypeProfilFiltrage? = nil, typeSource: SKRTypeSource? = nil) {
        self.affichageSeo = affichageSeo
        self.contenuSpecifiqueHebergement = contenuSpecifiqueHebergement
        self.contenuSpecifiqueRestaurant = contenuSpecifiqueRestaurant
        self.fermeturesExceptionnelles = fermeturesExceptionnelles
        self.joursFeriesFermes = joursFeriesFermes
        self.joursOuverture = joursOuverture
        self.ouvert2424 = ouvert2424
        self.ouverturesExceptionnelles = ouverturesExceptionnelles
        self.periodesFermeture = periodesFermeture
        self.produitPublicitaire = produitPublicitaire
        self.typeProfilFiltrage = typeProfilFiltrage
        self.typeSource = typeSource
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case contenuSpecifiqueHebergement
        case contenuSpecifiqueRestaurant
        case fermeturesExceptionnelles = "fermetures_exceptionnelles"
        case joursFeriesFermes = "jours_feries_fermes"
        case joursOuverture = "jours_ouverture"
        case ouvert2424 = "ouvert_2424"
        case ouverturesExceptionnelles = "ouvertures_exceptionnelles"
        case periodesFermeture = "periodes_fermeture"
        case produitPublicitaire = "produit_publicitaire"
        case typeProfilFiltrage = "type_profil_filtrage"
        case typeSource = "type_source"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        contenuSpecifiqueHebergement = try container.decodeIfPresent(.contenuSpecifiqueHebergement)
        contenuSpecifiqueRestaurant = try container.decodeIfPresent(.contenuSpecifiqueRestaurant)
        fermeturesExceptionnelles = try container.decodeArrayIfPresent(.fermeturesExceptionnelles)
        joursFeriesFermes = try container.decodeIfPresent(.joursFeriesFermes)
        joursOuverture = try container.decodeArrayIfPresent(.joursOuverture)
        ouvert2424 = try container.decodeIfPresent(.ouvert2424)
        ouverturesExceptionnelles = try container.decodeArrayIfPresent(.ouverturesExceptionnelles)
        periodesFermeture = try container.decodeArrayIfPresent(.periodesFermeture)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        typeProfilFiltrage = try container.decodeIfPresent(.typeProfilFiltrage)
        typeSource = try container.decodeIfPresent(.typeSource)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(contenuSpecifiqueHebergement, forKey: .contenuSpecifiqueHebergement)
        try container.encodeIfPresent(contenuSpecifiqueRestaurant, forKey: .contenuSpecifiqueRestaurant)
        try container.encodeIfPresent(fermeturesExceptionnelles, forKey: .fermeturesExceptionnelles)
        try container.encodeIfPresent(joursFeriesFermes, forKey: .joursFeriesFermes)
        try container.encodeIfPresent(joursOuverture, forKey: .joursOuverture)
        try container.encodeIfPresent(ouvert2424, forKey: .ouvert2424)
        try container.encodeIfPresent(ouverturesExceptionnelles, forKey: .ouverturesExceptionnelles)
        try container.encodeIfPresent(periodesFermeture, forKey: .periodesFermeture)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(typeProfilFiltrage, forKey: .typeProfilFiltrage)
        try container.encodeIfPresent(typeSource, forKey: .typeSource)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRHoraire else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.contenuSpecifiqueHebergement == object.contenuSpecifiqueHebergement else { return false }
      guard self.contenuSpecifiqueRestaurant == object.contenuSpecifiqueRestaurant else { return false }
      guard self.fermeturesExceptionnelles == object.fermeturesExceptionnelles else { return false }
      guard self.joursFeriesFermes == object.joursFeriesFermes else { return false }
      guard self.joursOuverture == object.joursOuverture else { return false }
      guard self.ouvert2424 == object.ouvert2424 else { return false }
      guard self.ouverturesExceptionnelles == object.ouverturesExceptionnelles else { return false }
      guard self.periodesFermeture == object.periodesFermeture else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.typeProfilFiltrage == object.typeProfilFiltrage else { return false }
      guard self.typeSource == object.typeSource else { return false }
      return true
    }

    public static func == (lhs: SKRHoraire, rhs: SKRHoraire) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInfoContributifOrcFD: StargateKitModel {

    public var blacklistageDepotAvis: Bool?

    public var blacklistageDepotPhotos: Bool?

    public var contributionAfnorPresente: Bool?

    public var contributions: [SKRContributionApiInscriptionOrcFD]?

    public var eligibleContributif: Bool?

    public var eligibleDepotPhotos: Bool?

    public var listeAvis: [SKRAvisOrchInscriptionOrcFD]?

    public var nombreContribution: Int?

    public var nombreContributionAfnor: Int?

    public var noteMoyenne: Float?

    public var rubriquesNonEligibles: [String]?

    public init(blacklistageDepotAvis: Bool? = nil, blacklistageDepotPhotos: Bool? = nil, contributionAfnorPresente: Bool? = nil, contributions: [SKRContributionApiInscriptionOrcFD]? = nil, eligibleContributif: Bool? = nil, eligibleDepotPhotos: Bool? = nil, listeAvis: [SKRAvisOrchInscriptionOrcFD]? = nil, nombreContribution: Int? = nil, nombreContributionAfnor: Int? = nil, noteMoyenne: Float? = nil, rubriquesNonEligibles: [String]? = nil) {
        self.blacklistageDepotAvis = blacklistageDepotAvis
        self.blacklistageDepotPhotos = blacklistageDepotPhotos
        self.contributionAfnorPresente = contributionAfnorPresente
        self.contributions = contributions
        self.eligibleContributif = eligibleContributif
        self.eligibleDepotPhotos = eligibleDepotPhotos
        self.listeAvis = listeAvis
        self.nombreContribution = nombreContribution
        self.nombreContributionAfnor = nombreContributionAfnor
        self.noteMoyenne = noteMoyenne
        self.rubriquesNonEligibles = rubriquesNonEligibles
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case blacklistageDepotAvis = "blacklistage_depot_avis"
        case blacklistageDepotPhotos = "blacklistage_depot_photos"
        case contributionAfnorPresente = "contribution_afnor_presente"
        case contributions
        case eligibleContributif = "eligible_contributif"
        case eligibleDepotPhotos = "eligible_depot_photos"
        case listeAvis = "liste_avis"
        case nombreContribution = "nombre_contribution"
        case nombreContributionAfnor = "nombre_contribution_afnor"
        case noteMoyenne = "note_moyenne"
        case rubriquesNonEligibles = "rubriques_non_eligibles"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        blacklistageDepotAvis = try container.decodeIfPresent(.blacklistageDepotAvis)
        blacklistageDepotPhotos = try container.decodeIfPresent(.blacklistageDepotPhotos)
        contributionAfnorPresente = try container.decodeIfPresent(.contributionAfnorPresente)
        contributions = try container.decodeArrayIfPresent(.contributions)
        eligibleContributif = try container.decodeIfPresent(.eligibleContributif)
        eligibleDepotPhotos = try container.decodeIfPresent(.eligibleDepotPhotos)
        listeAvis = try container.decodeArrayIfPresent(.listeAvis)
        nombreContribution = try container.decodeIfPresent(.nombreContribution)
        nombreContributionAfnor = try container.decodeIfPresent(.nombreContributionAfnor)
        noteMoyenne = try container.decodeIfPresent(.noteMoyenne)
        rubriquesNonEligibles = try container.decodeArrayIfPresent(.rubriquesNonEligibles)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(blacklistageDepotAvis, forKey: .blacklistageDepotAvis)
        try container.encodeIfPresent(blacklistageDepotPhotos, forKey: .blacklistageDepotPhotos)
        try container.encodeIfPresent(contributionAfnorPresente, forKey: .contributionAfnorPresente)
        try container.encodeIfPresent(contributions, forKey: .contributions)
        try container.encodeIfPresent(eligibleContributif, forKey: .eligibleContributif)
        try container.encodeIfPresent(eligibleDepotPhotos, forKey: .eligibleDepotPhotos)
        try container.encodeIfPresent(listeAvis, forKey: .listeAvis)
        try container.encodeIfPresent(nombreContribution, forKey: .nombreContribution)
        try container.encodeIfPresent(nombreContributionAfnor, forKey: .nombreContributionAfnor)
        try container.encodeIfPresent(noteMoyenne, forKey: .noteMoyenne)
        try container.encodeIfPresent(rubriquesNonEligibles, forKey: .rubriquesNonEligibles)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInfoContributifOrcFD else { return false }
      guard self.blacklistageDepotAvis == object.blacklistageDepotAvis else { return false }
      guard self.blacklistageDepotPhotos == object.blacklistageDepotPhotos else { return false }
      guard self.contributionAfnorPresente == object.contributionAfnorPresente else { return false }
      guard self.contributions == object.contributions else { return false }
      guard self.eligibleContributif == object.eligibleContributif else { return false }
      guard self.eligibleDepotPhotos == object.eligibleDepotPhotos else { return false }
      guard self.listeAvis == object.listeAvis else { return false }
      guard self.nombreContribution == object.nombreContribution else { return false }
      guard self.nombreContributionAfnor == object.nombreContributionAfnor else { return false }
      guard self.noteMoyenne == object.noteMoyenne else { return false }
      guard self.rubriquesNonEligibles == object.rubriquesNonEligibles else { return false }
      return true
    }

    public static func == (lhs: SKRInfoContributifOrcFD, rhs: SKRInfoContributifOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

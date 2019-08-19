/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRVideo: StargateKitModel {

    public enum SKRTypeMedia: String, Codable, Hashable, CaseIterable {
        case premiumSitePrivilege = "PREMIUM_SITE_PRIVILEGE"
        case interviewSitePrivilege = "INTERVIEW_SITE_PRIVILEGE"
        case reportageSitePrivilege = "REPORTAGE_SITE_PRIVILEGE"
        case premiumPvi = "PREMIUM_PVI"
        case interviewPvi = "INTERVIEW_PVI"
        case reportagePvi = "REPORTAGE_PVI"
        case premiumStandalone = "PREMIUM_STANDALONE"
        case interviewStandalone = "INTERVIEW_STANDALONE"
        case reportageStandalone = "REPORTAGE_STANDALONE"
        case cvivPhoto = "CVIV_PHOTO"
        case pvi = "PVI"
        case agc = "AGC"
        case pgc = "PGC"
        case partenaireHotel = "PARTENAIRE_HOTEL"
        case lafourchette = "LAFOURCHETTE"
        case leadformance = "LEADFORMANCE"
        case dosdWikimedia = "DOSD_WIKIMEDIA"
        case dosd = "DOSD"
        case ugc = "UGC"
        case mappy = "MAPPY"
    }

    public var description: String?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var pseudoContributeur: String?

    public var typeMedia: SKRTypeMedia?

    public var url: String?

    public var uRLAvatarContributeur: String?

    public var uRLPvi: String?

    public var uRLVignette: String?

    public init(description: String? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, pseudoContributeur: String? = nil, typeMedia: SKRTypeMedia? = nil, url: String? = nil, uRLAvatarContributeur: String? = nil, uRLPvi: String? = nil, uRLVignette: String? = nil) {
        self.description = description
        self.produitPublicitaire = produitPublicitaire
        self.pseudoContributeur = pseudoContributeur
        self.typeMedia = typeMedia
        self.url = url
        self.uRLAvatarContributeur = uRLAvatarContributeur
        self.uRLPvi = uRLPvi
        self.uRLVignette = uRLVignette
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case description
        case produitPublicitaire = "produit_publicitaire"
        case pseudoContributeur = "pseudo_contributeur"
        case typeMedia = "type_media"
        case url
        case uRLAvatarContributeur = "url_avatar_contributeur"
        case uRLPvi = "url_pvi"
        case uRLVignette = "url_vignette"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        description = try container.decodeIfPresent(.description)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        pseudoContributeur = try container.decodeIfPresent(.pseudoContributeur)
        typeMedia = try container.decodeIfPresent(.typeMedia)
        url = try container.decodeIfPresent(.url)
        uRLAvatarContributeur = try container.decodeIfPresent(.uRLAvatarContributeur)
        uRLPvi = try container.decodeIfPresent(.uRLPvi)
        uRLVignette = try container.decodeIfPresent(.uRLVignette)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(pseudoContributeur, forKey: .pseudoContributeur)
        try container.encodeIfPresent(typeMedia, forKey: .typeMedia)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(uRLAvatarContributeur, forKey: .uRLAvatarContributeur)
        try container.encodeIfPresent(uRLPvi, forKey: .uRLPvi)
        try container.encodeIfPresent(uRLVignette, forKey: .uRLVignette)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRVideo else { return false }
      guard self.description == object.description else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.pseudoContributeur == object.pseudoContributeur else { return false }
      guard self.typeMedia == object.typeMedia else { return false }
      guard self.url == object.url else { return false }
      guard self.uRLAvatarContributeur == object.uRLAvatarContributeur else { return false }
      guard self.uRLPvi == object.uRLPvi else { return false }
      guard self.uRLVignette == object.uRLVignette else { return false }
      return true
    }

    public static func == (lhs: SKRVideo, rhs: SKRVideo) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInformationsSEOOrcFD: StargateKitModel {

    public var filAriane: SKRFilArianeOrcFD?

    public var infoMasquee: String?

    public var liensAnnonceurs: [SKRLienSEOOrcFD]?

    public var maillageSeo: SKRMaillageSeoOrcFD?

    public var metas: [SKRMetaApiSEOOrcFD]?

    public var redirection: SKRRedirectionSEOOrcFD?

    public init(filAriane: SKRFilArianeOrcFD? = nil, infoMasquee: String? = nil, liensAnnonceurs: [SKRLienSEOOrcFD]? = nil, maillageSeo: SKRMaillageSeoOrcFD? = nil, metas: [SKRMetaApiSEOOrcFD]? = nil, redirection: SKRRedirectionSEOOrcFD? = nil) {
        self.filAriane = filAriane
        self.infoMasquee = infoMasquee
        self.liensAnnonceurs = liensAnnonceurs
        self.maillageSeo = maillageSeo
        self.metas = metas
        self.redirection = redirection
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case filAriane = "fil_ariane"
        case infoMasquee = "info_masquee"
        case liensAnnonceurs = "liens_annonceurs"
        case maillageSeo = "maillage_seo"
        case metas
        case redirection
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        filAriane = try container.decodeIfPresent(.filAriane)
        infoMasquee = try container.decodeIfPresent(.infoMasquee)
        liensAnnonceurs = try container.decodeArrayIfPresent(.liensAnnonceurs)
        maillageSeo = try container.decodeIfPresent(.maillageSeo)
        metas = try container.decodeArrayIfPresent(.metas)
        redirection = try container.decodeIfPresent(.redirection)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(filAriane, forKey: .filAriane)
        try container.encodeIfPresent(infoMasquee, forKey: .infoMasquee)
        try container.encodeIfPresent(liensAnnonceurs, forKey: .liensAnnonceurs)
        try container.encodeIfPresent(maillageSeo, forKey: .maillageSeo)
        try container.encodeIfPresent(metas, forKey: .metas)
        try container.encodeIfPresent(redirection, forKey: .redirection)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInformationsSEOOrcFD else { return false }
      guard self.filAriane == object.filAriane else { return false }
      guard self.infoMasquee == object.infoMasquee else { return false }
      guard self.liensAnnonceurs == object.liensAnnonceurs else { return false }
      guard self.maillageSeo == object.maillageSeo else { return false }
      guard self.metas == object.metas else { return false }
      guard self.redirection == object.redirection else { return false }
      return true
    }

    public static func == (lhs: SKRInformationsSEOOrcFD, rhs: SKRInformationsSEOOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

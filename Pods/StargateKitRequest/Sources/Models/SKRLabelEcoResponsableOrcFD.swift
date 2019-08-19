/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLabelEcoResponsableOrcFD: StargateKitModel {

    public var description: String?

    public var logo: String?

    public var titre: String?

    public var uRLSite: String?

    public init(description: String? = nil, logo: String? = nil, titre: String? = nil, uRLSite: String? = nil) {
        self.description = description
        self.logo = logo
        self.titre = titre
        self.uRLSite = uRLSite
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case description
        case logo
        case titre
        case uRLSite = "url_site"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        description = try container.decodeIfPresent(.description)
        logo = try container.decodeIfPresent(.logo)
        titre = try container.decodeIfPresent(.titre)
        uRLSite = try container.decodeIfPresent(.uRLSite)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(logo, forKey: .logo)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(uRLSite, forKey: .uRLSite)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLabelEcoResponsableOrcFD else { return false }
      guard self.description == object.description else { return false }
      guard self.logo == object.logo else { return false }
      guard self.titre == object.titre else { return false }
      guard self.uRLSite == object.uRLSite else { return false }
      return true
    }

    public static func == (lhs: SKRLabelEcoResponsableOrcFD, rhs: SKRLabelEcoResponsableOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

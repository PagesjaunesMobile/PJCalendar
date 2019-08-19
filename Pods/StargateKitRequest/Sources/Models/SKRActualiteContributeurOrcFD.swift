/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRActualiteContributeurOrcFD: StargateKitModel {

    public var nom: String?

    public var uRLLogo: String?

    public init(nom: String? = nil, uRLLogo: String? = nil) {
        self.nom = nom
        self.uRLLogo = uRLLogo
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nom
        case uRLLogo = "url_logo"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nom = try container.decodeIfPresent(.nom)
        uRLLogo = try container.decodeIfPresent(.uRLLogo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(nom, forKey: .nom)
        try container.encodeIfPresent(uRLLogo, forKey: .uRLLogo)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRActualiteContributeurOrcFD else { return false }
      guard self.nom == object.nom else { return false }
      guard self.uRLLogo == object.uRLLogo else { return false }
      return true
    }

    public static func == (lhs: SKRActualiteContributeurOrcFD, rhs: SKRActualiteContributeurOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

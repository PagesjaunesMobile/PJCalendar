/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRVisuelPPPApiInscriptionOrcFD: StargateKitModel {

    public var uRLVisuel: String?

    public var visuelPrincipal: Bool?

    public init(uRLVisuel: String? = nil, visuelPrincipal: Bool? = nil) {
        self.uRLVisuel = uRLVisuel
        self.visuelPrincipal = visuelPrincipal
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case uRLVisuel = "url_visuel"
        case visuelPrincipal = "visuel_principal"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        uRLVisuel = try container.decodeIfPresent(.uRLVisuel)
        visuelPrincipal = try container.decodeIfPresent(.visuelPrincipal)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(uRLVisuel, forKey: .uRLVisuel)
        try container.encodeIfPresent(visuelPrincipal, forKey: .visuelPrincipal)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRVisuelPPPApiInscriptionOrcFD else { return false }
      guard self.uRLVisuel == object.uRLVisuel else { return false }
      guard self.visuelPrincipal == object.visuelPrincipal else { return false }
      return true
    }

    public static func == (lhs: SKRVisuelPPPApiInscriptionOrcFD, rhs: SKRVisuelPPPApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

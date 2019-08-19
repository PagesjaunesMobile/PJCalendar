/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRestaurationOrcFD: StargateKitModel {

    public var prestationsServices: [SKRDonneesSCPApiInscriptionOrcFD]?

    public init(prestationsServices: [SKRDonneesSCPApiInscriptionOrcFD]? = nil) {
        self.prestationsServices = prestationsServices
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case prestationsServices = "prestations_services"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        prestationsServices = try container.decodeArrayIfPresent(.prestationsServices)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(prestationsServices, forKey: .prestationsServices)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRestaurationOrcFD else { return false }
      guard self.prestationsServices == object.prestationsServices else { return false }
      return true
    }

    public static func == (lhs: SKRRestaurationOrcFD, rhs: SKRRestaurationOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

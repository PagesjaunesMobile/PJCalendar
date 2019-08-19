/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCarteApiInscriptionOrcFD: StargateKitModel {

    public var titre: String?

    public var typeMets: [SKRTypeMetsApiInscriptionOrcFD]?

    public init(titre: String? = nil, typeMets: [SKRTypeMetsApiInscriptionOrcFD]? = nil) {
        self.titre = titre
        self.typeMets = typeMets
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case titre
        case typeMets = "type_mets"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        titre = try container.decodeIfPresent(.titre)
        typeMets = try container.decodeArrayIfPresent(.typeMets)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(typeMets, forKey: .typeMets)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCarteApiInscriptionOrcFD else { return false }
      guard self.titre == object.titre else { return false }
      guard self.typeMets == object.typeMets else { return false }
      return true
    }

    public static func == (lhs: SKRCarteApiInscriptionOrcFD, rhs: SKRCarteApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

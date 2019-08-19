/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTypeMetsApiInscriptionOrcFD: StargateKitModel {

    public var mets: [SKRMetsApiInscriptionOrcFD]?

    public var titre: String?

    public init(mets: [SKRMetsApiInscriptionOrcFD]? = nil, titre: String? = nil) {
        self.mets = mets
        self.titre = titre
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case mets
        case titre
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        mets = try container.decodeArrayIfPresent(.mets)
        titre = try container.decodeIfPresent(.titre)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(mets, forKey: .mets)
        try container.encodeIfPresent(titre, forKey: .titre)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTypeMetsApiInscriptionOrcFD else { return false }
      guard self.mets == object.mets else { return false }
      guard self.titre == object.titre else { return false }
      return true
    }

    public static func == (lhs: SKRTypeMetsApiInscriptionOrcFD, rhs: SKRTypeMetsApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

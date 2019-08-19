/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCritereContributifApiInscriptionOrcFD: StargateKitModel {

    public var code: String?

    public var libelle: String?

    public init(code: String? = nil, libelle: String? = nil) {
        self.code = code
        self.libelle = libelle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case libelle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        libelle = try container.decodeIfPresent(.libelle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(libelle, forKey: .libelle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCritereContributifApiInscriptionOrcFD else { return false }
      guard self.code == object.code else { return false }
      guard self.libelle == object.libelle else { return false }
      return true
    }

    public static func == (lhs: SKRCritereContributifApiInscriptionOrcFD, rhs: SKRCritereContributifApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

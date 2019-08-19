/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMarqueOrcFD: StargateKitModel {

    public var libelle: String?

    public var logo: String?

    public init(libelle: String? = nil, logo: String? = nil) {
        self.libelle = libelle
        self.logo = logo
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case libelle
        case logo
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        libelle = try container.decodeIfPresent(.libelle)
        logo = try container.decodeIfPresent(.logo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(logo, forKey: .logo)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMarqueOrcFD else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.logo == object.logo else { return false }
      return true
    }

    public static func == (lhs: SKRMarqueOrcFD, rhs: SKRMarqueOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

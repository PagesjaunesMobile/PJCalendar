/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRUrlSEOOrcFD: StargateKitModel {

    public var libelle: String?

    public var url: String?

    public init(libelle: String? = nil, url: String? = nil) {
        self.libelle = libelle
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case libelle
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        libelle = try container.decodeIfPresent(.libelle)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRUrlSEOOrcFD else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRUrlSEOOrcFD, rhs: SKRUrlSEOOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

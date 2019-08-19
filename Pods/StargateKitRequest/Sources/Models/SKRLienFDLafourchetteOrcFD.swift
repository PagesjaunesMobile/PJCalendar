/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLienFDLafourchetteOrcFD: StargateKitModel {

    public var brouillageSeo: String?

    public var url: String?

    public init(brouillageSeo: String? = nil, url: String? = nil) {
        self.brouillageSeo = brouillageSeo
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case brouillageSeo = "brouillage_seo"
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        brouillageSeo = try container.decodeIfPresent(.brouillageSeo)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(brouillageSeo, forKey: .brouillageSeo)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLienFDLafourchetteOrcFD else { return false }
      guard self.brouillageSeo == object.brouillageSeo else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRLienFDLafourchetteOrcFD, rhs: SKRLienFDLafourchetteOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLstPromo: StargateKitModel {

    public var promos: [SKRPromos]

    public var teaser: SKRTeaser

    public var nbr: String?

    public init(promos: [SKRPromos], teaser: SKRTeaser, nbr: String? = nil) {
        self.promos = promos
        self.teaser = teaser
        self.nbr = nbr
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case promos
        case teaser
        case nbr
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        promos = try container.decodeArray(.promos)
        teaser = try container.decode(.teaser)
        nbr = try container.decodeIfPresent(.nbr)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(promos, forKey: .promos)
        try container.encode(teaser, forKey: .teaser)
        try container.encodeIfPresent(nbr, forKey: .nbr)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLstPromo else { return false }
      guard self.promos == object.promos else { return false }
      guard self.teaser == object.teaser else { return false }
      guard self.nbr == object.nbr else { return false }
      return true
    }

    public static func == (lhs: SKRLstPromo, rhs: SKRLstPromo) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPromos: StargateKitModel {

    public var nbr: String?

    public var promo: [SKRPromo]?

    public var source: String?

    public init(nbr: String? = nil, promo: [SKRPromo]? = nil, source: String? = nil) {
        self.nbr = nbr
        self.promo = promo
        self.source = source
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nbr
        case promo
        case source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nbr = try container.decodeIfPresent(.nbr)
        promo = try container.decodeArrayIfPresent(.promo)
        source = try container.decodeIfPresent(.source)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(nbr, forKey: .nbr)
        try container.encodeIfPresent(promo, forKey: .promo)
        try container.encodeIfPresent(source, forKey: .source)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPromos else { return false }
      guard self.nbr == object.nbr else { return false }
      guard self.promo == object.promo else { return false }
      guard self.source == object.source else { return false }
      return true
    }

    public static func == (lhs: SKRPromos, rhs: SKRPromos) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

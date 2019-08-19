/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDtReview: StargateKitModel {

    public var count: String?

    public var ratg: String?

    public var source: String?

    public init(count: String? = nil, ratg: String? = nil, source: String? = nil) {
        self.count = count
        self.ratg = ratg
        self.source = source
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case count
        case ratg
        case source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decodeIfPresent(.count)
        ratg = try container.decodeIfPresent(.ratg)
        source = try container.decodeIfPresent(.source)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(ratg, forKey: .ratg)
        try container.encodeIfPresent(source, forKey: .source)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDtReview else { return false }
      guard self.count == object.count else { return false }
      guard self.ratg == object.ratg else { return false }
      guard self.source == object.source else { return false }
      return true
    }

    public static func == (lhs: SKRDtReview, rhs: SKRDtReview) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

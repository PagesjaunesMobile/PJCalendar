/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRatg: StargateKitModel {

    public var item: String?

    public var score: String?

    public init(item: String? = nil, score: String? = nil) {
        self.item = item
        self.score = score
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case item
        case score
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        item = try container.decodeIfPresent(.item)
        score = try container.decodeIfPresent(.score)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(score, forKey: .score)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRatg else { return false }
      guard self.item == object.item else { return false }
      guard self.score == object.score else { return false }
      return true
    }

    public static func == (lhs: SKRRatg, rhs: SKRRatg) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

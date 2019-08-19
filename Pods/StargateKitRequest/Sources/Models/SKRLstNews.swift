/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLstNews: StargateKitModel {

    public var news: [SKRNews]

    public var count: String?

    public var limit: String?

    public var offset: String?

    public init(news: [SKRNews], count: String? = nil, limit: String? = nil, offset: String? = nil) {
        self.news = news
        self.count = count
        self.limit = limit
        self.offset = offset
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case news
        case count
        case limit
        case offset
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        news = try container.decodeArray(.news)
        count = try container.decodeIfPresent(.count)
        limit = try container.decodeIfPresent(.limit)
        offset = try container.decodeIfPresent(.offset)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(news, forKey: .news)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(offset, forKey: .offset)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLstNews else { return false }
      guard self.news == object.news else { return false }
      guard self.count == object.count else { return false }
      guard self.limit == object.limit else { return false }
      guard self.offset == object.offset else { return false }
      return true
    }

    public static func == (lhs: SKRLstNews, rhs: SKRLstNews) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSorts: StargateKitModel {

    public var sort: [SKRSort]?

    public var updated: Bool?

    public init(sort: [SKRSort]? = nil, updated: Bool? = nil) {
        self.sort = sort
        self.updated = updated
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case sort
        case updated
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        sort = try container.decodeArrayIfPresent(.sort)
        updated = try container.decodeIfPresent(.updated)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(sort, forKey: .sort)
        try container.encodeIfPresent(updated, forKey: .updated)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSorts else { return false }
      guard self.sort == object.sort else { return false }
      guard self.updated == object.updated else { return false }
      return true
    }

    public static func == (lhs: SKRSorts, rhs: SKRSorts) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

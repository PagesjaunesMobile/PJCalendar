/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSug: StargateKitModel {

    public var count: Int?

    public var id: String?

    public var label: String?

    public init(count: Int? = nil, id: String? = nil, label: String? = nil) {
        self.count = count
        self.id = id
        self.label = label
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case count
        case id
        case label
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decodeIfPresent(.count)
        id = try container.decodeIfPresent(.id)
        label = try container.decodeIfPresent(.label)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(label, forKey: .label)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSug else { return false }
      guard self.count == object.count else { return false }
      guard self.id == object.id else { return false }
      guard self.label == object.label else { return false }
      return true
    }

    public static func == (lhs: SKRSug, rhs: SKRSug) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

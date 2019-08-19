/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKROuList: StargateKitModel {

    public var count: Int?

    public var item: [SKROuItem]?

    public var label: String?

    public init(count: Int? = nil, item: [SKROuItem]? = nil, label: String? = nil) {
        self.count = count
        self.item = item
        self.label = label
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case count
        case item
        case label
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decodeIfPresent(.count)
        item = try container.decodeArrayIfPresent(.item)
        label = try container.decodeIfPresent(.label)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(label, forKey: .label)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKROuList else { return false }
      guard self.count == object.count else { return false }
      guard self.item == object.item else { return false }
      guard self.label == object.label else { return false }
      return true
    }

    public static func == (lhs: SKROuList, rhs: SKROuList) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

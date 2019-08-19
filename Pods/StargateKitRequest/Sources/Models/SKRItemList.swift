/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRItemList: StargateKitModel {

    public var actCode: String?

    public var count: String?

    public var label: String?

    public var placeCode: String?

    public init(actCode: String? = nil, count: String? = nil, label: String? = nil, placeCode: String? = nil) {
        self.actCode = actCode
        self.count = count
        self.label = label
        self.placeCode = placeCode
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actCode
        case count
        case label
        case placeCode
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actCode = try container.decodeIfPresent(.actCode)
        count = try container.decodeIfPresent(.count)
        label = try container.decodeIfPresent(.label)
        placeCode = try container.decodeIfPresent(.placeCode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actCode, forKey: .actCode)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(placeCode, forKey: .placeCode)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRItemList else { return false }
      guard self.actCode == object.actCode else { return false }
      guard self.count == object.count else { return false }
      guard self.label == object.label else { return false }
      guard self.placeCode == object.placeCode else { return false }
      return true
    }

    public static func == (lhs: SKRItemList, rhs: SKRItemList) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

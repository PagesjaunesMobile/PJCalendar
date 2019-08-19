/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFormule: StargateKitModel {

    public var desc: String?

    public var price: String?

    public var title: String?

    public var value: String?

    public init(desc: String? = nil, price: String? = nil, title: String? = nil, value: String? = nil) {
        self.desc = desc
        self.price = price
        self.title = title
        self.value = value
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case desc
        case price
        case title
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        desc = try container.decodeIfPresent(.desc)
        price = try container.decodeIfPresent(.price)
        title = try container.decodeIfPresent(.title)
        value = try container.decodeIfPresent(.value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(desc, forKey: .desc)
        try container.encodeIfPresent(price, forKey: .price)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(value, forKey: .value)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFormule else { return false }
      guard self.desc == object.desc else { return false }
      guard self.price == object.price else { return false }
      guard self.title == object.title else { return false }
      guard self.value == object.value else { return false }
      return true
    }

    public static func == (lhs: SKRFormule, rhs: SKRFormule) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

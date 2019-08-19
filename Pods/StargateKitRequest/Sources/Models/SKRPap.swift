/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPap: StargateKitModel {

    public var dist: Int?

    public var lat: Double?

    public var lng: Double?

    public var name: String?

    public var papItem: [SKRPapItem]?

    public init(dist: Int? = nil, lat: Double? = nil, lng: Double? = nil, name: String? = nil, papItem: [SKRPapItem]? = nil) {
        self.dist = dist
        self.lat = lat
        self.lng = lng
        self.name = name
        self.papItem = papItem
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dist
        case lat
        case lng
        case name
        case papItem
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dist = try container.decodeIfPresent(.dist)
        lat = try container.decodeIfPresent(.lat)
        lng = try container.decodeIfPresent(.lng)
        name = try container.decodeIfPresent(.name)
        papItem = try container.decodeArrayIfPresent(.papItem)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dist, forKey: .dist)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(papItem, forKey: .papItem)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPap else { return false }
      guard self.dist == object.dist else { return false }
      guard self.lat == object.lat else { return false }
      guard self.lng == object.lng else { return false }
      guard self.name == object.name else { return false }
      guard self.papItem == object.papItem else { return false }
      return true
    }

    public static func == (lhs: SKRPap, rhs: SKRPap) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRBlocReverse: StargateKitModel {

    public var id: String?

    public var lat: Double?

    public var lng: Double?

    public var name: String?

    public var type: String?

    public init(id: String? = nil, lat: Double? = nil, lng: Double? = nil, name: String? = nil, type: String? = nil) {
        self.id = id
        self.lat = lat
        self.lng = lng
        self.name = name
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case id
        case lat
        case lng
        case name
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decodeIfPresent(.id)
        lat = try container.decodeIfPresent(.lat)
        lng = try container.decodeIfPresent(.lng)
        name = try container.decodeIfPresent(.name)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRBlocReverse else { return false }
      guard self.id == object.id else { return false }
      guard self.lat == object.lat else { return false }
      guard self.lng == object.lng else { return false }
      guard self.name == object.name else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRBlocReverse, rhs: SKRBlocReverse) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

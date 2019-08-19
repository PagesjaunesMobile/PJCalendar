/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRList: StargateKitModel {

    public var bloc: [SKRBloc]?

    public var count: Int?

    public var item: [SKRItemList]?

    public var label: String?

    public var lat: Double?

    public var lng: Double?

    public var type: String?

    public init(bloc: [SKRBloc]? = nil, count: Int? = nil, item: [SKRItemList]? = nil, label: String? = nil, lat: Double? = nil, lng: Double? = nil, type: String? = nil) {
        self.bloc = bloc
        self.count = count
        self.item = item
        self.label = label
        self.lat = lat
        self.lng = lng
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case bloc
        case count
        case item
        case label
        case lat
        case lng
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        bloc = try container.decodeArrayIfPresent(.bloc)
        count = try container.decodeIfPresent(.count)
        item = try container.decodeArrayIfPresent(.item)
        label = try container.decodeIfPresent(.label)
        lat = try container.decodeIfPresent(.lat)
        lng = try container.decodeIfPresent(.lng)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(bloc, forKey: .bloc)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRList else { return false }
      guard self.bloc == object.bloc else { return false }
      guard self.count == object.count else { return false }
      guard self.item == object.item else { return false }
      guard self.label == object.label else { return false }
      guard self.lat == object.lat else { return false }
      guard self.lng == object.lng else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRList, rhs: SKRList) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

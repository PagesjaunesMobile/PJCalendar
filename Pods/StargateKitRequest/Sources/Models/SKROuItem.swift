/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKROuItem: StargateKitModel {

    public var label: String?

    public var lat: Double?

    public var lng: Double?

    public var placeCode: String?

    public init(label: String? = nil, lat: Double? = nil, lng: Double? = nil, placeCode: String? = nil) {
        self.label = label
        self.lat = lat
        self.lng = lng
        self.placeCode = placeCode
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case lat
        case lng
        case placeCode
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        lat = try container.decodeIfPresent(.lat)
        lng = try container.decodeIfPresent(.lng)
        placeCode = try container.decodeIfPresent(.placeCode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
        try container.encodeIfPresent(placeCode, forKey: .placeCode)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKROuItem else { return false }
      guard self.label == object.label else { return false }
      guard self.lat == object.lat else { return false }
      guard self.lng == object.lng else { return false }
      guard self.placeCode == object.placeCode else { return false }
      return true
    }

    public static func == (lhs: SKROuItem, rhs: SKROuItem) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

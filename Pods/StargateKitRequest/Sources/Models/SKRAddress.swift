/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAddress: StargateKitModel {

    public var acc: String?

    public var city: String?

    public var cityId: String?

    public var cityUV: String?

    public var distUV: String?

    public var lat: String?

    public var lng: String?

    public var st: String?

    public var stNb: String?

    public var zip: String?

    public init(acc: String? = nil, city: String? = nil, cityId: String? = nil, cityUV: String? = nil, distUV: String? = nil, lat: String? = nil, lng: String? = nil, st: String? = nil, stNb: String? = nil, zip: String? = nil) {
        self.acc = acc
        self.city = city
        self.cityId = cityId
        self.cityUV = cityUV
        self.distUV = distUV
        self.lat = lat
        self.lng = lng
        self.st = st
        self.stNb = stNb
        self.zip = zip
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case acc
        case city
        case cityId
        case cityUV
        case distUV
        case lat
        case lng
        case st
        case stNb
        case zip
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        acc = try container.decodeIfPresent(.acc)
        city = try container.decodeIfPresent(.city)
        cityId = try container.decodeIfPresent(.cityId)
        cityUV = try container.decodeIfPresent(.cityUV)
        distUV = try container.decodeIfPresent(.distUV)
        lat = try container.decodeIfPresent(.lat)
        lng = try container.decodeIfPresent(.lng)
        st = try container.decodeIfPresent(.st)
        stNb = try container.decodeIfPresent(.stNb)
        zip = try container.decodeIfPresent(.zip)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(acc, forKey: .acc)
        try container.encodeIfPresent(city, forKey: .city)
        try container.encodeIfPresent(cityId, forKey: .cityId)
        try container.encodeIfPresent(cityUV, forKey: .cityUV)
        try container.encodeIfPresent(distUV, forKey: .distUV)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(lng, forKey: .lng)
        try container.encodeIfPresent(st, forKey: .st)
        try container.encodeIfPresent(stNb, forKey: .stNb)
        try container.encodeIfPresent(zip, forKey: .zip)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAddress else { return false }
      guard self.acc == object.acc else { return false }
      guard self.city == object.city else { return false }
      guard self.cityId == object.cityId else { return false }
      guard self.cityUV == object.cityUV else { return false }
      guard self.distUV == object.distUV else { return false }
      guard self.lat == object.lat else { return false }
      guard self.lng == object.lng else { return false }
      guard self.st == object.st else { return false }
      guard self.stNb == object.stNb else { return false }
      guard self.zip == object.zip else { return false }
      return true
    }

    public static func == (lhs: SKRAddress, rhs: SKRAddress) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

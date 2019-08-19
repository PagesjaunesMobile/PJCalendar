/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPInfos: StargateKitModel {

    public var cat: [SKRCategorieLr]?

    public var cuisines: String?

    public var ecoLab: String?

    public var menu: [SKRMenuLR]?

    public var pRoom: SKRPRoom?

    public var pay: String?

    public var price: Int?

    public var prices: SKRPrices?

    public var reco: String?

    public var services: String?

    public init(cat: [SKRCategorieLr]? = nil, cuisines: String? = nil, ecoLab: String? = nil, menu: [SKRMenuLR]? = nil, pRoom: SKRPRoom? = nil, pay: String? = nil, price: Int? = nil, prices: SKRPrices? = nil, reco: String? = nil, services: String? = nil) {
        self.cat = cat
        self.cuisines = cuisines
        self.ecoLab = ecoLab
        self.menu = menu
        self.pRoom = pRoom
        self.pay = pay
        self.price = price
        self.prices = prices
        self.reco = reco
        self.services = services
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case cat
        case cuisines
        case ecoLab
        case menu
        case pRoom
        case pay
        case price
        case prices
        case reco
        case services
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        cat = try container.decodeArrayIfPresent(.cat)
        cuisines = try container.decodeIfPresent(.cuisines)
        ecoLab = try container.decodeIfPresent(.ecoLab)
        menu = try container.decodeArrayIfPresent(.menu)
        pRoom = try container.decodeIfPresent(.pRoom)
        pay = try container.decodeIfPresent(.pay)
        price = try container.decodeIfPresent(.price)
        prices = try container.decodeIfPresent(.prices)
        reco = try container.decodeIfPresent(.reco)
        services = try container.decodeIfPresent(.services)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(cat, forKey: .cat)
        try container.encodeIfPresent(cuisines, forKey: .cuisines)
        try container.encodeIfPresent(ecoLab, forKey: .ecoLab)
        try container.encodeIfPresent(menu, forKey: .menu)
        try container.encodeIfPresent(pRoom, forKey: .pRoom)
        try container.encodeIfPresent(pay, forKey: .pay)
        try container.encodeIfPresent(price, forKey: .price)
        try container.encodeIfPresent(prices, forKey: .prices)
        try container.encodeIfPresent(reco, forKey: .reco)
        try container.encodeIfPresent(services, forKey: .services)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPInfos else { return false }
      guard self.cat == object.cat else { return false }
      guard self.cuisines == object.cuisines else { return false }
      guard self.ecoLab == object.ecoLab else { return false }
      guard self.menu == object.menu else { return false }
      guard self.pRoom == object.pRoom else { return false }
      guard self.pay == object.pay else { return false }
      guard self.price == object.price else { return false }
      guard self.prices == object.prices else { return false }
      guard self.reco == object.reco else { return false }
      guard self.services == object.services else { return false }
      return true
    }

    public static func == (lhs: SKRPInfos, rhs: SKRPInfos) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

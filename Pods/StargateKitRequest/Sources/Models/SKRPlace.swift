/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPlace: StargateKitModel {

    public var act: [SKRActPlace]?

    public var address: SKRAddress?

    public var albums: SKRAlbums?

    public var codEtab: String?

    public var cqfd: SKRCqfd?

    public var dv: [SKRDvElement]?

    public var email: [SKREmail]?

    public var goTo: String?

    public var id: String?

    public var idf: Bool?

    public var index: Int?

    public var lbMenu: Bool?

    public var lstNews: SKRLstNews?

    public var lstProduct: [SKRProduct]?

    public var lstPromo: SKRLstPromo?

    public var map: String?

    public var name: String?

    public var nbReview: String?

    public var notGeocod: Bool?

    public var pInfo: SKRPInfos?

    public var paps: [SKRPap]?

    public var parts: [SKRPart]?

    public var phone: [SKRPhone]?

    public var photos: SKRPhotos?

    public var pic: String?

    public var pushA: SKRPushA?

    public var pushR: SKRPushR?

    public var ratg: String?

    public var revAllowed: Bool?

    public var revBlocked: Bool?

    public var sat: String?

    public var sat3d: String?

    public var schedule: [SKRSchedule]?

    public var tags: String?

    public var url: SKRUrlLr?

    public var uRLSeo: String?

    public var videos: SKRVideos?

    public init(act: [SKRActPlace]? = nil, address: SKRAddress? = nil, albums: SKRAlbums? = nil, codEtab: String? = nil, cqfd: SKRCqfd? = nil, dv: [SKRDvElement]? = nil, email: [SKREmail]? = nil, goTo: String? = nil, id: String? = nil, idf: Bool? = nil, index: Int? = nil, lbMenu: Bool? = nil, lstNews: SKRLstNews? = nil, lstProduct: [SKRProduct]? = nil, lstPromo: SKRLstPromo? = nil, map: String? = nil, name: String? = nil, nbReview: String? = nil, notGeocod: Bool? = nil, pInfo: SKRPInfos? = nil, paps: [SKRPap]? = nil, parts: [SKRPart]? = nil, phone: [SKRPhone]? = nil, photos: SKRPhotos? = nil, pic: String? = nil, pushA: SKRPushA? = nil, pushR: SKRPushR? = nil, ratg: String? = nil, revAllowed: Bool? = nil, revBlocked: Bool? = nil, sat: String? = nil, sat3d: String? = nil, schedule: [SKRSchedule]? = nil, tags: String? = nil, url: SKRUrlLr? = nil, uRLSeo: String? = nil, videos: SKRVideos? = nil) {
        self.act = act
        self.address = address
        self.albums = albums
        self.codEtab = codEtab
        self.cqfd = cqfd
        self.dv = dv
        self.email = email
        self.goTo = goTo
        self.id = id
        self.idf = idf
        self.index = index
        self.lbMenu = lbMenu
        self.lstNews = lstNews
        self.lstProduct = lstProduct
        self.lstPromo = lstPromo
        self.map = map
        self.name = name
        self.nbReview = nbReview
        self.notGeocod = notGeocod
        self.pInfo = pInfo
        self.paps = paps
        self.parts = parts
        self.phone = phone
        self.photos = photos
        self.pic = pic
        self.pushA = pushA
        self.pushR = pushR
        self.ratg = ratg
        self.revAllowed = revAllowed
        self.revBlocked = revBlocked
        self.sat = sat
        self.sat3d = sat3d
        self.schedule = schedule
        self.tags = tags
        self.url = url
        self.uRLSeo = uRLSeo
        self.videos = videos
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case act
        case address
        case albums
        case codEtab
        case cqfd
        case dv
        case email
        case goTo
        case id
        case idf
        case index
        case lbMenu
        case lstNews
        case lstProduct
        case lstPromo
        case map
        case name
        case nbReview
        case notGeocod
        case pInfo
        case paps
        case parts
        case phone
        case photos
        case pic
        case pushA
        case pushR
        case ratg
        case revAllowed
        case revBlocked
        case sat
        case sat3d
        case schedule
        case tags
        case url
        case uRLSeo = "url_seo"
        case videos
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        act = try container.decodeArrayIfPresent(.act)
        address = try container.decodeIfPresent(.address)
        albums = try container.decodeIfPresent(.albums)
        codEtab = try container.decodeIfPresent(.codEtab)
        cqfd = try container.decodeIfPresent(.cqfd)
        dv = try container.decodeArrayIfPresent(.dv)
        email = try container.decodeArrayIfPresent(.email)
        goTo = try container.decodeIfPresent(.goTo)
        id = try container.decodeIfPresent(.id)
        idf = try container.decodeIfPresent(.idf)
        index = try container.decodeIfPresent(.index)
        lbMenu = try container.decodeIfPresent(.lbMenu)
        lstNews = try container.decodeIfPresent(.lstNews)
        lstProduct = try container.decodeArrayIfPresent(.lstProduct)
        lstPromo = try container.decodeIfPresent(.lstPromo)
        map = try container.decodeIfPresent(.map)
        name = try container.decodeIfPresent(.name)
        nbReview = try container.decodeIfPresent(.nbReview)
        notGeocod = try container.decodeIfPresent(.notGeocod)
        pInfo = try container.decodeIfPresent(.pInfo)
        paps = try container.decodeArrayIfPresent(.paps)
        parts = try container.decodeArrayIfPresent(.parts)
        phone = try container.decodeArrayIfPresent(.phone)
        photos = try container.decodeIfPresent(.photos)
        pic = try container.decodeIfPresent(.pic)
        pushA = try container.decodeIfPresent(.pushA)
        pushR = try container.decodeIfPresent(.pushR)
        ratg = try container.decodeIfPresent(.ratg)
        revAllowed = try container.decodeIfPresent(.revAllowed)
        revBlocked = try container.decodeIfPresent(.revBlocked)
        sat = try container.decodeIfPresent(.sat)
        sat3d = try container.decodeIfPresent(.sat3d)
        schedule = try container.decodeArrayIfPresent(.schedule)
        tags = try container.decodeIfPresent(.tags)
        url = try container.decodeIfPresent(.url)
        uRLSeo = try container.decodeIfPresent(.uRLSeo)
        videos = try container.decodeIfPresent(.videos)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(act, forKey: .act)
        try container.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(albums, forKey: .albums)
        try container.encodeIfPresent(codEtab, forKey: .codEtab)
        try container.encodeIfPresent(cqfd, forKey: .cqfd)
        try container.encodeIfPresent(dv, forKey: .dv)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(goTo, forKey: .goTo)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(idf, forKey: .idf)
        try container.encodeIfPresent(index, forKey: .index)
        try container.encodeIfPresent(lbMenu, forKey: .lbMenu)
        try container.encodeIfPresent(lstNews, forKey: .lstNews)
        try container.encodeIfPresent(lstProduct, forKey: .lstProduct)
        try container.encodeIfPresent(lstPromo, forKey: .lstPromo)
        try container.encodeIfPresent(map, forKey: .map)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(nbReview, forKey: .nbReview)
        try container.encodeIfPresent(notGeocod, forKey: .notGeocod)
        try container.encodeIfPresent(pInfo, forKey: .pInfo)
        try container.encodeIfPresent(paps, forKey: .paps)
        try container.encodeIfPresent(parts, forKey: .parts)
        try container.encodeIfPresent(phone, forKey: .phone)
        try container.encodeIfPresent(photos, forKey: .photos)
        try container.encodeIfPresent(pic, forKey: .pic)
        try container.encodeIfPresent(pushA, forKey: .pushA)
        try container.encodeIfPresent(pushR, forKey: .pushR)
        try container.encodeIfPresent(ratg, forKey: .ratg)
        try container.encodeIfPresent(revAllowed, forKey: .revAllowed)
        try container.encodeIfPresent(revBlocked, forKey: .revBlocked)
        try container.encodeIfPresent(sat, forKey: .sat)
        try container.encodeIfPresent(sat3d, forKey: .sat3d)
        try container.encodeIfPresent(schedule, forKey: .schedule)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(uRLSeo, forKey: .uRLSeo)
        try container.encodeIfPresent(videos, forKey: .videos)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPlace else { return false }
      guard self.act == object.act else { return false }
      guard self.address == object.address else { return false }
      guard self.albums == object.albums else { return false }
      guard self.codEtab == object.codEtab else { return false }
      guard self.cqfd == object.cqfd else { return false }
      guard self.dv == object.dv else { return false }
      guard self.email == object.email else { return false }
      guard self.goTo == object.goTo else { return false }
      guard self.id == object.id else { return false }
      guard self.idf == object.idf else { return false }
      guard self.index == object.index else { return false }
      guard self.lbMenu == object.lbMenu else { return false }
      guard self.lstNews == object.lstNews else { return false }
      guard self.lstProduct == object.lstProduct else { return false }
      guard self.lstPromo == object.lstPromo else { return false }
      guard self.map == object.map else { return false }
      guard self.name == object.name else { return false }
      guard self.nbReview == object.nbReview else { return false }
      guard self.notGeocod == object.notGeocod else { return false }
      guard self.pInfo == object.pInfo else { return false }
      guard self.paps == object.paps else { return false }
      guard self.parts == object.parts else { return false }
      guard self.phone == object.phone else { return false }
      guard self.photos == object.photos else { return false }
      guard self.pic == object.pic else { return false }
      guard self.pushA == object.pushA else { return false }
      guard self.pushR == object.pushR else { return false }
      guard self.ratg == object.ratg else { return false }
      guard self.revAllowed == object.revAllowed else { return false }
      guard self.revBlocked == object.revBlocked else { return false }
      guard self.sat == object.sat else { return false }
      guard self.sat3d == object.sat3d else { return false }
      guard self.schedule == object.schedule else { return false }
      guard self.tags == object.tags else { return false }
      guard self.url == object.url else { return false }
      guard self.uRLSeo == object.uRLSeo else { return false }
      guard self.videos == object.videos else { return false }
      return true
    }

    public static func == (lhs: SKRPlace, rhs: SKRPlace) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

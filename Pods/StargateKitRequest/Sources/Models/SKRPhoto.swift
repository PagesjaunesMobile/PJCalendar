/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPhoto: StargateKitModel {

    public var allowRUI: String?

    public var appParam: String?

    public var brand: String?

    public var cat: String?

    public var date: String?

    public var desc: String?

    public var isTTC: Bool?

    public var labelP: String?

    public var lat: String?

    public var long: String?

    public var model: String?

    public var photoH: Int?

    public var photoId: String?

    public var photoURL: String?

    public var photoW: Int?

    public var pos: String?

    public var prdId: String?

    public var prdName: String?

    public var prdRef: String?

    public var priDisp: String?

    public var priEco: Bool?

    public var priFrom: Bool?

    public var price: String?

    public var pseudo: String?

    public var thumbURL: String?

    public var title: String?

    public var type: String?

    public var xcity: String?

    public var xlabel1: String?

    public var xlabel2: String?

    public var xsurf: String?

    public init(allowRUI: String? = nil, appParam: String? = nil, brand: String? = nil, cat: String? = nil, date: String? = nil, desc: String? = nil, isTTC: Bool? = nil, labelP: String? = nil, lat: String? = nil, long: String? = nil, model: String? = nil, photoH: Int? = nil, photoId: String? = nil, photoURL: String? = nil, photoW: Int? = nil, pos: String? = nil, prdId: String? = nil, prdName: String? = nil, prdRef: String? = nil, priDisp: String? = nil, priEco: Bool? = nil, priFrom: Bool? = nil, price: String? = nil, pseudo: String? = nil, thumbURL: String? = nil, title: String? = nil, type: String? = nil, xcity: String? = nil, xlabel1: String? = nil, xlabel2: String? = nil, xsurf: String? = nil) {
        self.allowRUI = allowRUI
        self.appParam = appParam
        self.brand = brand
        self.cat = cat
        self.date = date
        self.desc = desc
        self.isTTC = isTTC
        self.labelP = labelP
        self.lat = lat
        self.long = long
        self.model = model
        self.photoH = photoH
        self.photoId = photoId
        self.photoURL = photoURL
        self.photoW = photoW
        self.pos = pos
        self.prdId = prdId
        self.prdName = prdName
        self.prdRef = prdRef
        self.priDisp = priDisp
        self.priEco = priEco
        self.priFrom = priFrom
        self.price = price
        self.pseudo = pseudo
        self.thumbURL = thumbURL
        self.title = title
        self.type = type
        self.xcity = xcity
        self.xlabel1 = xlabel1
        self.xlabel2 = xlabel2
        self.xsurf = xsurf
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case allowRUI
        case appParam
        case brand
        case cat
        case date
        case desc
        case isTTC
        case labelP
        case lat
        case long
        case model
        case photoH
        case photoId
        case photoURL
        case photoW
        case pos
        case prdId
        case prdName
        case prdRef
        case priDisp
        case priEco
        case priFrom
        case price
        case pseudo
        case thumbURL
        case title
        case type
        case xcity
        case xlabel1
        case xlabel2
        case xsurf
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        allowRUI = try container.decodeIfPresent(.allowRUI)
        appParam = try container.decodeIfPresent(.appParam)
        brand = try container.decodeIfPresent(.brand)
        cat = try container.decodeIfPresent(.cat)
        date = try container.decodeIfPresent(.date)
        desc = try container.decodeIfPresent(.desc)
        isTTC = try container.decodeIfPresent(.isTTC)
        labelP = try container.decodeIfPresent(.labelP)
        lat = try container.decodeIfPresent(.lat)
        long = try container.decodeIfPresent(.long)
        model = try container.decodeIfPresent(.model)
        photoH = try container.decodeIfPresent(.photoH)
        photoId = try container.decodeIfPresent(.photoId)
        photoURL = try container.decodeIfPresent(.photoURL)
        photoW = try container.decodeIfPresent(.photoW)
        pos = try container.decodeIfPresent(.pos)
        prdId = try container.decodeIfPresent(.prdId)
        prdName = try container.decodeIfPresent(.prdName)
        prdRef = try container.decodeIfPresent(.prdRef)
        priDisp = try container.decodeIfPresent(.priDisp)
        priEco = try container.decodeIfPresent(.priEco)
        priFrom = try container.decodeIfPresent(.priFrom)
        price = try container.decodeIfPresent(.price)
        pseudo = try container.decodeIfPresent(.pseudo)
        thumbURL = try container.decodeIfPresent(.thumbURL)
        title = try container.decodeIfPresent(.title)
        type = try container.decodeIfPresent(.type)
        xcity = try container.decodeIfPresent(.xcity)
        xlabel1 = try container.decodeIfPresent(.xlabel1)
        xlabel2 = try container.decodeIfPresent(.xlabel2)
        xsurf = try container.decodeIfPresent(.xsurf)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(allowRUI, forKey: .allowRUI)
        try container.encodeIfPresent(appParam, forKey: .appParam)
        try container.encodeIfPresent(brand, forKey: .brand)
        try container.encodeIfPresent(cat, forKey: .cat)
        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(desc, forKey: .desc)
        try container.encodeIfPresent(isTTC, forKey: .isTTC)
        try container.encodeIfPresent(labelP, forKey: .labelP)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(long, forKey: .long)
        try container.encodeIfPresent(model, forKey: .model)
        try container.encodeIfPresent(photoH, forKey: .photoH)
        try container.encodeIfPresent(photoId, forKey: .photoId)
        try container.encodeIfPresent(photoURL, forKey: .photoURL)
        try container.encodeIfPresent(photoW, forKey: .photoW)
        try container.encodeIfPresent(pos, forKey: .pos)
        try container.encodeIfPresent(prdId, forKey: .prdId)
        try container.encodeIfPresent(prdName, forKey: .prdName)
        try container.encodeIfPresent(prdRef, forKey: .prdRef)
        try container.encodeIfPresent(priDisp, forKey: .priDisp)
        try container.encodeIfPresent(priEco, forKey: .priEco)
        try container.encodeIfPresent(priFrom, forKey: .priFrom)
        try container.encodeIfPresent(price, forKey: .price)
        try container.encodeIfPresent(pseudo, forKey: .pseudo)
        try container.encodeIfPresent(thumbURL, forKey: .thumbURL)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(xcity, forKey: .xcity)
        try container.encodeIfPresent(xlabel1, forKey: .xlabel1)
        try container.encodeIfPresent(xlabel2, forKey: .xlabel2)
        try container.encodeIfPresent(xsurf, forKey: .xsurf)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPhoto else { return false }
      guard self.allowRUI == object.allowRUI else { return false }
      guard self.appParam == object.appParam else { return false }
      guard self.brand == object.brand else { return false }
      guard self.cat == object.cat else { return false }
      guard self.date == object.date else { return false }
      guard self.desc == object.desc else { return false }
      guard self.isTTC == object.isTTC else { return false }
      guard self.labelP == object.labelP else { return false }
      guard self.lat == object.lat else { return false }
      guard self.long == object.long else { return false }
      guard self.model == object.model else { return false }
      guard self.photoH == object.photoH else { return false }
      guard self.photoId == object.photoId else { return false }
      guard self.photoURL == object.photoURL else { return false }
      guard self.photoW == object.photoW else { return false }
      guard self.pos == object.pos else { return false }
      guard self.prdId == object.prdId else { return false }
      guard self.prdName == object.prdName else { return false }
      guard self.prdRef == object.prdRef else { return false }
      guard self.priDisp == object.priDisp else { return false }
      guard self.priEco == object.priEco else { return false }
      guard self.priFrom == object.priFrom else { return false }
      guard self.price == object.price else { return false }
      guard self.pseudo == object.pseudo else { return false }
      guard self.thumbURL == object.thumbURL else { return false }
      guard self.title == object.title else { return false }
      guard self.type == object.type else { return false }
      guard self.xcity == object.xcity else { return false }
      guard self.xlabel1 == object.xlabel1 else { return false }
      guard self.xlabel2 == object.xlabel2 else { return false }
      guard self.xsurf == object.xsurf else { return false }
      return true
    }

    public static func == (lhs: SKRPhoto, rhs: SKRPhoto) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

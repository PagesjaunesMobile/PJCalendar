/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRReview: StargateKitModel {

    public var actCode: String?

    public var cityId: String?

    public var comment: String?

    public var date: String?

    public var ddr: SKRDroitDeReponse?

    public var etabCode: String?

    public var label: String?

    public var name: String?

    public var neg: String?

    public var pos: String?

    public var pseudo: String?

    public var publie: Bool?

    public var ratg: String?

    public var ratgs: [SKRRatg]?

    public var revId: String?

    public var state: String?

    public var title: String?

    public var type: String?

    public var urlPhoto: String?

    public var xpEdate: String?

    public var xpFlag: Bool?

    public var xpSdate: String?

    public init(actCode: String? = nil, cityId: String? = nil, comment: String? = nil, date: String? = nil, ddr: SKRDroitDeReponse? = nil, etabCode: String? = nil, label: String? = nil, name: String? = nil, neg: String? = nil, pos: String? = nil, pseudo: String? = nil, publie: Bool? = nil, ratg: String? = nil, ratgs: [SKRRatg]? = nil, revId: String? = nil, state: String? = nil, title: String? = nil, type: String? = nil, urlPhoto: String? = nil, xpEdate: String? = nil, xpFlag: Bool? = nil, xpSdate: String? = nil) {
        self.actCode = actCode
        self.cityId = cityId
        self.comment = comment
        self.date = date
        self.ddr = ddr
        self.etabCode = etabCode
        self.label = label
        self.name = name
        self.neg = neg
        self.pos = pos
        self.pseudo = pseudo
        self.publie = publie
        self.ratg = ratg
        self.ratgs = ratgs
        self.revId = revId
        self.state = state
        self.title = title
        self.type = type
        self.urlPhoto = urlPhoto
        self.xpEdate = xpEdate
        self.xpFlag = xpFlag
        self.xpSdate = xpSdate
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actCode = "act_code"
        case cityId
        case comment
        case date
        case ddr
        case etabCode = "etab_code"
        case label
        case name
        case neg
        case pos
        case pseudo
        case publie
        case ratg
        case ratgs
        case revId
        case state
        case title
        case type
        case urlPhoto
        case xpEdate
        case xpFlag
        case xpSdate
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actCode = try container.decodeIfPresent(.actCode)
        cityId = try container.decodeIfPresent(.cityId)
        comment = try container.decodeIfPresent(.comment)
        date = try container.decodeIfPresent(.date)
        ddr = try container.decodeIfPresent(.ddr)
        etabCode = try container.decodeIfPresent(.etabCode)
        label = try container.decodeIfPresent(.label)
        name = try container.decodeIfPresent(.name)
        neg = try container.decodeIfPresent(.neg)
        pos = try container.decodeIfPresent(.pos)
        pseudo = try container.decodeIfPresent(.pseudo)
        publie = try container.decodeIfPresent(.publie)
        ratg = try container.decodeIfPresent(.ratg)
        ratgs = try container.decodeArrayIfPresent(.ratgs)
        revId = try container.decodeIfPresent(.revId)
        state = try container.decodeIfPresent(.state)
        title = try container.decodeIfPresent(.title)
        type = try container.decodeIfPresent(.type)
        urlPhoto = try container.decodeIfPresent(.urlPhoto)
        xpEdate = try container.decodeIfPresent(.xpEdate)
        xpFlag = try container.decodeIfPresent(.xpFlag)
        xpSdate = try container.decodeIfPresent(.xpSdate)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actCode, forKey: .actCode)
        try container.encodeIfPresent(cityId, forKey: .cityId)
        try container.encodeIfPresent(comment, forKey: .comment)
        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(ddr, forKey: .ddr)
        try container.encodeIfPresent(etabCode, forKey: .etabCode)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(neg, forKey: .neg)
        try container.encodeIfPresent(pos, forKey: .pos)
        try container.encodeIfPresent(pseudo, forKey: .pseudo)
        try container.encodeIfPresent(publie, forKey: .publie)
        try container.encodeIfPresent(ratg, forKey: .ratg)
        try container.encodeIfPresent(ratgs, forKey: .ratgs)
        try container.encodeIfPresent(revId, forKey: .revId)
        try container.encodeIfPresent(state, forKey: .state)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(urlPhoto, forKey: .urlPhoto)
        try container.encodeIfPresent(xpEdate, forKey: .xpEdate)
        try container.encodeIfPresent(xpFlag, forKey: .xpFlag)
        try container.encodeIfPresent(xpSdate, forKey: .xpSdate)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRReview else { return false }
      guard self.actCode == object.actCode else { return false }
      guard self.cityId == object.cityId else { return false }
      guard self.comment == object.comment else { return false }
      guard self.date == object.date else { return false }
      guard self.ddr == object.ddr else { return false }
      guard self.etabCode == object.etabCode else { return false }
      guard self.label == object.label else { return false }
      guard self.name == object.name else { return false }
      guard self.neg == object.neg else { return false }
      guard self.pos == object.pos else { return false }
      guard self.pseudo == object.pseudo else { return false }
      guard self.publie == object.publie else { return false }
      guard self.ratg == object.ratg else { return false }
      guard self.ratgs == object.ratgs else { return false }
      guard self.revId == object.revId else { return false }
      guard self.state == object.state else { return false }
      guard self.title == object.title else { return false }
      guard self.type == object.type else { return false }
      guard self.urlPhoto == object.urlPhoto else { return false }
      guard self.xpEdate == object.xpEdate else { return false }
      guard self.xpFlag == object.xpFlag else { return false }
      guard self.xpSdate == object.xpSdate else { return false }
      return true
    }

    public static func == (lhs: SKRReview, rhs: SKRReview) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

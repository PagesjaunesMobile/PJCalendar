/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPhone: StargateKitModel {

    public var callT: String?

    public var cost: String?

    public var costId: String?

    public var costMention: String?

    public var dnc: Bool?

    public var f: String?

    public var lbl: String?

    public var num: String?

    public var numT: String?

    public var srvT: String?

    public var type: String?

    public var urlT: String?

    public init(callT: String? = nil, cost: String? = nil, costId: String? = nil, costMention: String? = nil, dnc: Bool? = nil, f: String? = nil, lbl: String? = nil, num: String? = nil, numT: String? = nil, srvT: String? = nil, type: String? = nil, urlT: String? = nil) {
        self.callT = callT
        self.cost = cost
        self.costId = costId
        self.costMention = costMention
        self.dnc = dnc
        self.f = f
        self.lbl = lbl
        self.num = num
        self.numT = numT
        self.srvT = srvT
        self.type = type
        self.urlT = urlT
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case callT
        case cost
        case costId
        case costMention
        case dnc
        case f
        case lbl
        case num
        case numT
        case srvT
        case type
        case urlT
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        callT = try container.decodeIfPresent(.callT)
        cost = try container.decodeIfPresent(.cost)
        costId = try container.decodeIfPresent(.costId)
        costMention = try container.decodeIfPresent(.costMention)
        dnc = try container.decodeIfPresent(.dnc)
        f = try container.decodeIfPresent(.f)
        lbl = try container.decodeIfPresent(.lbl)
        num = try container.decodeIfPresent(.num)
        numT = try container.decodeIfPresent(.numT)
        srvT = try container.decodeIfPresent(.srvT)
        type = try container.decodeIfPresent(.type)
        urlT = try container.decodeIfPresent(.urlT)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(callT, forKey: .callT)
        try container.encodeIfPresent(cost, forKey: .cost)
        try container.encodeIfPresent(costId, forKey: .costId)
        try container.encodeIfPresent(costMention, forKey: .costMention)
        try container.encodeIfPresent(dnc, forKey: .dnc)
        try container.encodeIfPresent(f, forKey: .f)
        try container.encodeIfPresent(lbl, forKey: .lbl)
        try container.encodeIfPresent(num, forKey: .num)
        try container.encodeIfPresent(numT, forKey: .numT)
        try container.encodeIfPresent(srvT, forKey: .srvT)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(urlT, forKey: .urlT)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPhone else { return false }
      guard self.callT == object.callT else { return false }
      guard self.cost == object.cost else { return false }
      guard self.costId == object.costId else { return false }
      guard self.costMention == object.costMention else { return false }
      guard self.dnc == object.dnc else { return false }
      guard self.f == object.f else { return false }
      guard self.lbl == object.lbl else { return false }
      guard self.num == object.num else { return false }
      guard self.numT == object.numT else { return false }
      guard self.srvT == object.srvT else { return false }
      guard self.type == object.type else { return false }
      guard self.urlT == object.urlT else { return false }
      return true
    }

    public static func == (lhs: SKRPhone, rhs: SKRPhone) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

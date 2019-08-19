/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResCR: StargateKitModel {

    public var account: SKRAccount?

    public var code: String?

    public var codeCI: String?

    public var creaDate: String?

    public var msg: String?

    public var name: String?

    public var pseudo: String?

    public var pubDate: String?

    public var revId: String?

    public var revStatus: String?

    public var title: String?

    public var userId: String?

    public init(account: SKRAccount? = nil, code: String? = nil, codeCI: String? = nil, creaDate: String? = nil, msg: String? = nil, name: String? = nil, pseudo: String? = nil, pubDate: String? = nil, revId: String? = nil, revStatus: String? = nil, title: String? = nil, userId: String? = nil) {
        self.account = account
        self.code = code
        self.codeCI = codeCI
        self.creaDate = creaDate
        self.msg = msg
        self.name = name
        self.pseudo = pseudo
        self.pubDate = pubDate
        self.revId = revId
        self.revStatus = revStatus
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case account
        case code
        case codeCI
        case creaDate
        case msg
        case name
        case pseudo
        case pubDate
        case revId
        case revStatus
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        account = try container.decodeIfPresent(.account)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        creaDate = try container.decodeIfPresent(.creaDate)
        msg = try container.decodeIfPresent(.msg)
        name = try container.decodeIfPresent(.name)
        pseudo = try container.decodeIfPresent(.pseudo)
        pubDate = try container.decodeIfPresent(.pubDate)
        revId = try container.decodeIfPresent(.revId)
        revStatus = try container.decodeIfPresent(.revStatus)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(account, forKey: .account)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(creaDate, forKey: .creaDate)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(pseudo, forKey: .pseudo)
        try container.encodeIfPresent(pubDate, forKey: .pubDate)
        try container.encodeIfPresent(revId, forKey: .revId)
        try container.encodeIfPresent(revStatus, forKey: .revStatus)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResCR else { return false }
      guard self.account == object.account else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.creaDate == object.creaDate else { return false }
      guard self.msg == object.msg else { return false }
      guard self.name == object.name else { return false }
      guard self.pseudo == object.pseudo else { return false }
      guard self.pubDate == object.pubDate else { return false }
      guard self.revId == object.revId else { return false }
      guard self.revStatus == object.revStatus else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResCR, rhs: SKRResCR) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

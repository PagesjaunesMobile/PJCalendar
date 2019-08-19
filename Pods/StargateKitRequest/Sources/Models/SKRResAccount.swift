/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResAccount: StargateKitModel {

    public var account: SKRAccount?

    public var code: String?

    public var codeCI: String?

    public var msg: String?

    public var sendRev: Bool?

    public var title: String?

    public var userId: String?

    public init(account: SKRAccount? = nil, code: String? = nil, codeCI: String? = nil, msg: String? = nil, sendRev: Bool? = nil, title: String? = nil, userId: String? = nil) {
        self.account = account
        self.code = code
        self.codeCI = codeCI
        self.msg = msg
        self.sendRev = sendRev
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case account
        case code
        case codeCI
        case msg
        case sendRev
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        account = try container.decodeIfPresent(.account)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        msg = try container.decodeIfPresent(.msg)
        sendRev = try container.decodeIfPresent(.sendRev)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(account, forKey: .account)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(sendRev, forKey: .sendRev)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResAccount else { return false }
      guard self.account == object.account else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.msg == object.msg else { return false }
      guard self.sendRev == object.sendRev else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResAccount, rhs: SKRResAccount) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

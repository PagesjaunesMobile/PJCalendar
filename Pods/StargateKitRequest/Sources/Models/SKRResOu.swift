/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResOu: StargateKitModel {

    public var code: String?

    public var codeCI: String?

    public var list: [SKROuList]?

    public var msg: String?

    public var title: String?

    public var token: String?

    public var userId: String?

    public init(code: String? = nil, codeCI: String? = nil, list: [SKROuList]? = nil, msg: String? = nil, title: String? = nil, token: String? = nil, userId: String? = nil) {
        self.code = code
        self.codeCI = codeCI
        self.list = list
        self.msg = msg
        self.title = title
        self.token = token
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case codeCI
        case list
        case msg
        case title
        case token
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        list = try container.decodeArrayIfPresent(.list)
        msg = try container.decodeIfPresent(.msg)
        title = try container.decodeIfPresent(.title)
        token = try container.decodeIfPresent(.token)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(list, forKey: .list)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResOu else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.list == object.list else { return false }
      guard self.msg == object.msg else { return false }
      guard self.title == object.title else { return false }
      guard self.token == object.token else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResOu, rhs: SKRResOu) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

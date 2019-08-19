/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResID: StargateKitModel {

    public var code: String?

    public var codeCI: String?

    public var date: String?

    public var msg: String?

    public var title: String?

    public var userId: String?

    public var visitorId: String?

    public init(code: String? = nil, codeCI: String? = nil, date: String? = nil, msg: String? = nil, title: String? = nil, userId: String? = nil, visitorId: String? = nil) {
        self.code = code
        self.codeCI = codeCI
        self.date = date
        self.msg = msg
        self.title = title
        self.userId = userId
        self.visitorId = visitorId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case codeCI
        case date
        case msg
        case title
        case userId
        case visitorId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        date = try container.decodeIfPresent(.date)
        msg = try container.decodeIfPresent(.msg)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
        visitorId = try container.decodeIfPresent(.visitorId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
        try container.encodeIfPresent(visitorId, forKey: .visitorId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResID else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.date == object.date else { return false }
      guard self.msg == object.msg else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      guard self.visitorId == object.visitorId else { return false }
      return true
    }

    public static func == (lhs: SKRResID, rhs: SKRResID) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

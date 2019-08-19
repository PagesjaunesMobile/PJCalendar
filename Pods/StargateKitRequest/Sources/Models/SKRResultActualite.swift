/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResultActualite: StargateKitModel {

    public var code: String?

    public var codeCI: String?

    public var lstNews: SKRLstNews?

    public var msg: String?

    public var title: String?

    public var userId: String?

    public init(code: String? = nil, codeCI: String? = nil, lstNews: SKRLstNews? = nil, msg: String? = nil, title: String? = nil, userId: String? = nil) {
        self.code = code
        self.codeCI = codeCI
        self.lstNews = lstNews
        self.msg = msg
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case codeCI
        case lstNews
        case msg
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        lstNews = try container.decodeIfPresent(.lstNews)
        msg = try container.decodeIfPresent(.msg)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(lstNews, forKey: .lstNews)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResultActualite else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.lstNews == object.lstNews else { return false }
      guard self.msg == object.msg else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResultActualite, rhs: SKRResultActualite) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResRea: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case photo = "PHOTO"
        case avis = "AVIS"
        case ddr = "DDR"
    }

    public var code: String?

    public var codeCI: String?

    public var item: [SKRItem]?

    public var msg: String?

    public var title: String?

    public var type: SKRType?

    public var userId: String?

    public init(code: String? = nil, codeCI: String? = nil, item: [SKRItem]? = nil, msg: String? = nil, title: String? = nil, type: SKRType? = nil, userId: String? = nil) {
        self.code = code
        self.codeCI = codeCI
        self.item = item
        self.msg = msg
        self.title = title
        self.type = type
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case codeCI
        case item
        case msg
        case title
        case type
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        item = try container.decodeArrayIfPresent(.item)
        msg = try container.decodeIfPresent(.msg)
        title = try container.decodeIfPresent(.title)
        type = try container.decodeIfPresent(.type)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResRea else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.item == object.item else { return false }
      guard self.msg == object.msg else { return false }
      guard self.title == object.title else { return false }
      guard self.type == object.type else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResRea, rhs: SKRResRea) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRGroupe: StargateKitModel {

    public var code: String?

    public var codeCI: String?

    public var id: String?

    public var idMobile: String?

    public var msg: String?

    public var title: String?

    public var userId: String?

    public init(code: String? = nil, codeCI: String? = nil, id: String? = nil, idMobile: String? = nil, msg: String? = nil, title: String? = nil, userId: String? = nil) {
        self.code = code
        self.codeCI = codeCI
        self.id = id
        self.idMobile = idMobile
        self.msg = msg
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case codeCI
        case id
        case idMobile = "id_mobile"
        case msg
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        id = try container.decodeIfPresent(.id)
        idMobile = try container.decodeIfPresent(.idMobile)
        msg = try container.decodeIfPresent(.msg)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(idMobile, forKey: .idMobile)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRGroupe else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.id == object.id else { return false }
      guard self.idMobile == object.idMobile else { return false }
      guard self.msg == object.msg else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRGroupe, rhs: SKRGroupe) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

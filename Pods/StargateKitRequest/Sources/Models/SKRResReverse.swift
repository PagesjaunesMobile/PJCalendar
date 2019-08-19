/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResReverse: StargateKitModel {

    public var blocReverse: SKRBlocReverse?

    public var code: String?

    public var codeCI: String?

    public var msg: String?

    public var title: String?

    public var userId: String?

    public init(blocReverse: SKRBlocReverse? = nil, code: String? = nil, codeCI: String? = nil, msg: String? = nil, title: String? = nil, userId: String? = nil) {
        self.blocReverse = blocReverse
        self.code = code
        self.codeCI = codeCI
        self.msg = msg
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case blocReverse
        case code
        case codeCI
        case msg
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        blocReverse = try container.decodeIfPresent(.blocReverse)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        msg = try container.decodeIfPresent(.msg)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(blocReverse, forKey: .blocReverse)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResReverse else { return false }
      guard self.blocReverse == object.blocReverse else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.msg == object.msg else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResReverse, rhs: SKRResReverse) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

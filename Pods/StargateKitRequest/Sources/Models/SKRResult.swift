/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResult: StargateKitModel {

    public var epj: SKREPJGetBP?

    public var bp: SKRBP?

    public var code: String?

    public var codeCI: String?

    public var msg: String?

    public var title: String?

    public var userId: String?

    public init(epj: SKREPJGetBP? = nil, bp: SKRBP? = nil, code: String? = nil, codeCI: String? = nil, msg: String? = nil, title: String? = nil, userId: String? = nil) {
        self.epj = epj
        self.bp = bp
        self.code = code
        self.codeCI = codeCI
        self.msg = msg
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case epj = "EPJ"
        case bp
        case code
        case codeCI
        case msg
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        epj = try container.decodeIfPresent(.epj)
        bp = try container.decodeIfPresent(.bp)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        msg = try container.decodeIfPresent(.msg)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(epj, forKey: .epj)
        try container.encodeIfPresent(bp, forKey: .bp)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResult else { return false }
      guard self.epj == object.epj else { return false }
      guard self.bp == object.bp else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.msg == object.msg else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResult, rhs: SKRResult) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

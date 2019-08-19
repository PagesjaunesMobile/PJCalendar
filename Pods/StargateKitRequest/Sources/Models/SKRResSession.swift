/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResSession: StargateKitModel {

    public var maj: SKRMAJ?

    public var code: String?

    public var codeCI: String?

    public var lastDateRef: String?

    public var msg: String?

    public var sessionId: String?

    public var title: String?

    public var token: String?

    public var userId: String?

    public init(maj: SKRMAJ? = nil, code: String? = nil, codeCI: String? = nil, lastDateRef: String? = nil, msg: String? = nil, sessionId: String? = nil, title: String? = nil, token: String? = nil, userId: String? = nil) {
        self.maj = maj
        self.code = code
        self.codeCI = codeCI
        self.lastDateRef = lastDateRef
        self.msg = msg
        self.sessionId = sessionId
        self.title = title
        self.token = token
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case maj = "MAJ"
        case code
        case codeCI
        case lastDateRef
        case msg
        case sessionId
        case title
        case token
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        maj = try container.decodeIfPresent(.maj)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        lastDateRef = try container.decodeIfPresent(.lastDateRef)
        msg = try container.decodeIfPresent(.msg)
        sessionId = try container.decodeIfPresent(.sessionId)
        title = try container.decodeIfPresent(.title)
        token = try container.decodeIfPresent(.token)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(maj, forKey: .maj)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(lastDateRef, forKey: .lastDateRef)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(sessionId, forKey: .sessionId)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResSession else { return false }
      guard self.maj == object.maj else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.lastDateRef == object.lastDateRef else { return false }
      guard self.msg == object.msg else { return false }
      guard self.sessionId == object.sessionId else { return false }
      guard self.title == object.title else { return false }
      guard self.token == object.token else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResSession, rhs: SKRResSession) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

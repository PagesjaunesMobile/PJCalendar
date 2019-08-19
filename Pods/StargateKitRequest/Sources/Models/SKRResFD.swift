/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResFD: StargateKitModel {

    public var bloc: SKRBloc?

    public var code: String?

    public var codeCI: String?

    public var contenuFD: SKRContenuFD?

    public var historisable: Bool?

    public var msg: String?

    public var queryId: String?

    public var researchId: String?

    public var sessionId: String?

    public var title: String?

    public var token: String?

    public var userId: String?

    public init(bloc: SKRBloc? = nil, code: String? = nil, codeCI: String? = nil, contenuFD: SKRContenuFD? = nil, historisable: Bool? = nil, msg: String? = nil, queryId: String? = nil, researchId: String? = nil, sessionId: String? = nil, title: String? = nil, token: String? = nil, userId: String? = nil) {
        self.bloc = bloc
        self.code = code
        self.codeCI = codeCI
        self.contenuFD = contenuFD
        self.historisable = historisable
        self.msg = msg
        self.queryId = queryId
        self.researchId = researchId
        self.sessionId = sessionId
        self.title = title
        self.token = token
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case bloc
        case code
        case codeCI
        case contenuFD
        case historisable
        case msg
        case queryId
        case researchId
        case sessionId
        case title
        case token
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        bloc = try container.decodeIfPresent(.bloc)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        contenuFD = try container.decodeIfPresent(.contenuFD)
        historisable = try container.decodeIfPresent(.historisable)
        msg = try container.decodeIfPresent(.msg)
        queryId = try container.decodeIfPresent(.queryId)
        researchId = try container.decodeIfPresent(.researchId)
        sessionId = try container.decodeIfPresent(.sessionId)
        title = try container.decodeIfPresent(.title)
        token = try container.decodeIfPresent(.token)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(bloc, forKey: .bloc)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(contenuFD, forKey: .contenuFD)
        try container.encodeIfPresent(historisable, forKey: .historisable)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(queryId, forKey: .queryId)
        try container.encodeIfPresent(researchId, forKey: .researchId)
        try container.encodeIfPresent(sessionId, forKey: .sessionId)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResFD else { return false }
      guard self.bloc == object.bloc else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.contenuFD == object.contenuFD else { return false }
      guard self.historisable == object.historisable else { return false }
      guard self.msg == object.msg else { return false }
      guard self.queryId == object.queryId else { return false }
      guard self.researchId == object.researchId else { return false }
      guard self.sessionId == object.sessionId else { return false }
      guard self.title == object.title else { return false }
      guard self.token == object.token else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResFD, rhs: SKRResFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

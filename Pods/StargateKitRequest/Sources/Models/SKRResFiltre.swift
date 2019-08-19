/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResFiltre: StargateKitModel {

    public var code: String?

    public var codeCI: String?

    public var count: String?

    public var countG: String?

    public var msg: String?

    public var pageCount: String?

    public var queryId: String?

    public var researchId: String?

    public var search: SKRSearch?

    public var searchId: String?

    public var sessionId: String?

    public var title: String?

    public var token: String?

    public var userId: String?

    public init(code: String? = nil, codeCI: String? = nil, count: String? = nil, countG: String? = nil, msg: String? = nil, pageCount: String? = nil, queryId: String? = nil, researchId: String? = nil, search: SKRSearch? = nil, searchId: String? = nil, sessionId: String? = nil, title: String? = nil, token: String? = nil, userId: String? = nil) {
        self.code = code
        self.codeCI = codeCI
        self.count = count
        self.countG = countG
        self.msg = msg
        self.pageCount = pageCount
        self.queryId = queryId
        self.researchId = researchId
        self.search = search
        self.searchId = searchId
        self.sessionId = sessionId
        self.title = title
        self.token = token
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case codeCI
        case count
        case countG
        case msg
        case pageCount
        case queryId
        case researchId
        case search
        case searchId
        case sessionId
        case title
        case token
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        count = try container.decodeIfPresent(.count)
        countG = try container.decodeIfPresent(.countG)
        msg = try container.decodeIfPresent(.msg)
        pageCount = try container.decodeIfPresent(.pageCount)
        queryId = try container.decodeIfPresent(.queryId)
        researchId = try container.decodeIfPresent(.researchId)
        search = try container.decodeIfPresent(.search)
        searchId = try container.decodeIfPresent(.searchId)
        sessionId = try container.decodeIfPresent(.sessionId)
        title = try container.decodeIfPresent(.title)
        token = try container.decodeIfPresent(.token)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(countG, forKey: .countG)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(pageCount, forKey: .pageCount)
        try container.encodeIfPresent(queryId, forKey: .queryId)
        try container.encodeIfPresent(researchId, forKey: .researchId)
        try container.encodeIfPresent(search, forKey: .search)
        try container.encodeIfPresent(searchId, forKey: .searchId)
        try container.encodeIfPresent(sessionId, forKey: .sessionId)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResFiltre else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.count == object.count else { return false }
      guard self.countG == object.countG else { return false }
      guard self.msg == object.msg else { return false }
      guard self.pageCount == object.pageCount else { return false }
      guard self.queryId == object.queryId else { return false }
      guard self.researchId == object.researchId else { return false }
      guard self.search == object.search else { return false }
      guard self.searchId == object.searchId else { return false }
      guard self.sessionId == object.sessionId else { return false }
      guard self.title == object.title else { return false }
      guard self.token == object.token else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResFiltre, rhs: SKRResFiltre) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

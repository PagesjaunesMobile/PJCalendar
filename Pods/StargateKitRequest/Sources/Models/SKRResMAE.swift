/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResMAE: StargateKitModel {

    public var ad: SKRAdv?

    public var code: String?

    public var codeCI: String?

    public var count: String?

    public var countG: String?

    public var cqlr: SKRCqlr?

    public var degLev: String?

    public var historisable: Bool?

    public var list: [SKRList]?

    public var maxBlocP: String?

    public var msg: String?

    public var page: String?

    public var pageCount: String?

    public var prcTime: String?

    public var queryId: String?

    public var reformulations: SKRReformulationsStargate?

    public var researchId: String?

    public var seReferencer: SKRSeReferencer?

    public var search: SKRSearchLr?

    public var searchId: String?

    public var sessionId: String?

    public var suggestions: SKRSuggestionsStargate?

    public var title: String?

    public var token: String?

    public var topLabel: String?

    public var typeRep: String?

    public var userId: String?

    public init(ad: SKRAdv? = nil, code: String? = nil, codeCI: String? = nil, count: String? = nil, countG: String? = nil, cqlr: SKRCqlr? = nil, degLev: String? = nil, historisable: Bool? = nil, list: [SKRList]? = nil, maxBlocP: String? = nil, msg: String? = nil, page: String? = nil, pageCount: String? = nil, prcTime: String? = nil, queryId: String? = nil, reformulations: SKRReformulationsStargate? = nil, researchId: String? = nil, seReferencer: SKRSeReferencer? = nil, search: SKRSearchLr? = nil, searchId: String? = nil, sessionId: String? = nil, suggestions: SKRSuggestionsStargate? = nil, title: String? = nil, token: String? = nil, topLabel: String? = nil, typeRep: String? = nil, userId: String? = nil) {
        self.ad = ad
        self.code = code
        self.codeCI = codeCI
        self.count = count
        self.countG = countG
        self.cqlr = cqlr
        self.degLev = degLev
        self.historisable = historisable
        self.list = list
        self.maxBlocP = maxBlocP
        self.msg = msg
        self.page = page
        self.pageCount = pageCount
        self.prcTime = prcTime
        self.queryId = queryId
        self.reformulations = reformulations
        self.researchId = researchId
        self.seReferencer = seReferencer
        self.search = search
        self.searchId = searchId
        self.sessionId = sessionId
        self.suggestions = suggestions
        self.title = title
        self.token = token
        self.topLabel = topLabel
        self.typeRep = typeRep
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case ad
        case code
        case codeCI
        case count
        case countG
        case cqlr
        case degLev
        case historisable
        case list
        case maxBlocP
        case msg
        case page
        case pageCount
        case prcTime = "prc_time"
        case queryId
        case reformulations
        case researchId
        case seReferencer
        case search
        case searchId
        case sessionId
        case suggestions
        case title
        case token
        case topLabel
        case typeRep
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        ad = try container.decodeIfPresent(.ad)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        count = try container.decodeIfPresent(.count)
        countG = try container.decodeIfPresent(.countG)
        cqlr = try container.decodeIfPresent(.cqlr)
        degLev = try container.decodeIfPresent(.degLev)
        historisable = try container.decodeIfPresent(.historisable)
        list = try container.decodeArrayIfPresent(.list)
        maxBlocP = try container.decodeIfPresent(.maxBlocP)
        msg = try container.decodeIfPresent(.msg)
        page = try container.decodeIfPresent(.page)
        pageCount = try container.decodeIfPresent(.pageCount)
        prcTime = try container.decodeIfPresent(.prcTime)
        queryId = try container.decodeIfPresent(.queryId)
        reformulations = try container.decodeIfPresent(.reformulations)
        researchId = try container.decodeIfPresent(.researchId)
        seReferencer = try container.decodeIfPresent(.seReferencer)
        search = try container.decodeIfPresent(.search)
        searchId = try container.decodeIfPresent(.searchId)
        sessionId = try container.decodeIfPresent(.sessionId)
        suggestions = try container.decodeIfPresent(.suggestions)
        title = try container.decodeIfPresent(.title)
        token = try container.decodeIfPresent(.token)
        topLabel = try container.decodeIfPresent(.topLabel)
        typeRep = try container.decodeIfPresent(.typeRep)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(ad, forKey: .ad)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(countG, forKey: .countG)
        try container.encodeIfPresent(cqlr, forKey: .cqlr)
        try container.encodeIfPresent(degLev, forKey: .degLev)
        try container.encodeIfPresent(historisable, forKey: .historisable)
        try container.encodeIfPresent(list, forKey: .list)
        try container.encodeIfPresent(maxBlocP, forKey: .maxBlocP)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(page, forKey: .page)
        try container.encodeIfPresent(pageCount, forKey: .pageCount)
        try container.encodeIfPresent(prcTime, forKey: .prcTime)
        try container.encodeIfPresent(queryId, forKey: .queryId)
        try container.encodeIfPresent(reformulations, forKey: .reformulations)
        try container.encodeIfPresent(researchId, forKey: .researchId)
        try container.encodeIfPresent(seReferencer, forKey: .seReferencer)
        try container.encodeIfPresent(search, forKey: .search)
        try container.encodeIfPresent(searchId, forKey: .searchId)
        try container.encodeIfPresent(sessionId, forKey: .sessionId)
        try container.encodeIfPresent(suggestions, forKey: .suggestions)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(topLabel, forKey: .topLabel)
        try container.encodeIfPresent(typeRep, forKey: .typeRep)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResMAE else { return false }
      guard self.ad == object.ad else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.count == object.count else { return false }
      guard self.countG == object.countG else { return false }
      guard self.cqlr == object.cqlr else { return false }
      guard self.degLev == object.degLev else { return false }
      guard self.historisable == object.historisable else { return false }
      guard self.list == object.list else { return false }
      guard self.maxBlocP == object.maxBlocP else { return false }
      guard self.msg == object.msg else { return false }
      guard self.page == object.page else { return false }
      guard self.pageCount == object.pageCount else { return false }
      guard self.prcTime == object.prcTime else { return false }
      guard self.queryId == object.queryId else { return false }
      guard self.reformulations == object.reformulations else { return false }
      guard self.researchId == object.researchId else { return false }
      guard self.seReferencer == object.seReferencer else { return false }
      guard self.search == object.search else { return false }
      guard self.searchId == object.searchId else { return false }
      guard self.sessionId == object.sessionId else { return false }
      guard self.suggestions == object.suggestions else { return false }
      guard self.title == object.title else { return false }
      guard self.token == object.token else { return false }
      guard self.topLabel == object.topLabel else { return false }
      guard self.typeRep == object.typeRep else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResMAE, rhs: SKRResMAE) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

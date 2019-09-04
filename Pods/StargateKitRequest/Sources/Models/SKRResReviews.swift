/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResReviews: StargateKitModel {

    public var code: String?

    public var codeCI: String?

    public var detail: [SKRDetail]?

    public var info: String?

    public var liens: [SKRLien]?

    public var msg: String?

    public var nbReview: String?

    public var page: String?

    public var pageCount: String?

    public var partenaires: [SKRPartenaire]?

    public var ratg: String?

    public var review: [SKRReview]?

    public var search: SKRSearchReview?

    public var title: String?

    public var token: String?

    public var userId: String?

    public init(code: String? = nil, codeCI: String? = nil, detail: [SKRDetail]? = nil, info: String? = nil, liens: [SKRLien]? = nil, msg: String? = nil, nbReview: String? = nil, page: String? = nil, pageCount: String? = nil, partenaires: [SKRPartenaire]? = nil, ratg: String? = nil, review: [SKRReview]? = nil, search: SKRSearchReview? = nil, title: String? = nil, token: String? = nil, userId: String? = nil) {
        self.code = code
        self.codeCI = codeCI
        self.detail = detail
        self.info = info
        self.liens = liens
        self.msg = msg
        self.nbReview = nbReview
        self.page = page
        self.pageCount = pageCount
        self.partenaires = partenaires
        self.ratg = ratg
        self.review = review
        self.search = search
        self.title = title
        self.token = token
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case codeCI
        case detail
        case info
        case liens
        case msg
        case nbReview
        case page
        case pageCount
        case partenaires
        case ratg
        case review
        case search
        case title
        case token
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        detail = try container.decodeArrayIfPresent(.detail)
        info = try container.decodeIfPresent(.info)
        liens = try container.decodeArrayIfPresent(.liens)
        msg = try container.decodeIfPresent(.msg)
        nbReview = try container.decodeIfPresent(.nbReview)
        page = try container.decodeIfPresent(.page)
        pageCount = try container.decodeIfPresent(.pageCount)
        partenaires = try container.decodeArrayIfPresent(.partenaires)
        ratg = try container.decodeIfPresent(.ratg)
        review = try container.decodeArrayIfPresent(.review)
        search = try container.decodeIfPresent(.search)
        title = try container.decodeIfPresent(.title)
        token = try container.decodeIfPresent(.token)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(detail, forKey: .detail)
        try container.encodeIfPresent(info, forKey: .info)
        try container.encodeIfPresent(liens, forKey: .liens)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(nbReview, forKey: .nbReview)
        try container.encodeIfPresent(page, forKey: .page)
        try container.encodeIfPresent(pageCount, forKey: .pageCount)
        try container.encodeIfPresent(partenaires, forKey: .partenaires)
        try container.encodeIfPresent(ratg, forKey: .ratg)
        try container.encodeIfPresent(review, forKey: .review)
        try container.encodeIfPresent(search, forKey: .search)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResReviews else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.detail == object.detail else { return false }
      guard self.info == object.info else { return false }
      guard self.liens == object.liens else { return false }
      guard self.msg == object.msg else { return false }
      guard self.nbReview == object.nbReview else { return false }
      guard self.page == object.page else { return false }
      guard self.pageCount == object.pageCount else { return false }
      guard self.partenaires == object.partenaires else { return false }
      guard self.ratg == object.ratg else { return false }
      guard self.review == object.review else { return false }
      guard self.search == object.search else { return false }
      guard self.title == object.title else { return false }
      guard self.token == object.token else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResReviews, rhs: SKRResReviews) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

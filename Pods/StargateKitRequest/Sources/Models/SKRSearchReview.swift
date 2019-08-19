/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSearchReview: StargateKitModel {

    public var actCode: String?

    public var etabCode: String?

    public var pageNum: String?

    public var sort: [SKRSortContributif]?

    public init(actCode: String? = nil, etabCode: String? = nil, pageNum: String? = nil, sort: [SKRSortContributif]? = nil) {
        self.actCode = actCode
        self.etabCode = etabCode
        self.pageNum = pageNum
        self.sort = sort
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actCode = "act_code"
        case etabCode = "etab_code"
        case pageNum = "page_num"
        case sort
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actCode = try container.decodeIfPresent(.actCode)
        etabCode = try container.decodeIfPresent(.etabCode)
        pageNum = try container.decodeIfPresent(.pageNum)
        sort = try container.decodeArrayIfPresent(.sort)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actCode, forKey: .actCode)
        try container.encodeIfPresent(etabCode, forKey: .etabCode)
        try container.encodeIfPresent(pageNum, forKey: .pageNum)
        try container.encodeIfPresent(sort, forKey: .sort)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSearchReview else { return false }
      guard self.actCode == object.actCode else { return false }
      guard self.etabCode == object.etabCode else { return false }
      guard self.pageNum == object.pageNum else { return false }
      guard self.sort == object.sort else { return false }
      return true
    }

    public static func == (lhs: SKRSearchReview, rhs: SKRSearchReview) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

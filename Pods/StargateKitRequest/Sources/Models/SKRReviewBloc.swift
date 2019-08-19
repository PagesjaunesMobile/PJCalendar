/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRReviewBloc: StargateKitModel {

    public var act: Bool?

    public var count: String?

    public var disp: Bool?

    public var dtReview: [SKRDtReview]?

    public var leave: Bool?

    public var nbPhotos: Int?

    public var pLeave: Bool?

    public var ratg: String?

    public init(act: Bool? = nil, count: String? = nil, disp: Bool? = nil, dtReview: [SKRDtReview]? = nil, leave: Bool? = nil, nbPhotos: Int? = nil, pLeave: Bool? = nil, ratg: String? = nil) {
        self.act = act
        self.count = count
        self.disp = disp
        self.dtReview = dtReview
        self.leave = leave
        self.nbPhotos = nbPhotos
        self.pLeave = pLeave
        self.ratg = ratg
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case act
        case count
        case disp
        case dtReview
        case leave
        case nbPhotos
        case pLeave
        case ratg
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        act = try container.decodeIfPresent(.act)
        count = try container.decodeIfPresent(.count)
        disp = try container.decodeIfPresent(.disp)
        dtReview = try container.decodeArrayIfPresent(.dtReview)
        leave = try container.decodeIfPresent(.leave)
        nbPhotos = try container.decodeIfPresent(.nbPhotos)
        pLeave = try container.decodeIfPresent(.pLeave)
        ratg = try container.decodeIfPresent(.ratg)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(act, forKey: .act)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(disp, forKey: .disp)
        try container.encodeIfPresent(dtReview, forKey: .dtReview)
        try container.encodeIfPresent(leave, forKey: .leave)
        try container.encodeIfPresent(nbPhotos, forKey: .nbPhotos)
        try container.encodeIfPresent(pLeave, forKey: .pLeave)
        try container.encodeIfPresent(ratg, forKey: .ratg)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRReviewBloc else { return false }
      guard self.act == object.act else { return false }
      guard self.count == object.count else { return false }
      guard self.disp == object.disp else { return false }
      guard self.dtReview == object.dtReview else { return false }
      guard self.leave == object.leave else { return false }
      guard self.nbPhotos == object.nbPhotos else { return false }
      guard self.pLeave == object.pLeave else { return false }
      guard self.ratg == object.ratg else { return false }
      return true
    }

    public static func == (lhs: SKRReviewBloc, rhs: SKRReviewBloc) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

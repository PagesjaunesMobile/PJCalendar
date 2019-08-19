/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDetail: StargateKitModel {

    public var actCode: String?

    public var etabCode: String?

    public var label: String?

    public var nbReview: String?

    public var ratg: [SKRRatg]?

    public init(actCode: String? = nil, etabCode: String? = nil, label: String? = nil, nbReview: String? = nil, ratg: [SKRRatg]? = nil) {
        self.actCode = actCode
        self.etabCode = etabCode
        self.label = label
        self.nbReview = nbReview
        self.ratg = ratg
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actCode = "act_code"
        case etabCode = "etab_code"
        case label
        case nbReview
        case ratg
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actCode = try container.decodeIfPresent(.actCode)
        etabCode = try container.decodeIfPresent(.etabCode)
        label = try container.decodeIfPresent(.label)
        nbReview = try container.decodeIfPresent(.nbReview)
        ratg = try container.decodeArrayIfPresent(.ratg)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actCode, forKey: .actCode)
        try container.encodeIfPresent(etabCode, forKey: .etabCode)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(nbReview, forKey: .nbReview)
        try container.encodeIfPresent(ratg, forKey: .ratg)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDetail else { return false }
      guard self.actCode == object.actCode else { return false }
      guard self.etabCode == object.etabCode else { return false }
      guard self.label == object.label else { return false }
      guard self.nbReview == object.nbReview else { return false }
      guard self.ratg == object.ratg else { return false }
      return true
    }

    public static func == (lhs: SKRDetail, rhs: SKRDetail) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

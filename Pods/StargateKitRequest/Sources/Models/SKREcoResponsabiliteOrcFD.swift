/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREcoResponsabiliteOrcFD: StargateKitModel {

    public var engagements: [SKREngagementEcoResponsableOrcFD]?

    public var labels: [SKRLabelEcoResponsableOrcFD]?

    public init(engagements: [SKREngagementEcoResponsableOrcFD]? = nil, labels: [SKRLabelEcoResponsableOrcFD]? = nil) {
        self.engagements = engagements
        self.labels = labels
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case engagements
        case labels
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        engagements = try container.decodeArrayIfPresent(.engagements)
        labels = try container.decodeArrayIfPresent(.labels)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(engagements, forKey: .engagements)
        try container.encodeIfPresent(labels, forKey: .labels)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREcoResponsabiliteOrcFD else { return false }
      guard self.engagements == object.engagements else { return false }
      guard self.labels == object.labels else { return false }
      return true
    }

    public static func == (lhs: SKREcoResponsabiliteOrcFD, rhs: SKREcoResponsabiliteOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

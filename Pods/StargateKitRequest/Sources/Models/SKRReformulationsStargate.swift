/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRReformulationsStargate: StargateKitModel {

    public var label: String?

    public var reformulation: [SKRReformulationStargate]?

    public init(label: String? = nil, reformulation: [SKRReformulationStargate]? = nil) {
        self.label = label
        self.reformulation = reformulation
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case reformulation
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        reformulation = try container.decodeArrayIfPresent(.reformulation)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(reformulation, forKey: .reformulation)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRReformulationsStargate else { return false }
      guard self.label == object.label else { return false }
      guard self.reformulation == object.reformulation else { return false }
      return true
    }

    public static func == (lhs: SKRReformulationsStargate, rhs: SKRReformulationsStargate) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

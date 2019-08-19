/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContenusPrioritaires: StargateKitModel {

    public var cp: [SKRContenuPrioritaire]?

    public var label: String?

    public var level: Int?

    public var type: String?

    public init(cp: [SKRContenuPrioritaire]? = nil, label: String? = nil, level: Int? = nil, type: String? = nil) {
        self.cp = cp
        self.label = label
        self.level = level
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case cp
        case label
        case level
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        cp = try container.decodeArrayIfPresent(.cp)
        label = try container.decodeIfPresent(.label)
        level = try container.decodeIfPresent(.level)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(cp, forKey: .cp)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(level, forKey: .level)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContenusPrioritaires else { return false }
      guard self.cp == object.cp else { return false }
      guard self.label == object.label else { return false }
      guard self.level == object.level else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRContenusPrioritaires, rhs: SKRContenusPrioritaires) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

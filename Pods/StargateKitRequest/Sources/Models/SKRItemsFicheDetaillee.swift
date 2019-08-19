/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRItemsFicheDetaillee: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case services = "SERVICES"
        case praticiens = "PRATICIENS"
    }

    public var label: String?

    public var type: SKRType?

    public init(label: String? = nil, type: SKRType? = nil) {
        self.label = label
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRItemsFicheDetaillee else { return false }
      guard self.label == object.label else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRItemsFicheDetaillee, rhs: SKRItemsFicheDetaillee) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

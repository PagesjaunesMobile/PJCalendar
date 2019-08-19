/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLstSug: StargateKitModel {

    public var sug: [SKRSug]

    public var label: String?

    public var type: String?

    public init(sug: [SKRSug], label: String? = nil, type: String? = nil) {
        self.sug = sug
        self.label = label
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case sug
        case label
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        sug = try container.decodeArray(.sug)
        label = try container.decodeIfPresent(.label)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(sug, forKey: .sug)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLstSug else { return false }
      guard self.sug == object.sug else { return false }
      guard self.label == object.label else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRLstSug, rhs: SKRLstSug) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

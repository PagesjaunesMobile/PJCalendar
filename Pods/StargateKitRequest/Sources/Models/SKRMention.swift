/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMention: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case mog = "MOG"
        case moi = "MOI"
        case mod = "MOD"
        case mois = "MOIS"
        case mig = "MIG"
    }

    public var content: String?

    public var label: String?

    public var type: SKRType?

    public init(content: String? = nil, label: String? = nil, type: SKRType? = nil) {
        self.content = content
        self.label = label
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case content
        case label
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        content = try container.decodeIfPresent(.content)
        label = try container.decodeIfPresent(.label)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMention else { return false }
      guard self.content == object.content else { return false }
      guard self.label == object.label else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRMention, rhs: SKRMention) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

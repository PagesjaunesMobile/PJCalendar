/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLienLR: StargateKitModel {

    public var label: String?

    public var type: String?

    public var url: String?

    public init(label: String? = nil, type: String? = nil, url: String? = nil) {
        self.label = label
        self.type = type
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case type
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        type = try container.decodeIfPresent(.type)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLienLR else { return false }
      guard self.label == object.label else { return false }
      guard self.type == object.type else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRLienLR, rhs: SKRLienLR) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

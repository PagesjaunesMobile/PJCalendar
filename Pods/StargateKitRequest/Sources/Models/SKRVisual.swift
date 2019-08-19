/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRVisual: StargateKitModel {

    public var size: String?

    public var type: String?

    public var url: String?

    public init(size: String? = nil, type: String? = nil, url: String? = nil) {
        self.size = size
        self.type = type
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case size
        case type
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        size = try container.decodeIfPresent(.size)
        type = try container.decodeIfPresent(.type)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRVisual else { return false }
      guard self.size == object.size else { return false }
      guard self.type == object.type else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRVisual, rhs: SKRVisual) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

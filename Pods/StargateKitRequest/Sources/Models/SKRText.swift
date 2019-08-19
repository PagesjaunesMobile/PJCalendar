/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRText: StargateKitModel {

    public var content: String?

    public var type: String?

    public init(content: String? = nil, type: String? = nil) {
        self.content = content
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case content
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        content = try container.decodeIfPresent(.content)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRText else { return false }
      guard self.content == object.content else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRText, rhs: SKRText) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

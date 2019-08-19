/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPapItem: StargateKitModel {

    public var name: String?

    public var type: String?

    public init(name: String? = nil, type: String? = nil) {
        self.name = name
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case name
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decodeIfPresent(.name)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPapItem else { return false }
      guard self.name == object.name else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRPapItem, rhs: SKRPapItem) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

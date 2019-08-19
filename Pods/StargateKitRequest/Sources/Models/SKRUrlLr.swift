/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRUrlLr: StargateKitModel {

    public var type: String?

    public var value: String?

    public init(type: String? = nil, value: String? = nil) {
        self.type = type
        self.value = value
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case type
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decodeIfPresent(.type)
        value = try container.decodeIfPresent(.value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(value, forKey: .value)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRUrlLr else { return false }
      guard self.type == object.type else { return false }
      guard self.value == object.value else { return false }
      return true
    }

    public static func == (lhs: SKRUrlLr, rhs: SKRUrlLr) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

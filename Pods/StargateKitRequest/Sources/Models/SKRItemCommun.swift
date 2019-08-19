/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRItemCommun: StargateKitModel {

    public var label: String?

    public var value: String?

    public init(label: String? = nil, value: String? = nil) {
        self.label = label
        self.value = value
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        value = try container.decodeIfPresent(.value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(value, forKey: .value)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRItemCommun else { return false }
      guard self.label == object.label else { return false }
      guard self.value == object.value else { return false }
      return true
    }

    public static func == (lhs: SKRItemCommun, rhs: SKRItemCommun) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

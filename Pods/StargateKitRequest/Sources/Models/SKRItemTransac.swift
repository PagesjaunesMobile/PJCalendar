/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRItemTransac: StargateKitModel {

    public var id: String

    public var label: String

    public init(id: String, label: String) {
        self.id = id
        self.label = label
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case id
        case label
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(.id)
        label = try container.decode(.label)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(label, forKey: .label)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRItemTransac else { return false }
      guard self.id == object.id else { return false }
      guard self.label == object.label else { return false }
      return true
    }

    public static func == (lhs: SKRItemTransac, rhs: SKRItemTransac) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRURL: StargateKitModel {

    public var name: String?

    public var value: String?

    public init(name: String? = nil, value: String? = nil) {
        self.name = name
        self.value = value
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case name
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decodeIfPresent(.name)
        value = try container.decodeIfPresent(.value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(value, forKey: .value)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRURL else { return false }
      guard self.name == object.name else { return false }
      guard self.value == object.value else { return false }
      return true
    }

    public static func == (lhs: SKRURL, rhs: SKRURL) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

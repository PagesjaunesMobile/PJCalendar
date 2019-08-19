/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFilter: StargateKitModel {

    public var code: String?

    public var count: String?

    public var label: String?

    public init(code: String? = nil, count: String? = nil, label: String? = nil) {
        self.code = code
        self.count = count
        self.label = label
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case count
        case label
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        count = try container.decodeIfPresent(.count)
        label = try container.decodeIfPresent(.label)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(label, forKey: .label)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFilter else { return false }
      guard self.code == object.code else { return false }
      guard self.count == object.count else { return false }
      guard self.label == object.label else { return false }
      return true
    }

    public static func == (lhs: SKRFilter, rhs: SKRFilter) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

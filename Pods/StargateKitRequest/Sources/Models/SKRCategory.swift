/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCategory: StargateKitModel {

    public var code: String?

    public var label: String?

    public init(code: String? = nil, label: String? = nil) {
        self.code = code
        self.label = label
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case label
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        label = try container.decodeIfPresent(.label)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(label, forKey: .label)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCategory else { return false }
      guard self.code == object.code else { return false }
      guard self.label == object.label else { return false }
      return true
    }

    public static func == (lhs: SKRCategory, rhs: SKRCategory) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

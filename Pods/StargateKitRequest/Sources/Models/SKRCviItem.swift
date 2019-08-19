/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCviItem: StargateKitModel {

    public var image: String?

    public var value: String?

    public init(image: String? = nil, value: String? = nil) {
        self.image = image
        self.value = value
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case image
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        image = try container.decodeIfPresent(.image)
        value = try container.decodeIfPresent(.value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(value, forKey: .value)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCviItem else { return false }
      guard self.image == object.image else { return false }
      guard self.value == object.value else { return false }
      return true
    }

    public static func == (lhs: SKRCviItem, rhs: SKRCviItem) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

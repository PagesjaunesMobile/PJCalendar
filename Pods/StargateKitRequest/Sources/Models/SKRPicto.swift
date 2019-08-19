/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPicto: StargateKitModel {

    public var id: String?

    public var image: String?

    public var label: String?

    public init(id: String? = nil, image: String? = nil, label: String? = nil) {
        self.id = id
        self.image = image
        self.label = label
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case id
        case image
        case label
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decodeIfPresent(.id)
        image = try container.decodeIfPresent(.image)
        label = try container.decodeIfPresent(.label)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(label, forKey: .label)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPicto else { return false }
      guard self.id == object.id else { return false }
      guard self.image == object.image else { return false }
      guard self.label == object.label else { return false }
      return true
    }

    public static func == (lhs: SKRPicto, rhs: SKRPicto) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

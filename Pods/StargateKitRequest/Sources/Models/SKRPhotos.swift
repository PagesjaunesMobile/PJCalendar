/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPhotos: StargateKitModel {

    public var photo: [SKRPhoto]?

    public init(photo: [SKRPhoto]? = nil) {
        self.photo = photo
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case photo
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        photo = try container.decodeArrayIfPresent(.photo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(photo, forKey: .photo)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPhotos else { return false }
      guard self.photo == object.photo else { return false }
      return true
    }

    public static func == (lhs: SKRPhotos, rhs: SKRPhotos) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

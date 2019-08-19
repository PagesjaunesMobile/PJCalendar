/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRImageFavori: StargateKitModel {

    public var id: String?

    public var url: String?

    public init(id: String? = nil, url: String? = nil) {
        self.id = id
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case id
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decodeIfPresent(.id)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRImageFavori else { return false }
      guard self.id == object.id else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRImageFavori, rhs: SKRImageFavori) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

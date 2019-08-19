/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAlbums: StargateKitModel {

    public var album: [SKRAlbum]?

    public init(album: [SKRAlbum]? = nil) {
        self.album = album
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case album
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        album = try container.decodeArrayIfPresent(.album)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(album, forKey: .album)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAlbums else { return false }
      guard self.album == object.album else { return false }
      return true
    }

    public static func == (lhs: SKRAlbums, rhs: SKRAlbums) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

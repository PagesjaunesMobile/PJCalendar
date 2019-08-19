/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPvi: StargateKitModel {

    public var home: String?

    public var homePvi: String?

    public var id: String?

    public var image: String?

    public var photoUrl: String?

    public var thumbnail: String?

    public var title: String?

    public init(home: String? = nil, homePvi: String? = nil, id: String? = nil, image: String? = nil, photoUrl: String? = nil, thumbnail: String? = nil, title: String? = nil) {
        self.home = home
        self.homePvi = homePvi
        self.id = id
        self.image = image
        self.photoUrl = photoUrl
        self.thumbnail = thumbnail
        self.title = title
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case home
        case homePvi
        case id
        case image
        case photoUrl
        case thumbnail
        case title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        home = try container.decodeIfPresent(.home)
        homePvi = try container.decodeIfPresent(.homePvi)
        id = try container.decodeIfPresent(.id)
        image = try container.decodeIfPresent(.image)
        photoUrl = try container.decodeIfPresent(.photoUrl)
        thumbnail = try container.decodeIfPresent(.thumbnail)
        title = try container.decodeIfPresent(.title)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(home, forKey: .home)
        try container.encodeIfPresent(homePvi, forKey: .homePvi)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(photoUrl, forKey: .photoUrl)
        try container.encodeIfPresent(thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(title, forKey: .title)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPvi else { return false }
      guard self.home == object.home else { return false }
      guard self.homePvi == object.homePvi else { return false }
      guard self.id == object.id else { return false }
      guard self.image == object.image else { return false }
      guard self.photoUrl == object.photoUrl else { return false }
      guard self.thumbnail == object.thumbnail else { return false }
      guard self.title == object.title else { return false }
      return true
    }

    public static func == (lhs: SKRPvi, rhs: SKRPvi) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

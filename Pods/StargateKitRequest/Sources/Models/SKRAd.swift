/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAd: StargateKitModel {

    public var freeCallUrl: String?

    public var image: String?

    public var module: SKRModule?

    public var photo: [SKRPhoto]?

    public var pvi: SKRPvi?

    public var videos: SKRVideos?

    public var webUrl: [SKRWebUrl]?

    public init(freeCallUrl: String? = nil, image: String? = nil, module: SKRModule? = nil, photo: [SKRPhoto]? = nil, pvi: SKRPvi? = nil, videos: SKRVideos? = nil, webUrl: [SKRWebUrl]? = nil) {
        self.freeCallUrl = freeCallUrl
        self.image = image
        self.module = module
        self.photo = photo
        self.pvi = pvi
        self.videos = videos
        self.webUrl = webUrl
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case freeCallUrl
        case image
        case module
        case photo
        case pvi
        case videos
        case webUrl
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        freeCallUrl = try container.decodeIfPresent(.freeCallUrl)
        image = try container.decodeIfPresent(.image)
        module = try container.decodeIfPresent(.module)
        photo = try container.decodeArrayIfPresent(.photo)
        pvi = try container.decodeIfPresent(.pvi)
        videos = try container.decodeIfPresent(.videos)
        webUrl = try container.decodeArrayIfPresent(.webUrl)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(freeCallUrl, forKey: .freeCallUrl)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(module, forKey: .module)
        try container.encodeIfPresent(photo, forKey: .photo)
        try container.encodeIfPresent(pvi, forKey: .pvi)
        try container.encodeIfPresent(videos, forKey: .videos)
        try container.encodeIfPresent(webUrl, forKey: .webUrl)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAd else { return false }
      guard self.freeCallUrl == object.freeCallUrl else { return false }
      guard self.image == object.image else { return false }
      guard self.module == object.module else { return false }
      guard self.photo == object.photo else { return false }
      guard self.pvi == object.pvi else { return false }
      guard self.videos == object.videos else { return false }
      guard self.webUrl == object.webUrl else { return false }
      return true
    }

    public static func == (lhs: SKRAd, rhs: SKRAd) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDonneesVideosOrcFD: StargateKitModel {

    public var nombreTotalVideos: Int?

    public var videos: [SKRVideo]?

    public init(nombreTotalVideos: Int? = nil, videos: [SKRVideo]? = nil) {
        self.nombreTotalVideos = nombreTotalVideos
        self.videos = videos
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nombreTotalVideos = "nombre_total_videos"
        case videos
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nombreTotalVideos = try container.decodeIfPresent(.nombreTotalVideos)
        videos = try container.decodeArrayIfPresent(.videos)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(nombreTotalVideos, forKey: .nombreTotalVideos)
        try container.encodeIfPresent(videos, forKey: .videos)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDonneesVideosOrcFD else { return false }
      guard self.nombreTotalVideos == object.nombreTotalVideos else { return false }
      guard self.videos == object.videos else { return false }
      return true
    }

    public static func == (lhs: SKRDonneesVideosOrcFD, rhs: SKRDonneesVideosOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

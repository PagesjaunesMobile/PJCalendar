/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRVideos: StargateKitModel {

    public var dip: Bool?

    public var video: [SKRVideoLR]?

    public init(dip: Bool? = nil, video: [SKRVideoLR]? = nil) {
        self.dip = dip
        self.video = video
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dip
        case video
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dip = try container.decodeIfPresent(.dip)
        video = try container.decodeArrayIfPresent(.video)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dip, forKey: .dip)
        try container.encodeIfPresent(video, forKey: .video)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRVideos else { return false }
      guard self.dip == object.dip else { return false }
      guard self.video == object.video else { return false }
      return true
    }

    public static func == (lhs: SKRVideos, rhs: SKRVideos) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

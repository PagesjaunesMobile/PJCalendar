/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRVideoLR: StargateKitModel {

    public var desc: String?

    public var id: String?

    public var labelV: String?

    public var pos: String?

    public var prod: String?

    public var thumbnailURL: String?

    public var type: String?

    public var videoURL: String?

    public init(desc: String? = nil, id: String? = nil, labelV: String? = nil, pos: String? = nil, prod: String? = nil, thumbnailURL: String? = nil, type: String? = nil, videoURL: String? = nil) {
        self.desc = desc
        self.id = id
        self.labelV = labelV
        self.pos = pos
        self.prod = prod
        self.thumbnailURL = thumbnailURL
        self.type = type
        self.videoURL = videoURL
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case desc
        case id
        case labelV
        case pos
        case prod
        case thumbnailURL
        case type
        case videoURL
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        desc = try container.decodeIfPresent(.desc)
        id = try container.decodeIfPresent(.id)
        labelV = try container.decodeIfPresent(.labelV)
        pos = try container.decodeIfPresent(.pos)
        prod = try container.decodeIfPresent(.prod)
        thumbnailURL = try container.decodeIfPresent(.thumbnailURL)
        type = try container.decodeIfPresent(.type)
        videoURL = try container.decodeIfPresent(.videoURL)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(desc, forKey: .desc)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(labelV, forKey: .labelV)
        try container.encodeIfPresent(pos, forKey: .pos)
        try container.encodeIfPresent(prod, forKey: .prod)
        try container.encodeIfPresent(thumbnailURL, forKey: .thumbnailURL)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(videoURL, forKey: .videoURL)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRVideoLR else { return false }
      guard self.desc == object.desc else { return false }
      guard self.id == object.id else { return false }
      guard self.labelV == object.labelV else { return false }
      guard self.pos == object.pos else { return false }
      guard self.prod == object.prod else { return false }
      guard self.thumbnailURL == object.thumbnailURL else { return false }
      guard self.type == object.type else { return false }
      guard self.videoURL == object.videoURL else { return false }
      return true
    }

    public static func == (lhs: SKRVideoLR, rhs: SKRVideoLR) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

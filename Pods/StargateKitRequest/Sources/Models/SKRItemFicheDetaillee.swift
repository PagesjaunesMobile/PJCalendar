/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRItemFicheDetaillee: StargateKitModel {

    public var blockId: String?

    public var category: String?

    public var etabCode: String?

    public var id: String?

    public var label: String?

    public var ref: String?

    public var showFd: Bool?

    public var showThumbnail: Bool?

    public var thumbUrl: String?

    public init(blockId: String? = nil, category: String? = nil, etabCode: String? = nil, id: String? = nil, label: String? = nil, ref: String? = nil, showFd: Bool? = nil, showThumbnail: Bool? = nil, thumbUrl: String? = nil) {
        self.blockId = blockId
        self.category = category
        self.etabCode = etabCode
        self.id = id
        self.label = label
        self.ref = ref
        self.showFd = showFd
        self.showThumbnail = showThumbnail
        self.thumbUrl = thumbUrl
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case blockId
        case category
        case etabCode = "etab_code"
        case id
        case label
        case ref
        case showFd = "show_fd"
        case showThumbnail = "show_thumbnail"
        case thumbUrl
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        blockId = try container.decodeIfPresent(.blockId)
        category = try container.decodeIfPresent(.category)
        etabCode = try container.decodeIfPresent(.etabCode)
        id = try container.decodeIfPresent(.id)
        label = try container.decodeIfPresent(.label)
        ref = try container.decodeIfPresent(.ref)
        showFd = try container.decodeIfPresent(.showFd)
        showThumbnail = try container.decodeIfPresent(.showThumbnail)
        thumbUrl = try container.decodeIfPresent(.thumbUrl)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(blockId, forKey: .blockId)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(etabCode, forKey: .etabCode)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(ref, forKey: .ref)
        try container.encodeIfPresent(showFd, forKey: .showFd)
        try container.encodeIfPresent(showThumbnail, forKey: .showThumbnail)
        try container.encodeIfPresent(thumbUrl, forKey: .thumbUrl)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRItemFicheDetaillee else { return false }
      guard self.blockId == object.blockId else { return false }
      guard self.category == object.category else { return false }
      guard self.etabCode == object.etabCode else { return false }
      guard self.id == object.id else { return false }
      guard self.label == object.label else { return false }
      guard self.ref == object.ref else { return false }
      guard self.showFd == object.showFd else { return false }
      guard self.showThumbnail == object.showThumbnail else { return false }
      guard self.thumbUrl == object.thumbUrl else { return false }
      return true
    }

    public static func == (lhs: SKRItemFicheDetaillee, rhs: SKRItemFicheDetaillee) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

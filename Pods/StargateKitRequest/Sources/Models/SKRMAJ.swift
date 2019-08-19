/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMAJ: StargateKitModel {

    public var lsvId: String?

    public var lsvUrl: String?

    public var title: String?

    public var txt: String?

    public var type: String?

    public var url: String?

    public init(lsvId: String? = nil, lsvUrl: String? = nil, title: String? = nil, txt: String? = nil, type: String? = nil, url: String? = nil) {
        self.lsvId = lsvId
        self.lsvUrl = lsvUrl
        self.title = title
        self.txt = txt
        self.type = type
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case lsvId
        case lsvUrl
        case title
        case txt
        case type
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        lsvId = try container.decodeIfPresent(.lsvId)
        lsvUrl = try container.decodeIfPresent(.lsvUrl)
        title = try container.decodeIfPresent(.title)
        txt = try container.decodeIfPresent(.txt)
        type = try container.decodeIfPresent(.type)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(lsvId, forKey: .lsvId)
        try container.encodeIfPresent(lsvUrl, forKey: .lsvUrl)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(txt, forKey: .txt)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMAJ else { return false }
      guard self.lsvId == object.lsvId else { return false }
      guard self.lsvUrl == object.lsvUrl else { return false }
      guard self.title == object.title else { return false }
      guard self.txt == object.txt else { return false }
      guard self.type == object.type else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRMAJ, rhs: SKRMAJ) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

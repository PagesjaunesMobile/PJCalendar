/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSeReferencer: StargateKitModel {

    public var label: String?

    public var title: String?

    public var url: String?

    public init(label: String? = nil, title: String? = nil, url: String? = nil) {
        self.label = label
        self.title = title
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case title
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        title = try container.decodeIfPresent(.title)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSeReferencer else { return false }
      guard self.label == object.label else { return false }
      guard self.title == object.title else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRSeReferencer, rhs: SKRSeReferencer) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

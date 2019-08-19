/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRWebUrl: StargateKitModel {

    public var label: String?

    public var transac: String?

    public var type: String?

    public var url: String?

    public init(label: String? = nil, transac: String? = nil, type: String? = nil, url: String? = nil) {
        self.label = label
        self.transac = transac
        self.type = type
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case transac
        case type
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        transac = try container.decodeIfPresent(.transac)
        type = try container.decodeIfPresent(.type)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(transac, forKey: .transac)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRWebUrl else { return false }
      guard self.label == object.label else { return false }
      guard self.transac == object.transac else { return false }
      guard self.type == object.type else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRWebUrl, rhs: SKRWebUrl) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

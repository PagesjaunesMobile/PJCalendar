/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLien: StargateKitModel {

    public var name: String?

    public var url: String?

    public init(name: String? = nil, url: String? = nil) {
        self.name = name
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case name
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decodeIfPresent(.name)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLien else { return false }
      guard self.name == object.name else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRLien, rhs: SKRLien) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

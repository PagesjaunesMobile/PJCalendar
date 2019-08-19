/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRUrls: StargateKitModel {

    public var url: [SKRURL]?

    public init(url: [SKRURL]? = nil) {
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        url = try container.decodeArrayIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRUrls else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRUrls, rhs: SKRUrls) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

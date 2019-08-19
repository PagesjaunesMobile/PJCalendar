/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFilArianeOrcFD: StargateKitModel {

    public var urls: [SKRUrlSEOOrcFD]?

    public init(urls: [SKRUrlSEOOrcFD]? = nil) {
        self.urls = urls
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case urls
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        urls = try container.decodeArrayIfPresent(.urls)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(urls, forKey: .urls)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFilArianeOrcFD else { return false }
      guard self.urls == object.urls else { return false }
      return true
    }

    public static func == (lhs: SKRFilArianeOrcFD, rhs: SKRFilArianeOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

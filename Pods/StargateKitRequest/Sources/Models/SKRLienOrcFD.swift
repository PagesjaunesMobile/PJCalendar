/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLienOrcFD: StargateKitModel {

    public var encodage: String?

    public var url: String?

    public init(encodage: String? = nil, url: String? = nil) {
        self.encodage = encodage
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case encodage
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        encodage = try container.decodeIfPresent(.encodage)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(encodage, forKey: .encodage)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLienOrcFD else { return false }
      guard self.encodage == object.encodage else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRLienOrcFD, rhs: SKRLienOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

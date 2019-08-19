/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFile: StargateKitModel {

    public var nom: String?

    public var url: String?

    public init(nom: String? = nil, url: String? = nil) {
        self.nom = nom
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nom
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nom = try container.decodeIfPresent(.nom)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(nom, forKey: .nom)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFile else { return false }
      guard self.nom == object.nom else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRFile, rhs: SKRFile) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCategorieLr: StargateKitModel {

    public var nb: Int?

    public var type: String?

    public init(nb: Int? = nil, type: String? = nil) {
        self.nb = nb
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nb
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nb = try container.decodeIfPresent(.nb)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(nb, forKey: .nb)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCategorieLr else { return false }
      guard self.nb == object.nb else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRCategorieLr, rhs: SKRCategorieLr) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

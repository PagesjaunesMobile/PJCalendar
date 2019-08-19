/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRReformulationStargate: StargateKitModel {

    public var index: Int?

    public var libelle: String?

    public var type: String?

    public init(index: Int? = nil, libelle: String? = nil, type: String? = nil) {
        self.index = index
        self.libelle = libelle
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case index
        case libelle
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        index = try container.decodeIfPresent(.index)
        libelle = try container.decodeIfPresent(.libelle)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(index, forKey: .index)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRReformulationStargate else { return false }
      guard self.index == object.index else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRReformulationStargate, rhs: SKRReformulationStargate) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

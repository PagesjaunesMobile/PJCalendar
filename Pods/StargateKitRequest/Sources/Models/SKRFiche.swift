/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFiche: StargateKitModel {

    public var champ: [SKRChampComplementaire]?

    public var id: String?

    public var libelle: String?

    public init(champ: [SKRChampComplementaire]? = nil, id: String? = nil, libelle: String? = nil) {
        self.champ = champ
        self.id = id
        self.libelle = libelle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case champ
        case id
        case libelle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        champ = try container.decodeArrayIfPresent(.champ)
        id = try container.decodeIfPresent(.id)
        libelle = try container.decodeIfPresent(.libelle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(champ, forKey: .champ)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(libelle, forKey: .libelle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFiche else { return false }
      guard self.champ == object.champ else { return false }
      guard self.id == object.id else { return false }
      guard self.libelle == object.libelle else { return false }
      return true
    }

    public static func == (lhs: SKRFiche, rhs: SKRFiche) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

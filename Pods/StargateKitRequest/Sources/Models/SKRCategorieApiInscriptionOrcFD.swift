/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCategorieApiInscriptionOrcFD: StargateKitModel {

    public var id: Int?

    public var libelle: String?

    public init(id: Int? = nil, libelle: String? = nil) {
        self.id = id
        self.libelle = libelle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case id
        case libelle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decodeIfPresent(.id)
        libelle = try container.decodeIfPresent(.libelle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(libelle, forKey: .libelle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCategorieApiInscriptionOrcFD else { return false }
      guard self.id == object.id else { return false }
      guard self.libelle == object.libelle else { return false }
      return true
    }

    public static func == (lhs: SKRCategorieApiInscriptionOrcFD, rhs: SKRCategorieApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

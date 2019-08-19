/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRChampChoixOrcRdv: StargateKitModel {

    public var choix: [String]?

    public var libelle: String?

    public init(choix: [String]? = nil, libelle: String? = nil) {
        self.choix = choix
        self.libelle = libelle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case choix
        case libelle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        choix = try container.decodeArrayIfPresent(.choix)
        libelle = try container.decodeIfPresent(.libelle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(choix, forKey: .choix)
        try container.encodeIfPresent(libelle, forKey: .libelle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRChampChoixOrcRdv else { return false }
      guard self.choix == object.choix else { return false }
      guard self.libelle == object.libelle else { return false }
      return true
    }

    public static func == (lhs: SKRChampChoixOrcRdv, rhs: SKRChampChoixOrcRdv) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

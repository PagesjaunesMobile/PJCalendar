/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAmeli: StargateKitModel {

    public var dateMaj: String?

    public var libelle: String?

    public init(dateMaj: String? = nil, libelle: String? = nil) {
        self.dateMaj = dateMaj
        self.libelle = libelle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dateMaj = "date_maj"
        case libelle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dateMaj = try container.decodeIfPresent(.dateMaj)
        libelle = try container.decodeIfPresent(.libelle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dateMaj, forKey: .dateMaj)
        try container.encodeIfPresent(libelle, forKey: .libelle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAmeli else { return false }
      guard self.dateMaj == object.dateMaj else { return false }
      guard self.libelle == object.libelle else { return false }
      return true
    }

    public static func == (lhs: SKRAmeli, rhs: SKRAmeli) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

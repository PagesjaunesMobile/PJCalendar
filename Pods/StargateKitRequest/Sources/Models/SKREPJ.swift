/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREPJ: StargateKitModel {

    public var bp: [SKRBP]?

    public var idEpj: String?

    public var nb: Int?

    public var typeOffre: String?

    public init(bp: [SKRBP]? = nil, idEpj: String? = nil, nb: Int? = nil, typeOffre: String? = nil) {
        self.bp = bp
        self.idEpj = idEpj
        self.nb = nb
        self.typeOffre = typeOffre
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case bp
        case idEpj = "id_epj"
        case nb
        case typeOffre = "type_offre"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        bp = try container.decodeArrayIfPresent(.bp)
        idEpj = try container.decodeIfPresent(.idEpj)
        nb = try container.decodeIfPresent(.nb)
        typeOffre = try container.decodeIfPresent(.typeOffre)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(bp, forKey: .bp)
        try container.encodeIfPresent(idEpj, forKey: .idEpj)
        try container.encodeIfPresent(nb, forKey: .nb)
        try container.encodeIfPresent(typeOffre, forKey: .typeOffre)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREPJ else { return false }
      guard self.bp == object.bp else { return false }
      guard self.idEpj == object.idEpj else { return false }
      guard self.nb == object.nb else { return false }
      guard self.typeOffre == object.typeOffre else { return false }
      return true
    }

    public static func == (lhs: SKREPJ, rhs: SKREPJ) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

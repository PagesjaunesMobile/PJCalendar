/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREPJGetBP: StargateKitModel {

    public var accroche: String?

    public var adImage: String?

    public var address: SKRAddress?

    public var bp: SKRBP?

    public var descType: String?

    public var idBp: String?

    public var idEpj: String?

    public var name: String?

    public var nb: Int?

    public var typeOffre: String?

    public init(accroche: String? = nil, adImage: String? = nil, address: SKRAddress? = nil, bp: SKRBP? = nil, descType: String? = nil, idBp: String? = nil, idEpj: String? = nil, name: String? = nil, nb: Int? = nil, typeOffre: String? = nil) {
        self.accroche = accroche
        self.adImage = adImage
        self.address = address
        self.bp = bp
        self.descType = descType
        self.idBp = idBp
        self.idEpj = idEpj
        self.name = name
        self.nb = nb
        self.typeOffre = typeOffre
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case accroche
        case adImage = "ad_image"
        case address
        case bp
        case descType = "desc_type"
        case idBp = "id_bp"
        case idEpj = "id_epj"
        case name
        case nb
        case typeOffre = "type_offre"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        accroche = try container.decodeIfPresent(.accroche)
        adImage = try container.decodeIfPresent(.adImage)
        address = try container.decodeIfPresent(.address)
        bp = try container.decodeIfPresent(.bp)
        descType = try container.decodeIfPresent(.descType)
        idBp = try container.decodeIfPresent(.idBp)
        idEpj = try container.decodeIfPresent(.idEpj)
        name = try container.decodeIfPresent(.name)
        nb = try container.decodeIfPresent(.nb)
        typeOffre = try container.decodeIfPresent(.typeOffre)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(accroche, forKey: .accroche)
        try container.encodeIfPresent(adImage, forKey: .adImage)
        try container.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(bp, forKey: .bp)
        try container.encodeIfPresent(descType, forKey: .descType)
        try container.encodeIfPresent(idBp, forKey: .idBp)
        try container.encodeIfPresent(idEpj, forKey: .idEpj)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(nb, forKey: .nb)
        try container.encodeIfPresent(typeOffre, forKey: .typeOffre)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREPJGetBP else { return false }
      guard self.accroche == object.accroche else { return false }
      guard self.adImage == object.adImage else { return false }
      guard self.address == object.address else { return false }
      guard self.bp == object.bp else { return false }
      guard self.descType == object.descType else { return false }
      guard self.idBp == object.idBp else { return false }
      guard self.idEpj == object.idEpj else { return false }
      guard self.name == object.name else { return false }
      guard self.nb == object.nb else { return false }
      guard self.typeOffre == object.typeOffre else { return false }
      return true
    }

    public static func == (lhs: SKREPJGetBP, rhs: SKREPJGetBP) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

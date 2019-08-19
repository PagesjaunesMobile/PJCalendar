/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRBP: StargateKitModel {

    public var accroche: String?

    public var bfURL: String?

    public var conditions: String?

    public var dateFin: String?

    public var descType: String?

    public var description: String?

    public var idBp: String?

    public var lienVisuel: String?

    public var lienVisuelExt: String?

    public var pjURL: String?

    public var resUrl: String?

    public var type: String?

    public init(accroche: String? = nil, bfURL: String? = nil, conditions: String? = nil, dateFin: String? = nil, descType: String? = nil, description: String? = nil, idBp: String? = nil, lienVisuel: String? = nil, lienVisuelExt: String? = nil, pjURL: String? = nil, resUrl: String? = nil, type: String? = nil) {
        self.accroche = accroche
        self.bfURL = bfURL
        self.conditions = conditions
        self.dateFin = dateFin
        self.descType = descType
        self.description = description
        self.idBp = idBp
        self.lienVisuel = lienVisuel
        self.lienVisuelExt = lienVisuelExt
        self.pjURL = pjURL
        self.resUrl = resUrl
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case accroche
        case bfURL
        case conditions
        case dateFin = "date_fin"
        case descType = "desc_type"
        case description
        case idBp = "id_bp"
        case lienVisuel = "lien_visuel"
        case lienVisuelExt = "lien_visuel_ext"
        case pjURL
        case resUrl
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        accroche = try container.decodeIfPresent(.accroche)
        bfURL = try container.decodeIfPresent(.bfURL)
        conditions = try container.decodeIfPresent(.conditions)
        dateFin = try container.decodeIfPresent(.dateFin)
        descType = try container.decodeIfPresent(.descType)
        description = try container.decodeIfPresent(.description)
        idBp = try container.decodeIfPresent(.idBp)
        lienVisuel = try container.decodeIfPresent(.lienVisuel)
        lienVisuelExt = try container.decodeIfPresent(.lienVisuelExt)
        pjURL = try container.decodeIfPresent(.pjURL)
        resUrl = try container.decodeIfPresent(.resUrl)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(accroche, forKey: .accroche)
        try container.encodeIfPresent(bfURL, forKey: .bfURL)
        try container.encodeIfPresent(conditions, forKey: .conditions)
        try container.encodeIfPresent(dateFin, forKey: .dateFin)
        try container.encodeIfPresent(descType, forKey: .descType)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(idBp, forKey: .idBp)
        try container.encodeIfPresent(lienVisuel, forKey: .lienVisuel)
        try container.encodeIfPresent(lienVisuelExt, forKey: .lienVisuelExt)
        try container.encodeIfPresent(pjURL, forKey: .pjURL)
        try container.encodeIfPresent(resUrl, forKey: .resUrl)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRBP else { return false }
      guard self.accroche == object.accroche else { return false }
      guard self.bfURL == object.bfURL else { return false }
      guard self.conditions == object.conditions else { return false }
      guard self.dateFin == object.dateFin else { return false }
      guard self.descType == object.descType else { return false }
      guard self.description == object.description else { return false }
      guard self.idBp == object.idBp else { return false }
      guard self.lienVisuel == object.lienVisuel else { return false }
      guard self.lienVisuelExt == object.lienVisuelExt else { return false }
      guard self.pjURL == object.pjURL else { return false }
      guard self.resUrl == object.resUrl else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRBP, rhs: SKRBP) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

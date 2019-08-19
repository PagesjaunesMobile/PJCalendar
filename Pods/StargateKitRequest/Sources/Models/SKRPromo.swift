/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPromo: StargateKitModel {

    public var accroche: String?

    public var dateDebut: String?

    public var dateFin: String?

    public var descType: String?

    public var description: String?

    public var idBp: String?

    public var lienReserv: String?

    public var lienVisuel: String?

    public var lienVisuelExt: String?

    public var periodeValidite: String?

    public var type: String?

    public init(accroche: String? = nil, dateDebut: String? = nil, dateFin: String? = nil, descType: String? = nil, description: String? = nil, idBp: String? = nil, lienReserv: String? = nil, lienVisuel: String? = nil, lienVisuelExt: String? = nil, periodeValidite: String? = nil, type: String? = nil) {
        self.accroche = accroche
        self.dateDebut = dateDebut
        self.dateFin = dateFin
        self.descType = descType
        self.description = description
        self.idBp = idBp
        self.lienReserv = lienReserv
        self.lienVisuel = lienVisuel
        self.lienVisuelExt = lienVisuelExt
        self.periodeValidite = periodeValidite
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case accroche
        case dateDebut = "date_debut"
        case dateFin = "date_fin"
        case descType = "desc_type"
        case description
        case idBp = "id_bp"
        case lienReserv = "lien_reserv"
        case lienVisuel = "lien_visuel"
        case lienVisuelExt = "lien_visuel_ext"
        case periodeValidite = "periode_validite"
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        accroche = try container.decodeIfPresent(.accroche)
        dateDebut = try container.decodeIfPresent(.dateDebut)
        dateFin = try container.decodeIfPresent(.dateFin)
        descType = try container.decodeIfPresent(.descType)
        description = try container.decodeIfPresent(.description)
        idBp = try container.decodeIfPresent(.idBp)
        lienReserv = try container.decodeIfPresent(.lienReserv)
        lienVisuel = try container.decodeIfPresent(.lienVisuel)
        lienVisuelExt = try container.decodeIfPresent(.lienVisuelExt)
        periodeValidite = try container.decodeIfPresent(.periodeValidite)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(accroche, forKey: .accroche)
        try container.encodeIfPresent(dateDebut, forKey: .dateDebut)
        try container.encodeIfPresent(dateFin, forKey: .dateFin)
        try container.encodeIfPresent(descType, forKey: .descType)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(idBp, forKey: .idBp)
        try container.encodeIfPresent(lienReserv, forKey: .lienReserv)
        try container.encodeIfPresent(lienVisuel, forKey: .lienVisuel)
        try container.encodeIfPresent(lienVisuelExt, forKey: .lienVisuelExt)
        try container.encodeIfPresent(periodeValidite, forKey: .periodeValidite)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPromo else { return false }
      guard self.accroche == object.accroche else { return false }
      guard self.dateDebut == object.dateDebut else { return false }
      guard self.dateFin == object.dateFin else { return false }
      guard self.descType == object.descType else { return false }
      guard self.description == object.description else { return false }
      guard self.idBp == object.idBp else { return false }
      guard self.lienReserv == object.lienReserv else { return false }
      guard self.lienVisuel == object.lienVisuel else { return false }
      guard self.lienVisuelExt == object.lienVisuelExt else { return false }
      guard self.periodeValidite == object.periodeValidite else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRPromo, rhs: SKRPromo) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

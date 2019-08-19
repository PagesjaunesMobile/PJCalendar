/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTransactionnelSanteOrcFD: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case restaurant = "RESTAURANT"
        case hotel = "HOTEL"
        case sante = "SANTE"
    }

    public var calendrier: SKRCalendrierDisponibilitesOrcFD?

    public var calendrierId: String?

    public var groupeId: String?

    public var idService: String?

    public var identifiant: String?

    public var type: SKRType?

    public var typeDonnees: String?

    public var typeStructure: String?

    public init(calendrier: SKRCalendrierDisponibilitesOrcFD? = nil, calendrierId: String? = nil, groupeId: String? = nil, idService: String? = nil, identifiant: String? = nil, type: SKRType? = nil, typeDonnees: String? = nil, typeStructure: String? = nil) {
        self.calendrier = calendrier
        self.calendrierId = calendrierId
        self.groupeId = groupeId
        self.idService = idService
        self.identifiant = identifiant
        self.type = type
        self.typeDonnees = typeDonnees
        self.typeStructure = typeStructure
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case calendrier
        case calendrierId = "calendrier_id"
        case groupeId = "groupe_id"
        case idService = "id_service"
        case identifiant
        case type
        case typeDonnees = "type_donnees"
        case typeStructure = "type_structure"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        calendrier = try container.decodeIfPresent(.calendrier)
        calendrierId = try container.decodeIfPresent(.calendrierId)
        groupeId = try container.decodeIfPresent(.groupeId)
        idService = try container.decodeIfPresent(.idService)
        identifiant = try container.decodeIfPresent(.identifiant)
        type = try container.decodeIfPresent(.type)
        typeDonnees = try container.decodeIfPresent(.typeDonnees)
        typeStructure = try container.decodeIfPresent(.typeStructure)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(calendrier, forKey: .calendrier)
        try container.encodeIfPresent(calendrierId, forKey: .calendrierId)
        try container.encodeIfPresent(groupeId, forKey: .groupeId)
        try container.encodeIfPresent(idService, forKey: .idService)
        try container.encodeIfPresent(identifiant, forKey: .identifiant)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(typeDonnees, forKey: .typeDonnees)
        try container.encodeIfPresent(typeStructure, forKey: .typeStructure)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTransactionnelSanteOrcFD else { return false }
      guard self.calendrier == object.calendrier else { return false }
      guard self.calendrierId == object.calendrierId else { return false }
      guard self.groupeId == object.groupeId else { return false }
      guard self.idService == object.idService else { return false }
      guard self.identifiant == object.identifiant else { return false }
      guard self.type == object.type else { return false }
      guard self.typeDonnees == object.typeDonnees else { return false }
      guard self.typeStructure == object.typeStructure else { return false }
      return true
    }

    public static func == (lhs: SKRTransactionnelSanteOrcFD, rhs: SKRTransactionnelSanteOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

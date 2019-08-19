/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPrendreRendezVousRequest: StargateKitModel {

    public var fiche: SKRFiche

    public var rdv: SKRRdvTransac

    public var etabCode: String?

    public var groupeId: String?

    public var token: String?

    public var typeTransactionnel: String?

    public init(fiche: SKRFiche, rdv: SKRRdvTransac, etabCode: String? = nil, groupeId: String? = nil, token: String? = nil, typeTransactionnel: String? = nil) {
        self.fiche = fiche
        self.rdv = rdv
        self.etabCode = etabCode
        self.groupeId = groupeId
        self.token = token
        self.typeTransactionnel = typeTransactionnel
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case fiche
        case rdv
        case etabCode = "etab_code"
        case groupeId = "groupe_id"
        case token
        case typeTransactionnel = "type_transactionnel"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        fiche = try container.decode(.fiche)
        rdv = try container.decode(.rdv)
        etabCode = try container.decodeIfPresent(.etabCode)
        groupeId = try container.decodeIfPresent(.groupeId)
        token = try container.decodeIfPresent(.token)
        typeTransactionnel = try container.decodeIfPresent(.typeTransactionnel)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(fiche, forKey: .fiche)
        try container.encode(rdv, forKey: .rdv)
        try container.encodeIfPresent(etabCode, forKey: .etabCode)
        try container.encodeIfPresent(groupeId, forKey: .groupeId)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(typeTransactionnel, forKey: .typeTransactionnel)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPrendreRendezVousRequest else { return false }
      guard self.fiche == object.fiche else { return false }
      guard self.rdv == object.rdv else { return false }
      guard self.etabCode == object.etabCode else { return false }
      guard self.groupeId == object.groupeId else { return false }
      guard self.token == object.token else { return false }
      guard self.typeTransactionnel == object.typeTransactionnel else { return false }
      return true
    }

    public static func == (lhs: SKRPrendreRendezVousRequest, rhs: SKRPrendreRendezVousRequest) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

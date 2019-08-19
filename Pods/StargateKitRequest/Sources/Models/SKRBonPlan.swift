/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRBonPlan: StargateKitModel {

    public enum SKRTypePpp: String, Codable, Hashable, CaseIterable {
        case produitService = "PRODUIT_SERVICE"
        case annonceImmo = "ANNONCE_IMMO"
        case annonceAuto = "ANNONCE_AUTO"
        case annonceMoto = "ANNONCE_MOTO"
        case bonPlan = "BON_PLAN"
    }

    public var accroche: String?

    public var conditions: String?

    public var dateFinValidite: String?

    public var description: String?

    public var idBonPlan: String?

    public var identifiantPpp: String?

    public var typeDescription: String?

    public var typePpp: SKRTypePpp?

    public var typologie: String?

    public var uRLVisuel: String?

    public var visuels: [SKRVisuelPPPApiInscriptionOrcFD]?

    public init(accroche: String? = nil, conditions: String? = nil, dateFinValidite: String? = nil, description: String? = nil, idBonPlan: String? = nil, identifiantPpp: String? = nil, typeDescription: String? = nil, typePpp: SKRTypePpp? = nil, typologie: String? = nil, uRLVisuel: String? = nil, visuels: [SKRVisuelPPPApiInscriptionOrcFD]? = nil) {
        self.accroche = accroche
        self.conditions = conditions
        self.dateFinValidite = dateFinValidite
        self.description = description
        self.idBonPlan = idBonPlan
        self.identifiantPpp = identifiantPpp
        self.typeDescription = typeDescription
        self.typePpp = typePpp
        self.typologie = typologie
        self.uRLVisuel = uRLVisuel
        self.visuels = visuels
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case accroche
        case conditions
        case dateFinValidite = "date_fin_validite"
        case description
        case idBonPlan = "id_bon_plan"
        case identifiantPpp = "identifiant_ppp"
        case typeDescription = "type_description"
        case typePpp = "type_ppp"
        case typologie
        case uRLVisuel = "url_visuel"
        case visuels
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        accroche = try container.decodeIfPresent(.accroche)
        conditions = try container.decodeIfPresent(.conditions)
        dateFinValidite = try container.decodeIfPresent(.dateFinValidite)
        description = try container.decodeIfPresent(.description)
        idBonPlan = try container.decodeIfPresent(.idBonPlan)
        identifiantPpp = try container.decodeIfPresent(.identifiantPpp)
        typeDescription = try container.decodeIfPresent(.typeDescription)
        typePpp = try container.decodeIfPresent(.typePpp)
        typologie = try container.decodeIfPresent(.typologie)
        uRLVisuel = try container.decodeIfPresent(.uRLVisuel)
        visuels = try container.decodeArrayIfPresent(.visuels)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(accroche, forKey: .accroche)
        try container.encodeIfPresent(conditions, forKey: .conditions)
        try container.encodeIfPresent(dateFinValidite, forKey: .dateFinValidite)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(idBonPlan, forKey: .idBonPlan)
        try container.encodeIfPresent(identifiantPpp, forKey: .identifiantPpp)
        try container.encodeIfPresent(typeDescription, forKey: .typeDescription)
        try container.encodeIfPresent(typePpp, forKey: .typePpp)
        try container.encodeIfPresent(typologie, forKey: .typologie)
        try container.encodeIfPresent(uRLVisuel, forKey: .uRLVisuel)
        try container.encodeIfPresent(visuels, forKey: .visuels)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRBonPlan else { return false }
      guard self.accroche == object.accroche else { return false }
      guard self.conditions == object.conditions else { return false }
      guard self.dateFinValidite == object.dateFinValidite else { return false }
      guard self.description == object.description else { return false }
      guard self.idBonPlan == object.idBonPlan else { return false }
      guard self.identifiantPpp == object.identifiantPpp else { return false }
      guard self.typeDescription == object.typeDescription else { return false }
      guard self.typePpp == object.typePpp else { return false }
      guard self.typologie == object.typologie else { return false }
      guard self.uRLVisuel == object.uRLVisuel else { return false }
      guard self.visuels == object.visuels else { return false }
      return true
    }

    public static func == (lhs: SKRBonPlan, rhs: SKRBonPlan) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

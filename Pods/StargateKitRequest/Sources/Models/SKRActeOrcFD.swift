/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRActeOrcFD: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case creation = "CREATION"
        case immatriculation = "IMMATRICULATION"
        case vente = "VENTE"
    }

    public var categorie: String?

    public var dateCommencementActivite: String?

    public var dateEffet: String?

    public var dateImmatriculation: String?

    public var declarationsCreance: [String]?

    public var descriptif: String?

    public var oppositions: [String]?

    public var publication: String?

    public var type: SKRType?

    public init(categorie: String? = nil, dateCommencementActivite: String? = nil, dateEffet: String? = nil, dateImmatriculation: String? = nil, declarationsCreance: [String]? = nil, descriptif: String? = nil, oppositions: [String]? = nil, publication: String? = nil, type: SKRType? = nil) {
        self.categorie = categorie
        self.dateCommencementActivite = dateCommencementActivite
        self.dateEffet = dateEffet
        self.dateImmatriculation = dateImmatriculation
        self.declarationsCreance = declarationsCreance
        self.descriptif = descriptif
        self.oppositions = oppositions
        self.publication = publication
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case categorie
        case dateCommencementActivite = "date_commencement_activite"
        case dateEffet = "date_effet"
        case dateImmatriculation = "date_immatriculation"
        case declarationsCreance = "declarations_creance"
        case descriptif
        case oppositions
        case publication
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        categorie = try container.decodeIfPresent(.categorie)
        dateCommencementActivite = try container.decodeIfPresent(.dateCommencementActivite)
        dateEffet = try container.decodeIfPresent(.dateEffet)
        dateImmatriculation = try container.decodeIfPresent(.dateImmatriculation)
        declarationsCreance = try container.decodeArrayIfPresent(.declarationsCreance)
        descriptif = try container.decodeIfPresent(.descriptif)
        oppositions = try container.decodeArrayIfPresent(.oppositions)
        publication = try container.decodeIfPresent(.publication)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(categorie, forKey: .categorie)
        try container.encodeIfPresent(dateCommencementActivite, forKey: .dateCommencementActivite)
        try container.encodeIfPresent(dateEffet, forKey: .dateEffet)
        try container.encodeIfPresent(dateImmatriculation, forKey: .dateImmatriculation)
        try container.encodeIfPresent(declarationsCreance, forKey: .declarationsCreance)
        try container.encodeIfPresent(descriptif, forKey: .descriptif)
        try container.encodeIfPresent(oppositions, forKey: .oppositions)
        try container.encodeIfPresent(publication, forKey: .publication)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRActeOrcFD else { return false }
      guard self.categorie == object.categorie else { return false }
      guard self.dateCommencementActivite == object.dateCommencementActivite else { return false }
      guard self.dateEffet == object.dateEffet else { return false }
      guard self.dateImmatriculation == object.dateImmatriculation else { return false }
      guard self.declarationsCreance == object.declarationsCreance else { return false }
      guard self.descriptif == object.descriptif else { return false }
      guard self.oppositions == object.oppositions else { return false }
      guard self.publication == object.publication else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRActeOrcFD, rhs: SKRActeOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

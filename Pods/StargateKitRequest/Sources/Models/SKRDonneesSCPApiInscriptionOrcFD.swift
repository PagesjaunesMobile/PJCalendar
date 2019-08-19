/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDonneesSCPApiInscriptionOrcFD: StargateKitModel {

    public var categorie: Int?

    public var description: String?

    public var id: String?

    public var libelle: String?

    public var logo: String?

    public var priorite: Int?

    public var type: String?

    public init(categorie: Int? = nil, description: String? = nil, id: String? = nil, libelle: String? = nil, logo: String? = nil, priorite: Int? = nil, type: String? = nil) {
        self.categorie = categorie
        self.description = description
        self.id = id
        self.libelle = libelle
        self.logo = logo
        self.priorite = priorite
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case categorie
        case description
        case id
        case libelle
        case logo
        case priorite
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        categorie = try container.decodeIfPresent(.categorie)
        description = try container.decodeIfPresent(.description)
        id = try container.decodeIfPresent(.id)
        libelle = try container.decodeIfPresent(.libelle)
        logo = try container.decodeIfPresent(.logo)
        priorite = try container.decodeIfPresent(.priorite)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(categorie, forKey: .categorie)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(logo, forKey: .logo)
        try container.encodeIfPresent(priorite, forKey: .priorite)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDonneesSCPApiInscriptionOrcFD else { return false }
      guard self.categorie == object.categorie else { return false }
      guard self.description == object.description else { return false }
      guard self.id == object.id else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.logo == object.logo else { return false }
      guard self.priorite == object.priorite else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRDonneesSCPApiInscriptionOrcFD, rhs: SKRDonneesSCPApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

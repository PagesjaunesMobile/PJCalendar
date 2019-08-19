/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRIntervention: StargateKitModel {

    public var description: String?

    public var duree: String?

    public var id: String?

    public var idCategorie: String?

    public var libelle: String?

    public var photo: String?

    public var prix: String?

    public init(description: String? = nil, duree: String? = nil, id: String? = nil, idCategorie: String? = nil, libelle: String? = nil, photo: String? = nil, prix: String? = nil) {
        self.description = description
        self.duree = duree
        self.id = id
        self.idCategorie = idCategorie
        self.libelle = libelle
        self.photo = photo
        self.prix = prix
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case description
        case duree
        case id
        case idCategorie = "id_categorie"
        case libelle
        case photo
        case prix
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        description = try container.decodeIfPresent(.description)
        duree = try container.decodeIfPresent(.duree)
        id = try container.decodeIfPresent(.id)
        idCategorie = try container.decodeIfPresent(.idCategorie)
        libelle = try container.decodeIfPresent(.libelle)
        photo = try container.decodeIfPresent(.photo)
        prix = try container.decodeIfPresent(.prix)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(duree, forKey: .duree)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(idCategorie, forKey: .idCategorie)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(photo, forKey: .photo)
        try container.encodeIfPresent(prix, forKey: .prix)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRIntervention else { return false }
      guard self.description == object.description else { return false }
      guard self.duree == object.duree else { return false }
      guard self.id == object.id else { return false }
      guard self.idCategorie == object.idCategorie else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.photo == object.photo else { return false }
      guard self.prix == object.prix else { return false }
      return true
    }

    public static func == (lhs: SKRIntervention, rhs: SKRIntervention) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

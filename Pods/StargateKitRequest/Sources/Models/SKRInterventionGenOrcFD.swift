/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInterventionGenOrcFD: StargateKitModel {

    public var id: String

    public var idParent: String

    public var libelle: String

    public var description: String?

    public var duree: Int?

    public var photo: String?

    public var prix: Int?

    public init(id: String, idParent: String, libelle: String, description: String? = nil, duree: Int? = nil, photo: String? = nil, prix: Int? = nil) {
        self.id = id
        self.idParent = idParent
        self.libelle = libelle
        self.description = description
        self.duree = duree
        self.photo = photo
        self.prix = prix
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case id
        case idParent = "id_parent"
        case libelle
        case description
        case duree
        case photo
        case prix
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(.id)
        idParent = try container.decode(.idParent)
        libelle = try container.decode(.libelle)
        description = try container.decodeIfPresent(.description)
        duree = try container.decodeIfPresent(.duree)
        photo = try container.decodeIfPresent(.photo)
        prix = try container.decodeIfPresent(.prix)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(idParent, forKey: .idParent)
        try container.encode(libelle, forKey: .libelle)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(duree, forKey: .duree)
        try container.encodeIfPresent(photo, forKey: .photo)
        try container.encodeIfPresent(prix, forKey: .prix)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInterventionGenOrcFD else { return false }
      guard self.id == object.id else { return false }
      guard self.idParent == object.idParent else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.description == object.description else { return false }
      guard self.duree == object.duree else { return false }
      guard self.photo == object.photo else { return false }
      guard self.prix == object.prix else { return false }
      return true
    }

    public static func == (lhs: SKRInterventionGenOrcFD, rhs: SKRInterventionGenOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

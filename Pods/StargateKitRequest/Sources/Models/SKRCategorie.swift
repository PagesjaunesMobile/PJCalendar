/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCategorie: StargateKitModel {

    public var count: Int?

    public var description: String?

    public var duree: String?

    public var id: String?

    public var libelle: String?

    public var photo: String?

    public init(count: Int? = nil, description: String? = nil, duree: String? = nil, id: String? = nil, libelle: String? = nil, photo: String? = nil) {
        self.count = count
        self.description = description
        self.duree = duree
        self.id = id
        self.libelle = libelle
        self.photo = photo
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case count
        case description
        case duree
        case id
        case libelle
        case photo
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decodeIfPresent(.count)
        description = try container.decodeIfPresent(.description)
        duree = try container.decodeIfPresent(.duree)
        id = try container.decodeIfPresent(.id)
        libelle = try container.decodeIfPresent(.libelle)
        photo = try container.decodeIfPresent(.photo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(duree, forKey: .duree)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(photo, forKey: .photo)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCategorie else { return false }
      guard self.count == object.count else { return false }
      guard self.description == object.description else { return false }
      guard self.duree == object.duree else { return false }
      guard self.id == object.id else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.photo == object.photo else { return false }
      return true
    }

    public static func == (lhs: SKRCategorie, rhs: SKRCategorie) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

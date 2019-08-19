/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCategorieOrcFD: StargateKitModel {

    public var id: String

    public var idParent: String

    public var interventions: [SKRInterventionGenOrcFD]

    public var libelle: String

    public var description: String?

    public var photo: String?

    public init(id: String, idParent: String, interventions: [SKRInterventionGenOrcFD], libelle: String, description: String? = nil, photo: String? = nil) {
        self.id = id
        self.idParent = idParent
        self.interventions = interventions
        self.libelle = libelle
        self.description = description
        self.photo = photo
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case id
        case idParent = "id_parent"
        case interventions
        case libelle
        case description
        case photo
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(.id)
        idParent = try container.decode(.idParent)
        interventions = try container.decodeArray(.interventions)
        libelle = try container.decode(.libelle)
        description = try container.decodeIfPresent(.description)
        photo = try container.decodeIfPresent(.photo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(idParent, forKey: .idParent)
        try container.encode(interventions, forKey: .interventions)
        try container.encode(libelle, forKey: .libelle)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(photo, forKey: .photo)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCategorieOrcFD else { return false }
      guard self.id == object.id else { return false }
      guard self.idParent == object.idParent else { return false }
      guard self.interventions == object.interventions else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.description == object.description else { return false }
      guard self.photo == object.photo else { return false }
      return true
    }

    public static func == (lhs: SKRCategorieOrcFD, rhs: SKRCategorieOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

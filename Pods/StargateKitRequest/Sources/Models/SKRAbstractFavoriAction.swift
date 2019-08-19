/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAbstractFavoriAction: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case ajoutFavori = "AJOUT_FAVORI"
        case suppressionFavori = "SUPPRESSION_FAVORI"
        case ajoutGroupe = "AJOUT_GROUPE"
        case modificationGroupe = "MODIFICATION_GROUPE"
        case suppressionGroupe = "SUPPRESSION_GROUPE"
        case ajoutAssociation = "AJOUT_ASSOCIATION"
        case suppressionAssociation = "SUPPRESSION_ASSOCIATION"
    }

    public var date: DateTime?

    public var id: String?

    public var type: SKRType?

    public init(date: DateTime? = nil, id: String? = nil, type: SKRType? = nil) {
        self.date = date
        self.id = id
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case date
        case id
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        date = try container.decodeIfPresent(.date)
        id = try container.decodeIfPresent(.id)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAbstractFavoriAction else { return false }
      guard self.date == object.date else { return false }
      guard self.id == object.id else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRAbstractFavoriAction, rhs: SKRAbstractFavoriAction) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

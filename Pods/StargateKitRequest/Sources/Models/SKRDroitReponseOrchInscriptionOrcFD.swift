/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDroitReponseOrchInscriptionOrcFD: StargateKitModel {

    public var commentaire: String?

    public var dateCreation: DateTime?

    public var id: String?

    public init(commentaire: String? = nil, dateCreation: DateTime? = nil, id: String? = nil) {
        self.commentaire = commentaire
        self.dateCreation = dateCreation
        self.id = id
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case commentaire
        case dateCreation = "date_creation"
        case id
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        commentaire = try container.decodeIfPresent(.commentaire)
        dateCreation = try container.decodeIfPresent(.dateCreation)
        id = try container.decodeIfPresent(.id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(commentaire, forKey: .commentaire)
        try container.encodeIfPresent(dateCreation, forKey: .dateCreation)
        try container.encodeIfPresent(id, forKey: .id)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDroitReponseOrchInscriptionOrcFD else { return false }
      guard self.commentaire == object.commentaire else { return false }
      guard self.dateCreation == object.dateCreation else { return false }
      guard self.id == object.id else { return false }
      return true
    }

    public static func == (lhs: SKRDroitReponseOrchInscriptionOrcFD, rhs: SKRDroitReponseOrchInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

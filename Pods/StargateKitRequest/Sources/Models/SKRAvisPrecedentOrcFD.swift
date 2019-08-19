/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAvisPrecedentOrcFD: StargateKitModel {

    public var dateParution: String?

    public var nom: String?

    public var numeroAnnonce: String?

    public var numeroParution: String?

    public init(dateParution: String? = nil, nom: String? = nil, numeroAnnonce: String? = nil, numeroParution: String? = nil) {
        self.dateParution = dateParution
        self.nom = nom
        self.numeroAnnonce = numeroAnnonce
        self.numeroParution = numeroParution
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dateParution = "date_parution"
        case nom
        case numeroAnnonce = "numero_annonce"
        case numeroParution = "numero_parution"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dateParution = try container.decodeIfPresent(.dateParution)
        nom = try container.decodeIfPresent(.nom)
        numeroAnnonce = try container.decodeIfPresent(.numeroAnnonce)
        numeroParution = try container.decodeIfPresent(.numeroParution)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dateParution, forKey: .dateParution)
        try container.encodeIfPresent(nom, forKey: .nom)
        try container.encodeIfPresent(numeroAnnonce, forKey: .numeroAnnonce)
        try container.encodeIfPresent(numeroParution, forKey: .numeroParution)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAvisPrecedentOrcFD else { return false }
      guard self.dateParution == object.dateParution else { return false }
      guard self.nom == object.nom else { return false }
      guard self.numeroAnnonce == object.numeroAnnonce else { return false }
      guard self.numeroParution == object.numeroParution else { return false }
      return true
    }

    public static func == (lhs: SKRAvisPrecedentOrcFD, rhs: SKRAvisPrecedentOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

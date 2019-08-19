/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKROffreOrcAnnuaire: StargateKitModel {

    public var descriptionCourte: String?

    public var descriptionLongue: String?

    public var identifiant: String?

    public var type: String?

    public var url: String?

    public var uRLReservation: String?

    public init(descriptionCourte: String? = nil, descriptionLongue: String? = nil, identifiant: String? = nil, type: String? = nil, url: String? = nil, uRLReservation: String? = nil) {
        self.descriptionCourte = descriptionCourte
        self.descriptionLongue = descriptionLongue
        self.identifiant = identifiant
        self.type = type
        self.url = url
        self.uRLReservation = uRLReservation
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case descriptionCourte = "description_courte"
        case descriptionLongue = "description_longue"
        case identifiant
        case type
        case url
        case uRLReservation = "url_reservation"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        descriptionCourte = try container.decodeIfPresent(.descriptionCourte)
        descriptionLongue = try container.decodeIfPresent(.descriptionLongue)
        identifiant = try container.decodeIfPresent(.identifiant)
        type = try container.decodeIfPresent(.type)
        url = try container.decodeIfPresent(.url)
        uRLReservation = try container.decodeIfPresent(.uRLReservation)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(descriptionCourte, forKey: .descriptionCourte)
        try container.encodeIfPresent(descriptionLongue, forKey: .descriptionLongue)
        try container.encodeIfPresent(identifiant, forKey: .identifiant)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(uRLReservation, forKey: .uRLReservation)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKROffreOrcAnnuaire else { return false }
      guard self.descriptionCourte == object.descriptionCourte else { return false }
      guard self.descriptionLongue == object.descriptionLongue else { return false }
      guard self.identifiant == object.identifiant else { return false }
      guard self.type == object.type else { return false }
      guard self.url == object.url else { return false }
      guard self.uRLReservation == object.uRLReservation else { return false }
      return true
    }

    public static func == (lhs: SKROffreOrcAnnuaire, rhs: SKROffreOrcAnnuaire) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

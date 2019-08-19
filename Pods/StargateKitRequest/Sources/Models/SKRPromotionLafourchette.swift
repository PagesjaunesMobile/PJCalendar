/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPromotionLafourchette: StargateKitModel {

    public var description: [String]?

    public var titre: String?

    public var uRLReservation: String?

    public var uRLVisuel: String?

    public init(description: [String]? = nil, titre: String? = nil, uRLReservation: String? = nil, uRLVisuel: String? = nil) {
        self.description = description
        self.titre = titre
        self.uRLReservation = uRLReservation
        self.uRLVisuel = uRLVisuel
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case description
        case titre
        case uRLReservation = "url_reservation"
        case uRLVisuel = "url_visuel"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        description = try container.decodeArrayIfPresent(.description)
        titre = try container.decodeIfPresent(.titre)
        uRLReservation = try container.decodeIfPresent(.uRLReservation)
        uRLVisuel = try container.decodeIfPresent(.uRLVisuel)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(uRLReservation, forKey: .uRLReservation)
        try container.encodeIfPresent(uRLVisuel, forKey: .uRLVisuel)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPromotionLafourchette else { return false }
      guard self.description == object.description else { return false }
      guard self.titre == object.titre else { return false }
      guard self.uRLReservation == object.uRLReservation else { return false }
      guard self.uRLVisuel == object.uRLVisuel else { return false }
      return true
    }

    public static func == (lhs: SKRPromotionLafourchette, rhs: SKRPromotionLafourchette) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

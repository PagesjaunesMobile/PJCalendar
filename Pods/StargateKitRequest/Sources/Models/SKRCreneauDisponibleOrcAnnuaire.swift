/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCreneauDisponibleOrcAnnuaire: StargateKitModel {

    public var disponible: Bool?

    public var heure: String?

    public var offres: [SKROffreOrcAnnuaire]?

    public var url: String?

    public init(disponible: Bool? = nil, heure: String? = nil, offres: [SKROffreOrcAnnuaire]? = nil, url: String? = nil) {
        self.disponible = disponible
        self.heure = heure
        self.offres = offres
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case disponible
        case heure
        case offres
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        disponible = try container.decodeIfPresent(.disponible)
        heure = try container.decodeIfPresent(.heure)
        offres = try container.decodeArrayIfPresent(.offres)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(disponible, forKey: .disponible)
        try container.encodeIfPresent(heure, forKey: .heure)
        try container.encodeIfPresent(offres, forKey: .offres)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCreneauDisponibleOrcAnnuaire else { return false }
      guard self.disponible == object.disponible else { return false }
      guard self.heure == object.heure else { return false }
      guard self.offres == object.offres else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRCreneauDisponibleOrcAnnuaire, rhs: SKRCreneauDisponibleOrcAnnuaire) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

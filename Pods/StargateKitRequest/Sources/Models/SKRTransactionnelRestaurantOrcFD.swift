/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTransactionnelRestaurantOrcFD: StargateKitModel {

    public enum SKRPartenaire: String, Codable, Hashable, CaseIterable {
        case lafo = "LAFO"
        case crdv = "CRDV"
    }

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case restaurant = "RESTAURANT"
        case hotel = "HOTEL"
        case sante = "SANTE"
    }

    public var identifiant: String?

    public var partenaire: SKRPartenaire?

    public var type: SKRType?

    public init(identifiant: String? = nil, partenaire: SKRPartenaire? = nil, type: SKRType? = nil) {
        self.identifiant = identifiant
        self.partenaire = partenaire
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case identifiant
        case partenaire
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        identifiant = try container.decodeIfPresent(.identifiant)
        partenaire = try container.decodeIfPresent(.partenaire)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(identifiant, forKey: .identifiant)
        try container.encodeIfPresent(partenaire, forKey: .partenaire)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTransactionnelRestaurantOrcFD else { return false }
      guard self.identifiant == object.identifiant else { return false }
      guard self.partenaire == object.partenaire else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRTransactionnelRestaurantOrcFD, rhs: SKRTransactionnelRestaurantOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

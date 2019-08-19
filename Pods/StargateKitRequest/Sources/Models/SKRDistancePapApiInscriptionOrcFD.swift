/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDistancePapApiInscriptionOrcFD: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case pieton = "PIETON"
        case volOiseau = "VOL_OISEAU"
    }

    public enum SKRUnite: String, Codable, Hashable, CaseIterable {
        case metre = "METRE"
        case minute = "MINUTE"
    }

    public var distance: Int?

    public var type: SKRType?

    public var unite: SKRUnite?

    public var valeur: Int?

    public init(distance: Int? = nil, type: SKRType? = nil, unite: SKRUnite? = nil, valeur: Int? = nil) {
        self.distance = distance
        self.type = type
        self.unite = unite
        self.valeur = valeur
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case distance
        case type
        case unite
        case valeur
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        distance = try container.decodeIfPresent(.distance)
        type = try container.decodeIfPresent(.type)
        unite = try container.decodeIfPresent(.unite)
        valeur = try container.decodeIfPresent(.valeur)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(distance, forKey: .distance)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(unite, forKey: .unite)
        try container.encodeIfPresent(valeur, forKey: .valeur)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDistancePapApiInscriptionOrcFD else { return false }
      guard self.distance == object.distance else { return false }
      guard self.type == object.type else { return false }
      guard self.unite == object.unite else { return false }
      guard self.valeur == object.valeur else { return false }
      return true
    }

    public static func == (lhs: SKRDistancePapApiInscriptionOrcFD, rhs: SKRDistancePapApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

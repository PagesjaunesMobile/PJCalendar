/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRChampComplementaire: StargateKitModel {

    public var nom: String

    public var valeur: String?

    public init(nom: String, valeur: String? = nil) {
        self.nom = nom
        self.valeur = valeur
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nom
        case valeur
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nom = try container.decode(.nom)
        valeur = try container.decodeIfPresent(.valeur)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(nom, forKey: .nom)
        try container.encodeIfPresent(valeur, forKey: .valeur)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRChampComplementaire else { return false }
      guard self.nom == object.nom else { return false }
      guard self.valeur == object.valeur else { return false }
      return true
    }

    public static func == (lhs: SKRChampComplementaire, rhs: SKRChampComplementaire) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

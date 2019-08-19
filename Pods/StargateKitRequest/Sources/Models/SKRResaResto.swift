/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResaResto: StargateKitModel {

    public var dateHeure: String?

    public var label: String?

    public var nbPersonnes: String?

    public init(dateHeure: String? = nil, label: String? = nil, nbPersonnes: String? = nil) {
        self.dateHeure = dateHeure
        self.label = label
        self.nbPersonnes = nbPersonnes
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dateHeure
        case label
        case nbPersonnes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dateHeure = try container.decodeIfPresent(.dateHeure)
        label = try container.decodeIfPresent(.label)
        nbPersonnes = try container.decodeIfPresent(.nbPersonnes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dateHeure, forKey: .dateHeure)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(nbPersonnes, forKey: .nbPersonnes)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResaResto else { return false }
      guard self.dateHeure == object.dateHeure else { return false }
      guard self.label == object.label else { return false }
      guard self.nbPersonnes == object.nbPersonnes else { return false }
      return true
    }

    public static func == (lhs: SKRResaResto, rhs: SKRResaResto) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

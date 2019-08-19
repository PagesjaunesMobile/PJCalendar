/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFilActualiteOrcFD: StargateKitModel {

    public var derniereActualite: SKRActualite?

    public var nbActualites: Int?

    public init(derniereActualite: SKRActualite? = nil, nbActualites: Int? = nil) {
        self.derniereActualite = derniereActualite
        self.nbActualites = nbActualites
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case derniereActualite = "derniere_actualite"
        case nbActualites = "nb_actualites"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        derniereActualite = try container.decodeIfPresent(.derniereActualite)
        nbActualites = try container.decodeIfPresent(.nbActualites)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(derniereActualite, forKey: .derniereActualite)
        try container.encodeIfPresent(nbActualites, forKey: .nbActualites)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFilActualiteOrcFD else { return false }
      guard self.derniereActualite == object.derniereActualite else { return false }
      guard self.nbActualites == object.nbActualites else { return false }
      return true
    }

    public static func == (lhs: SKRFilActualiteOrcFD, rhs: SKRFilActualiteOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

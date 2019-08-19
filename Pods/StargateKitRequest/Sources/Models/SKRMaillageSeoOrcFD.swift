/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMaillageSeoOrcFD: StargateKitModel {

    public var lienVille: SKRUrlSEOOrcFD?

    public var liensActiviteVille: [SKRUrlSEOOrcFD]?

    public var liensEnseignes: [SKRUrlSEOOrcFD]?

    public init(lienVille: SKRUrlSEOOrcFD? = nil, liensActiviteVille: [SKRUrlSEOOrcFD]? = nil, liensEnseignes: [SKRUrlSEOOrcFD]? = nil) {
        self.lienVille = lienVille
        self.liensActiviteVille = liensActiviteVille
        self.liensEnseignes = liensEnseignes
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case lienVille = "lien_ville"
        case liensActiviteVille = "liens_activite_ville"
        case liensEnseignes = "liens_enseignes"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        lienVille = try container.decodeIfPresent(.lienVille)
        liensActiviteVille = try container.decodeArrayIfPresent(.liensActiviteVille)
        liensEnseignes = try container.decodeArrayIfPresent(.liensEnseignes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(lienVille, forKey: .lienVille)
        try container.encodeIfPresent(liensActiviteVille, forKey: .liensActiviteVille)
        try container.encodeIfPresent(liensEnseignes, forKey: .liensEnseignes)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMaillageSeoOrcFD else { return false }
      guard self.lienVille == object.lienVille else { return false }
      guard self.liensActiviteVille == object.liensActiviteVille else { return false }
      guard self.liensEnseignes == object.liensEnseignes else { return false }
      return true
    }

    public static func == (lhs: SKRMaillageSeoOrcFD, rhs: SKRMaillageSeoOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

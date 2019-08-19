/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRubriqueOrchInscriptionOrcFD: StargateKitModel {

    public var libelle: String?

    public init(libelle: String? = nil) {
        self.libelle = libelle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case libelle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        libelle = try container.decodeIfPresent(.libelle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(libelle, forKey: .libelle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRubriqueOrchInscriptionOrcFD else { return false }
      guard self.libelle == object.libelle else { return false }
      return true
    }

    public static func == (lhs: SKRRubriqueOrchInscriptionOrcFD, rhs: SKRRubriqueOrchInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

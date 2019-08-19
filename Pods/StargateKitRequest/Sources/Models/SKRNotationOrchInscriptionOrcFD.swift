/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRNotationOrchInscriptionOrcFD: StargateKitModel {

    public var libelleCritere: String?

    public var note: Int?

    public init(libelleCritere: String? = nil, note: Int? = nil) {
        self.libelleCritere = libelleCritere
        self.note = note
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case libelleCritere = "libelle_critere"
        case note
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        libelleCritere = try container.decodeIfPresent(.libelleCritere)
        note = try container.decodeIfPresent(.note)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(libelleCritere, forKey: .libelleCritere)
        try container.encodeIfPresent(note, forKey: .note)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRNotationOrchInscriptionOrcFD else { return false }
      guard self.libelleCritere == object.libelleCritere else { return false }
      guard self.note == object.note else { return false }
      return true
    }

    public static func == (lhs: SKRNotationOrchInscriptionOrcFD, rhs: SKRNotationOrchInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

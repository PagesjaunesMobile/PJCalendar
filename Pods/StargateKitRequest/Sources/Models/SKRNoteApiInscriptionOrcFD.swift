/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRNoteApiInscriptionOrcFD: StargateKitModel {

    public var codeCritere: String?

    public var libelleCritere: String?

    public var note: Int?

    public init(codeCritere: String? = nil, libelleCritere: String? = nil, note: Int? = nil) {
        self.codeCritere = codeCritere
        self.libelleCritere = libelleCritere
        self.note = note
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case codeCritere = "code_critere"
        case libelleCritere = "libelle_critere"
        case note
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        codeCritere = try container.decodeIfPresent(.codeCritere)
        libelleCritere = try container.decodeIfPresent(.libelleCritere)
        note = try container.decodeIfPresent(.note)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(codeCritere, forKey: .codeCritere)
        try container.encodeIfPresent(libelleCritere, forKey: .libelleCritere)
        try container.encodeIfPresent(note, forKey: .note)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRNoteApiInscriptionOrcFD else { return false }
      guard self.codeCritere == object.codeCritere else { return false }
      guard self.libelleCritere == object.libelleCritere else { return false }
      guard self.note == object.note else { return false }
      return true
    }

    public static func == (lhs: SKRNoteApiInscriptionOrcFD, rhs: SKRNoteApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

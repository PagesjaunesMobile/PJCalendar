/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContactMailOrcFD: StargateKitModel {

    public var email: String?

    public var index: Int?

    public var libelle: String?

    public init(email: String? = nil, index: Int? = nil, libelle: String? = nil) {
        self.email = email
        self.index = index
        self.libelle = libelle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case email
        case index
        case libelle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        email = try container.decodeIfPresent(.email)
        index = try container.decodeIfPresent(.index)
        libelle = try container.decodeIfPresent(.libelle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(index, forKey: .index)
        try container.encodeIfPresent(libelle, forKey: .libelle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContactMailOrcFD else { return false }
      guard self.email == object.email else { return false }
      guard self.index == object.index else { return false }
      guard self.libelle == object.libelle else { return false }
      return true
    }

    public static func == (lhs: SKRContactMailOrcFD, rhs: SKRContactMailOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

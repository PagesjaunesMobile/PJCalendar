/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResume: StargateKitModel {

    public var lib: String?

    public var pos: String?

    public var type: String?

    public var valeur: String?

    public init(lib: String? = nil, pos: String? = nil, type: String? = nil, valeur: String? = nil) {
        self.lib = lib
        self.pos = pos
        self.type = type
        self.valeur = valeur
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case lib
        case pos
        case type
        case valeur
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        lib = try container.decodeIfPresent(.lib)
        pos = try container.decodeIfPresent(.pos)
        type = try container.decodeIfPresent(.type)
        valeur = try container.decodeIfPresent(.valeur)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(lib, forKey: .lib)
        try container.encodeIfPresent(pos, forKey: .pos)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(valeur, forKey: .valeur)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResume else { return false }
      guard self.lib == object.lib else { return false }
      guard self.pos == object.pos else { return false }
      guard self.type == object.type else { return false }
      guard self.valeur == object.valeur else { return false }
      return true
    }

    public static func == (lhs: SKRResume, rhs: SKRResume) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

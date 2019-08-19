/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRYes: StargateKitModel {

    public var acts: [SKRActs]?

    public var comp: String?

    public var crit: [SKRCrit]?

    public var mode: String?

    public var motsFaibles: String?

    public var ogr: Bool?

    public var quiInsecable: Bool?

    public var type: String?

    public var typeOrigine: String?

    public var val: String?

    public init(acts: [SKRActs]? = nil, comp: String? = nil, crit: [SKRCrit]? = nil, mode: String? = nil, motsFaibles: String? = nil, ogr: Bool? = nil, quiInsecable: Bool? = nil, type: String? = nil, typeOrigine: String? = nil, val: String? = nil) {
        self.acts = acts
        self.comp = comp
        self.crit = crit
        self.mode = mode
        self.motsFaibles = motsFaibles
        self.ogr = ogr
        self.quiInsecable = quiInsecable
        self.type = type
        self.typeOrigine = typeOrigine
        self.val = val
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case acts
        case comp
        case crit
        case mode
        case motsFaibles
        case ogr
        case quiInsecable
        case type
        case typeOrigine
        case val
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        acts = try container.decodeArrayIfPresent(.acts)
        comp = try container.decodeIfPresent(.comp)
        crit = try container.decodeArrayIfPresent(.crit)
        mode = try container.decodeIfPresent(.mode)
        motsFaibles = try container.decodeIfPresent(.motsFaibles)
        ogr = try container.decodeIfPresent(.ogr)
        quiInsecable = try container.decodeIfPresent(.quiInsecable)
        type = try container.decodeIfPresent(.type)
        typeOrigine = try container.decodeIfPresent(.typeOrigine)
        val = try container.decodeIfPresent(.val)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(acts, forKey: .acts)
        try container.encodeIfPresent(comp, forKey: .comp)
        try container.encodeIfPresent(crit, forKey: .crit)
        try container.encodeIfPresent(mode, forKey: .mode)
        try container.encodeIfPresent(motsFaibles, forKey: .motsFaibles)
        try container.encodeIfPresent(ogr, forKey: .ogr)
        try container.encodeIfPresent(quiInsecable, forKey: .quiInsecable)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(typeOrigine, forKey: .typeOrigine)
        try container.encodeIfPresent(val, forKey: .val)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRYes else { return false }
      guard self.acts == object.acts else { return false }
      guard self.comp == object.comp else { return false }
      guard self.crit == object.crit else { return false }
      guard self.mode == object.mode else { return false }
      guard self.motsFaibles == object.motsFaibles else { return false }
      guard self.ogr == object.ogr else { return false }
      guard self.quiInsecable == object.quiInsecable else { return false }
      guard self.type == object.type else { return false }
      guard self.typeOrigine == object.typeOrigine else { return false }
      guard self.val == object.val else { return false }
      return true
    }

    public static func == (lhs: SKRYes, rhs: SKRYes) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

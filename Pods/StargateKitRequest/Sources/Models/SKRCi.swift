/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCi: StargateKitModel {

    public var c: String?

    public var g: String?

    public var l: String?

    public var p: String?

    public var quiquoiModifie: String?

    public var r: String?

    public var s: String?

    public var t: String?

    public init(c: String? = nil, g: String? = nil, l: String? = nil, p: String? = nil, quiquoiModifie: String? = nil, r: String? = nil, s: String? = nil, t: String? = nil) {
        self.c = c
        self.g = g
        self.l = l
        self.p = p
        self.quiquoiModifie = quiquoiModifie
        self.r = r
        self.s = s
        self.t = t
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case c
        case g
        case l
        case p
        case quiquoiModifie
        case r
        case s
        case t
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        c = try container.decodeIfPresent(.c)
        g = try container.decodeIfPresent(.g)
        l = try container.decodeIfPresent(.l)
        p = try container.decodeIfPresent(.p)
        quiquoiModifie = try container.decodeIfPresent(.quiquoiModifie)
        r = try container.decodeIfPresent(.r)
        s = try container.decodeIfPresent(.s)
        t = try container.decodeIfPresent(.t)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(c, forKey: .c)
        try container.encodeIfPresent(g, forKey: .g)
        try container.encodeIfPresent(l, forKey: .l)
        try container.encodeIfPresent(p, forKey: .p)
        try container.encodeIfPresent(quiquoiModifie, forKey: .quiquoiModifie)
        try container.encodeIfPresent(r, forKey: .r)
        try container.encodeIfPresent(s, forKey: .s)
        try container.encodeIfPresent(t, forKey: .t)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCi else { return false }
      guard self.c == object.c else { return false }
      guard self.g == object.g else { return false }
      guard self.l == object.l else { return false }
      guard self.p == object.p else { return false }
      guard self.quiquoiModifie == object.quiquoiModifie else { return false }
      guard self.r == object.r else { return false }
      guard self.s == object.s else { return false }
      guard self.t == object.t else { return false }
      return true
    }

    public static func == (lhs: SKRCi, rhs: SKRCi) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

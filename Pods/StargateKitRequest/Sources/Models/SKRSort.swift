/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSort: StargateKitModel {

    public var active: Bool?

    public var code: String?

    public var lib: String?

    public var select: Bool?

    public var slib: String?

    public init(active: Bool? = nil, code: String? = nil, lib: String? = nil, select: Bool? = nil, slib: String? = nil) {
        self.active = active
        self.code = code
        self.lib = lib
        self.select = select
        self.slib = slib
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case active
        case code
        case lib
        case select
        case slib
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        active = try container.decodeIfPresent(.active)
        code = try container.decodeIfPresent(.code)
        lib = try container.decodeIfPresent(.lib)
        select = try container.decodeIfPresent(.select)
        slib = try container.decodeIfPresent(.slib)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(active, forKey: .active)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(lib, forKey: .lib)
        try container.encodeIfPresent(select, forKey: .select)
        try container.encodeIfPresent(slib, forKey: .slib)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSort else { return false }
      guard self.active == object.active else { return false }
      guard self.code == object.code else { return false }
      guard self.lib == object.lib else { return false }
      guard self.select == object.select else { return false }
      guard self.slib == object.slib else { return false }
      return true
    }

    public static func == (lhs: SKRSort, rhs: SKRSort) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

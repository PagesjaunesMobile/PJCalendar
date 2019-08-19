/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSortContributif: StargateKitModel {

    public var code: String?

    public var lib: String?

    public var select: Bool?

    public init(code: String? = nil, lib: String? = nil, select: Bool? = nil) {
        self.code = code
        self.lib = lib
        self.select = select
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case lib
        case select
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        lib = try container.decodeIfPresent(.lib)
        select = try container.decodeIfPresent(.select)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(lib, forKey: .lib)
        try container.encodeIfPresent(select, forKey: .select)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSortContributif else { return false }
      guard self.code == object.code else { return false }
      guard self.lib == object.lib else { return false }
      guard self.select == object.select else { return false }
      return true
    }

    public static func == (lhs: SKRSortContributif, rhs: SKRSortContributif) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

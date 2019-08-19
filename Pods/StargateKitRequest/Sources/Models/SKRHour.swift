/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRHour: StargateKitModel {

    public var hcode: String?

    public var htext: String?

    public init(hcode: String? = nil, htext: String? = nil) {
        self.hcode = hcode
        self.htext = htext
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case hcode
        case htext
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        hcode = try container.decodeIfPresent(.hcode)
        htext = try container.decodeIfPresent(.htext)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(hcode, forKey: .hcode)
        try container.encodeIfPresent(htext, forKey: .htext)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRHour else { return false }
      guard self.hcode == object.hcode else { return false }
      guard self.htext == object.htext else { return false }
      return true
    }

    public static func == (lhs: SKRHour, rhs: SKRHour) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

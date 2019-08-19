/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRZoneContextuelle: StargateKitModel {

    public var cs: [SKRChampStructure]?

    public init(cs: [SKRChampStructure]? = nil) {
        self.cs = cs
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case cs
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        cs = try container.decodeArrayIfPresent(.cs)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(cs, forKey: .cs)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRZoneContextuelle else { return false }
      guard self.cs == object.cs else { return false }
      return true
    }

    public static func == (lhs: SKRZoneContextuelle, rhs: SKRZoneContextuelle) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

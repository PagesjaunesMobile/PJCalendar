/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRChampsFiche: StargateKitModel {

    public var champ: [SKRChamp]?

    public init(champ: [SKRChamp]? = nil) {
        self.champ = champ
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case champ
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        champ = try container.decodeArrayIfPresent(.champ)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(champ, forKey: .champ)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRChampsFiche else { return false }
      guard self.champ == object.champ else { return false }
      return true
    }

    public static func == (lhs: SKRChampsFiche, rhs: SKRChampsFiche) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

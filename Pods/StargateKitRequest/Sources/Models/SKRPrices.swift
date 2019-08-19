/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPrices: StargateKitModel {

    public var infoX: [SKRInfo]

    public init(infoX: [SKRInfo]) {
        self.infoX = infoX
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case infoX
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        infoX = try container.decodeArray(.infoX)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(infoX, forKey: .infoX)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPrices else { return false }
      guard self.infoX == object.infoX else { return false }
      return true
    }

    public static func == (lhs: SKRPrices, rhs: SKRPrices) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

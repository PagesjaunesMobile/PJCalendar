/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTarifSanteOrcFD: StargateKitModel {

    public var base: Double?

    public var max: Double?

    public var min: Double?

    public init(base: Double? = nil, max: Double? = nil, min: Double? = nil) {
        self.base = base
        self.max = max
        self.min = min
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case base
        case max
        case min
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        base = try container.decodeIfPresent(.base)
        max = try container.decodeIfPresent(.max)
        min = try container.decodeIfPresent(.min)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(base, forKey: .base)
        try container.encodeIfPresent(max, forKey: .max)
        try container.encodeIfPresent(min, forKey: .min)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTarifSanteOrcFD else { return false }
      guard self.base == object.base else { return false }
      guard self.max == object.max else { return false }
      guard self.min == object.min else { return false }
      return true
    }

    public static func == (lhs: SKRTarifSanteOrcFD, rhs: SKRTarifSanteOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

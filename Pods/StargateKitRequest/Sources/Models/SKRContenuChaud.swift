/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContenuChaud: StargateKitModel {

    public var omColor: String?

    public var omLabel: String?

    public init(omColor: String? = nil, omLabel: String? = nil) {
        self.omColor = omColor
        self.omLabel = omLabel
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case omColor
        case omLabel
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        omColor = try container.decodeIfPresent(.omColor)
        omLabel = try container.decodeIfPresent(.omLabel)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(omColor, forKey: .omColor)
        try container.encodeIfPresent(omLabel, forKey: .omLabel)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContenuChaud else { return false }
      guard self.omColor == object.omColor else { return false }
      guard self.omLabel == object.omLabel else { return false }
      return true
    }

    public static func == (lhs: SKRContenuChaud, rhs: SKRContenuChaud) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

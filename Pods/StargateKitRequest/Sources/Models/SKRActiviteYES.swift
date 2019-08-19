/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRActiviteYES: StargateKitModel {

    public var actCode: String?

    public init(actCode: String? = nil) {
        self.actCode = actCode
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actCode
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actCode = try container.decodeIfPresent(.actCode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actCode, forKey: .actCode)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRActiviteYES else { return false }
      guard self.actCode == object.actCode else { return false }
      return true
    }

    public static func == (lhs: SKRActiviteYES, rhs: SKRActiviteYES) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

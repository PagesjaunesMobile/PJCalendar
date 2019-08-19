/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLstDispParam: StargateKitModel {

    public var dispParam: [SKRDispParam]?

    public init(dispParam: [SKRDispParam]? = nil) {
        self.dispParam = dispParam
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dispParam
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dispParam = try container.decodeArrayIfPresent(.dispParam)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dispParam, forKey: .dispParam)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLstDispParam else { return false }
      guard self.dispParam == object.dispParam else { return false }
      return true
    }

    public static func == (lhs: SKRLstDispParam, rhs: SKRLstDispParam) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

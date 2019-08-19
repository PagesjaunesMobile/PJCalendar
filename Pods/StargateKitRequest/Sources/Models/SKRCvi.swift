/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCvi: StargateKitModel {

    public var cviElement: [SKRCviElement]?

    public var type: String?

    public init(cviElement: [SKRCviElement]? = nil, type: String? = nil) {
        self.cviElement = cviElement
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case cviElement
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        cviElement = try container.decodeArrayIfPresent(.cviElement)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(cviElement, forKey: .cviElement)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCvi else { return false }
      guard self.cviElement == object.cviElement else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRCvi, rhs: SKRCvi) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

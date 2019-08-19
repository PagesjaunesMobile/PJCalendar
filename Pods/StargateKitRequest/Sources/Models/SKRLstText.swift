/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLstText: StargateKitModel {

    public var text: [SKRText]?

    public init(text: [SKRText]? = nil) {
        self.text = text
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        text = try container.decodeArrayIfPresent(.text)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(text, forKey: .text)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLstText else { return false }
      guard self.text == object.text else { return false }
      return true
    }

    public static func == (lhs: SKRLstText, rhs: SKRLstText) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

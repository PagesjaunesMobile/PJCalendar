/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLstVisual: StargateKitModel {

    public var visual: [SKRVisual]?

    public init(visual: [SKRVisual]? = nil) {
        self.visual = visual
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case visual
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        visual = try container.decodeArrayIfPresent(.visual)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(visual, forKey: .visual)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLstVisual else { return false }
      guard self.visual == object.visual else { return false }
      return true
    }

    public static func == (lhs: SKRLstVisual, rhs: SKRLstVisual) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMenuLR: StargateKitModel {

    public var card: SKRCard?

    public var formules: SKRFormules?

    public init(card: SKRCard? = nil, formules: SKRFormules? = nil) {
        self.card = card
        self.formules = formules
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case card
        case formules
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        card = try container.decodeIfPresent(.card)
        formules = try container.decodeIfPresent(.formules)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(card, forKey: .card)
        try container.encodeIfPresent(formules, forKey: .formules)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMenuLR else { return false }
      guard self.card == object.card else { return false }
      guard self.formules == object.formules else { return false }
      return true
    }

    public static func == (lhs: SKRMenuLR, rhs: SKRMenuLR) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

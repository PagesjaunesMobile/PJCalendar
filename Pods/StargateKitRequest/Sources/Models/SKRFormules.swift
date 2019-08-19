/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFormules: StargateKitModel {

    public var formule: [SKRFormule]

    public init(formule: [SKRFormule]) {
        self.formule = formule
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case formule
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        formule = try container.decodeArray(.formule)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(formule, forKey: .formule)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFormules else { return false }
      guard self.formule == object.formule else { return false }
      return true
    }

    public static func == (lhs: SKRFormules, rhs: SKRFormules) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

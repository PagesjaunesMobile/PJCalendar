/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAck: StargateKitModel {

    public var idAction: String?

    public init(idAction: String? = nil) {
        self.idAction = idAction
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case idAction = "id_action"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        idAction = try container.decodeIfPresent(.idAction)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(idAction, forKey: .idAction)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAck else { return false }
      guard self.idAction == object.idAction else { return false }
      return true
    }

    public static func == (lhs: SKRAck, rhs: SKRAck) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

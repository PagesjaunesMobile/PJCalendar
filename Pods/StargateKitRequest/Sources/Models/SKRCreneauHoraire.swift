/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCreneauHoraire: StargateKitModel {

    public var label: String

    public var bo: Int?

    public var sep: String?

    public init(label: String, bo: Int? = nil, sep: String? = nil) {
        self.label = label
        self.bo = bo
        self.sep = sep
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case bo
        case sep
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decode(.label)
        bo = try container.decodeIfPresent(.bo)
        sep = try container.decodeIfPresent(.sep)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(label, forKey: .label)
        try container.encodeIfPresent(bo, forKey: .bo)
        try container.encodeIfPresent(sep, forKey: .sep)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCreneauHoraire else { return false }
      guard self.label == object.label else { return false }
      guard self.bo == object.bo else { return false }
      guard self.sep == object.sep else { return false }
      return true
    }

    public static func == (lhs: SKRCreneauHoraire, rhs: SKRCreneauHoraire) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

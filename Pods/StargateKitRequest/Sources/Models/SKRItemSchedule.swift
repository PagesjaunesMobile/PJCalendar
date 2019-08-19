/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRItemSchedule: StargateKitModel {

    public var bo: Int?

    public var creneau: [SKRCreneauHoraire]?

    public var label: String?

    public init(bo: Int? = nil, creneau: [SKRCreneauHoraire]? = nil, label: String? = nil) {
        self.bo = bo
        self.creneau = creneau
        self.label = label
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case bo
        case creneau
        case label
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        bo = try container.decodeIfPresent(.bo)
        creneau = try container.decodeArrayIfPresent(.creneau)
        label = try container.decodeIfPresent(.label)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(bo, forKey: .bo)
        try container.encodeIfPresent(creneau, forKey: .creneau)
        try container.encodeIfPresent(label, forKey: .label)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRItemSchedule else { return false }
      guard self.bo == object.bo else { return false }
      guard self.creneau == object.creneau else { return false }
      guard self.label == object.label else { return false }
      return true
    }

    public static func == (lhs: SKRItemSchedule, rhs: SKRItemSchedule) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

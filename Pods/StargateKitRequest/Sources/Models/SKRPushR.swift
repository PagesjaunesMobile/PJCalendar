/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPushR: StargateKitModel {

    public var label: String?

    public var mnemo: String?

    public var timing: String?

    public var timingAction: String?

    public var timingLimit: String?

    public init(label: String? = nil, mnemo: String? = nil, timing: String? = nil, timingAction: String? = nil, timingLimit: String? = nil) {
        self.label = label
        self.mnemo = mnemo
        self.timing = timing
        self.timingAction = timingAction
        self.timingLimit = timingLimit
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case mnemo
        case timing
        case timingAction
        case timingLimit
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        mnemo = try container.decodeIfPresent(.mnemo)
        timing = try container.decodeIfPresent(.timing)
        timingAction = try container.decodeIfPresent(.timingAction)
        timingLimit = try container.decodeIfPresent(.timingLimit)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(mnemo, forKey: .mnemo)
        try container.encodeIfPresent(timing, forKey: .timing)
        try container.encodeIfPresent(timingAction, forKey: .timingAction)
        try container.encodeIfPresent(timingLimit, forKey: .timingLimit)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPushR else { return false }
      guard self.label == object.label else { return false }
      guard self.mnemo == object.mnemo else { return false }
      guard self.timing == object.timing else { return false }
      guard self.timingAction == object.timingAction else { return false }
      guard self.timingLimit == object.timingLimit else { return false }
      return true
    }

    public static func == (lhs: SKRPushR, rhs: SKRPushR) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

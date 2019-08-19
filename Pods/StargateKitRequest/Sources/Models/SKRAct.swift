/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAct: StargateKitModel {

    public var actCode: String?

    public var label: String?

    public var segLabel: String?

    public init(actCode: String? = nil, label: String? = nil, segLabel: String? = nil) {
        self.actCode = actCode
        self.label = label
        self.segLabel = segLabel
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actCode
        case label
        case segLabel
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actCode = try container.decodeIfPresent(.actCode)
        label = try container.decodeIfPresent(.label)
        segLabel = try container.decodeIfPresent(.segLabel)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actCode, forKey: .actCode)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(segLabel, forKey: .segLabel)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAct else { return false }
      guard self.actCode == object.actCode else { return false }
      guard self.label == object.label else { return false }
      guard self.segLabel == object.segLabel else { return false }
      return true
    }

    public static func == (lhs: SKRAct, rhs: SKRAct) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDvGroup: StargateKitModel {

    public var dvData: [String]?

    public var label: String?

    public init(dvData: [String]? = nil, label: String? = nil) {
        self.dvData = dvData
        self.label = label
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dvData
        case label
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dvData = try container.decodeArrayIfPresent(.dvData)
        label = try container.decodeIfPresent(.label)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dvData, forKey: .dvData)
        try container.encodeIfPresent(label, forKey: .label)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDvGroup else { return false }
      guard self.dvData == object.dvData else { return false }
      guard self.label == object.label else { return false }
      return true
    }

    public static func == (lhs: SKRDvGroup, rhs: SKRDvGroup) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

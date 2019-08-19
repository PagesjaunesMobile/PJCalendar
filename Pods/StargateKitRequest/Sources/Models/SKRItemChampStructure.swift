/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRItemChampStructure: StargateKitModel {

    public var gr: Int?

    public var hl: Int?

    public var value: String?

    public init(gr: Int? = nil, hl: Int? = nil, value: String? = nil) {
        self.gr = gr
        self.hl = hl
        self.value = value
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case gr
        case hl
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        gr = try container.decodeIfPresent(.gr)
        hl = try container.decodeIfPresent(.hl)
        value = try container.decodeIfPresent(.value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(gr, forKey: .gr)
        try container.encodeIfPresent(hl, forKey: .hl)
        try container.encodeIfPresent(value, forKey: .value)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRItemChampStructure else { return false }
      guard self.gr == object.gr else { return false }
      guard self.hl == object.hl else { return false }
      guard self.value == object.value else { return false }
      return true
    }

    public static func == (lhs: SKRItemChampStructure, rhs: SKRItemChampStructure) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

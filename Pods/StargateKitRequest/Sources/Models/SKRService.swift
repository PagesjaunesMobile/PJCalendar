/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRService: StargateKitModel {

    public var etabCode: String?

    public var id: String?

    public var label: String?

    public var ref: String?

    public init(etabCode: String? = nil, id: String? = nil, label: String? = nil, ref: String? = nil) {
        self.etabCode = etabCode
        self.id = id
        self.label = label
        self.ref = ref
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case etabCode = "etab_code"
        case id
        case label
        case ref
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        etabCode = try container.decodeIfPresent(.etabCode)
        id = try container.decodeIfPresent(.id)
        label = try container.decodeIfPresent(.label)
        ref = try container.decodeIfPresent(.ref)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(etabCode, forKey: .etabCode)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(ref, forKey: .ref)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRService else { return false }
      guard self.etabCode == object.etabCode else { return false }
      guard self.id == object.id else { return false }
      guard self.label == object.label else { return false }
      guard self.ref == object.ref else { return false }
      return true
    }

    public static func == (lhs: SKRService, rhs: SKRService) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

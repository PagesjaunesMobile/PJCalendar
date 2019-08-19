/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREmail: StargateKitModel {

    public var address: String?

    public var dl: String?

    public var type: String?

    public init(address: String? = nil, dl: String? = nil, type: String? = nil) {
        self.address = address
        self.dl = dl
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case address
        case dl
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        address = try container.decodeIfPresent(.address)
        dl = try container.decodeIfPresent(.dl)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(dl, forKey: .dl)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREmail else { return false }
      guard self.address == object.address else { return false }
      guard self.dl == object.dl else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKREmail, rhs: SKREmail) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

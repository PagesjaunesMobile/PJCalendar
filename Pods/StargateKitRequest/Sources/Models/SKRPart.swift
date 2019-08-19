/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPart: StargateKitModel {

    public var desc: String?

    public var id: String?

    public var lien: [SKRLienLR]?

    public init(desc: String? = nil, id: String? = nil, lien: [SKRLienLR]? = nil) {
        self.desc = desc
        self.id = id
        self.lien = lien
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case desc
        case id
        case lien
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        desc = try container.decodeIfPresent(.desc)
        id = try container.decodeIfPresent(.id)
        lien = try container.decodeArrayIfPresent(.lien)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(desc, forKey: .desc)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(lien, forKey: .lien)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPart else { return false }
      guard self.desc == object.desc else { return false }
      guard self.id == object.id else { return false }
      guard self.lien == object.lien else { return false }
      return true
    }

    public static func == (lhs: SKRPart, rhs: SKRPart) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

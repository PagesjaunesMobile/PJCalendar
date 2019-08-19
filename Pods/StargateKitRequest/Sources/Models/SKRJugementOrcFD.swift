/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRJugementOrcFD: StargateKitModel {

    public var complement: String?

    public var date: String?

    public var famille: String?

    public var nature: String?

    public init(complement: String? = nil, date: String? = nil, famille: String? = nil, nature: String? = nil) {
        self.complement = complement
        self.date = date
        self.famille = famille
        self.nature = nature
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case complement
        case date
        case famille
        case nature
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        complement = try container.decodeIfPresent(.complement)
        date = try container.decodeIfPresent(.date)
        famille = try container.decodeIfPresent(.famille)
        nature = try container.decodeIfPresent(.nature)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(complement, forKey: .complement)
        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(famille, forKey: .famille)
        try container.encodeIfPresent(nature, forKey: .nature)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRJugementOrcFD else { return false }
      guard self.complement == object.complement else { return false }
      guard self.date == object.date else { return false }
      guard self.famille == object.famille else { return false }
      guard self.nature == object.nature else { return false }
      return true
    }

    public static func == (lhs: SKRJugementOrcFD, rhs: SKRJugementOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

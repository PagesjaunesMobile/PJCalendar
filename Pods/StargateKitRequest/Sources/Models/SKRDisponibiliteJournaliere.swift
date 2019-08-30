/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDisponibiliteJournaliere: StargateKitModel {

    public var dcode: String?

    public var dtext: String?

    public var hours: [SKRHour]?

    public init(dcode: String? = nil, dtext: String? = nil, hours: [SKRHour]? = nil) {
        self.dcode = dcode
        self.dtext = dtext
        self.hours = hours
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dcode
        case dtext
        case hours
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dcode = try container.decodeIfPresent(.dcode)
        dtext = try container.decodeIfPresent(.dtext)
        hours = try container.decodeArrayIfPresent(.hours)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dcode, forKey: .dcode)
        try container.encodeIfPresent(dtext, forKey: .dtext)
        try container.encodeIfPresent(hours, forKey: .hours)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDisponibiliteJournaliere else { return false }
      guard self.dcode == object.dcode else { return false }
      guard self.dtext == object.dtext else { return false }
      guard self.hours == object.hours else { return false }
      return true
    }

    public static func == (lhs: SKRDisponibiliteJournaliere, rhs: SKRDisponibiliteJournaliere) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

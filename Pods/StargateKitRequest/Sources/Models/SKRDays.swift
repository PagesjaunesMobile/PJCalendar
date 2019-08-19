/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDays: StargateKitModel {

    public var day: [SKRDisponibiliteJournaliere]?

    public var stitle: String?

    public init(day: [SKRDisponibiliteJournaliere]? = nil, stitle: String? = nil) {
        self.day = day
        self.stitle = stitle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case day
        case stitle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        day = try container.decodeArrayIfPresent(.day)
        stitle = try container.decodeIfPresent(.stitle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(day, forKey: .day)
        try container.encodeIfPresent(stitle, forKey: .stitle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDays else { return false }
      guard self.day == object.day else { return false }
      guard self.stitle == object.stitle else { return false }
      return true
    }

    public static func == (lhs: SKRDays, rhs: SKRDays) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

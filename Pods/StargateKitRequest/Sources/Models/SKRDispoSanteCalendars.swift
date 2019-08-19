/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDispoSanteCalendars: StargateKitModel {

    public var calendar: [SKRItemTransac]?

    public var stitle: String?

    public init(calendar: [SKRItemTransac]? = nil, stitle: String? = nil) {
        self.calendar = calendar
        self.stitle = stitle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case calendar
        case stitle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        calendar = try container.decodeArrayIfPresent(.calendar)
        stitle = try container.decodeIfPresent(.stitle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(calendar, forKey: .calendar)
        try container.encodeIfPresent(stitle, forKey: .stitle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDispoSanteCalendars else { return false }
      guard self.calendar == object.calendar else { return false }
      guard self.stitle == object.stitle else { return false }
      return true
    }

    public static func == (lhs: SKRDispoSanteCalendars, rhs: SKRDispoSanteCalendars) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

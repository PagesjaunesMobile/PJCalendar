/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSchedule: StargateKitModel {

    public var info: [SKRInfoSchedule]

    public var infoJour: SKRInfoJour

    public var dip: Bool?

    public var title: String?

    public init(info: [SKRInfoSchedule], infoJour: SKRInfoJour, dip: Bool? = nil, title: String? = nil) {
        self.info = info
        self.infoJour = infoJour
        self.dip = dip
        self.title = title
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case info
        case infoJour
        case dip
        case title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        info = try container.decodeArray(.info)
        infoJour = try container.decode(.infoJour)
        dip = try container.decodeIfPresent(.dip)
        title = try container.decodeIfPresent(.title)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(info, forKey: .info)
        try container.encode(infoJour, forKey: .infoJour)
        try container.encodeIfPresent(dip, forKey: .dip)
        try container.encodeIfPresent(title, forKey: .title)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSchedule else { return false }
      guard self.info == object.info else { return false }
      guard self.infoJour == object.infoJour else { return false }
      guard self.dip == object.dip else { return false }
      guard self.title == object.title else { return false }
      return true
    }

    public static func == (lhs: SKRSchedule, rhs: SKRSchedule) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

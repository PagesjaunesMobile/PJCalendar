/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRdvTransac: StargateKitModel {

    public var calendId: String

    public var dtime: String

    public var intervId: String

    public var champ: [SKRChampComplementaire]?

    public init(calendId: String, dtime: String, intervId: String, champ: [SKRChampComplementaire]? = nil) {
        self.calendId = calendId
        self.dtime = dtime
        self.intervId = intervId
        self.champ = champ
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case calendId = "calend_id"
        case dtime
        case intervId = "interv_id"
        case champ
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        calendId = try container.decode(.calendId)
        dtime = try container.decode(.dtime)
        intervId = try container.decode(.intervId)
        champ = try container.decodeArrayIfPresent(.champ)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(calendId, forKey: .calendId)
        try container.encode(dtime, forKey: .dtime)
        try container.encode(intervId, forKey: .intervId)
        try container.encodeIfPresent(champ, forKey: .champ)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRdvTransac else { return false }
      guard self.calendId == object.calendId else { return false }
      guard self.dtime == object.dtime else { return false }
      guard self.intervId == object.intervId else { return false }
      guard self.champ == object.champ else { return false }
      return true
    }

    public static func == (lhs: SKRRdvTransac, rhs: SKRRdvTransac) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

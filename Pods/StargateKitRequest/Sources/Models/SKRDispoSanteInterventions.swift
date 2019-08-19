/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDispoSanteInterventions: StargateKitModel {

    public var intervention: [SKRItemTransac]?

    public var stitle: String?

    public init(intervention: [SKRItemTransac]? = nil, stitle: String? = nil) {
        self.intervention = intervention
        self.stitle = stitle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case intervention
        case stitle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        intervention = try container.decodeArrayIfPresent(.intervention)
        stitle = try container.decodeIfPresent(.stitle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(intervention, forKey: .intervention)
        try container.encodeIfPresent(stitle, forKey: .stitle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDispoSanteInterventions else { return false }
      guard self.intervention == object.intervention else { return false }
      guard self.stitle == object.stitle else { return false }
      return true
    }

    public static func == (lhs: SKRDispoSanteInterventions, rhs: SKRDispoSanteInterventions) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

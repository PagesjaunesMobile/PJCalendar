/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDispoSanteFichePatient: StargateKitModel {

    public var fiche: [SKRFiche]?

    public var stitle: String?

    public init(fiche: [SKRFiche]? = nil, stitle: String? = nil) {
        self.fiche = fiche
        self.stitle = stitle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case fiche
        case stitle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        fiche = try container.decodeArrayIfPresent(.fiche)
        stitle = try container.decodeIfPresent(.stitle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(fiche, forKey: .fiche)
        try container.encodeIfPresent(stitle, forKey: .stitle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDispoSanteFichePatient else { return false }
      guard self.fiche == object.fiche else { return false }
      guard self.stitle == object.stitle else { return false }
      return true
    }

    public static func == (lhs: SKRDispoSanteFichePatient, rhs: SKRDispoSanteFichePatient) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

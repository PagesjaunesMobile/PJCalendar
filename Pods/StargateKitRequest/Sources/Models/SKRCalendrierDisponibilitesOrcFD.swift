/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCalendrierDisponibilitesOrcFD: StargateKitModel {

    public var lien: SKRLienTransactionnelApiInscriptionOrcFD?

    public init(lien: SKRLienTransactionnelApiInscriptionOrcFD? = nil) {
        self.lien = lien
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case lien
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        lien = try container.decodeIfPresent(.lien)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(lien, forKey: .lien)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCalendrierDisponibilitesOrcFD else { return false }
      guard self.lien == object.lien else { return false }
      return true
    }

    public static func == (lhs: SKRCalendrierDisponibilitesOrcFD, rhs: SKRCalendrierDisponibilitesOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

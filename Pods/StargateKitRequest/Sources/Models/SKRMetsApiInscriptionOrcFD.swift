/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMetsApiInscriptionOrcFD: StargateKitModel {

    public var description: String?

    public var tarif: String?

    public init(description: String? = nil, tarif: String? = nil) {
        self.description = description
        self.tarif = tarif
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case description
        case tarif
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        description = try container.decodeIfPresent(.description)
        tarif = try container.decodeIfPresent(.tarif)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(tarif, forKey: .tarif)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMetsApiInscriptionOrcFD else { return false }
      guard self.description == object.description else { return false }
      guard self.tarif == object.tarif else { return false }
      return true
    }

    public static func == (lhs: SKRMetsApiInscriptionOrcFD, rhs: SKRMetsApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

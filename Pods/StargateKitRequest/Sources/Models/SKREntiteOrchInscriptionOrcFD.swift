/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREntiteOrchInscriptionOrcFD: StargateKitModel {

    public var libelle: String?

    public var uRLDdr: String?

    public var uRLSa: String?

    public init(libelle: String? = nil, uRLDdr: String? = nil, uRLSa: String? = nil) {
        self.libelle = libelle
        self.uRLDdr = uRLDdr
        self.uRLSa = uRLSa
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case libelle
        case uRLDdr = "url_ddr"
        case uRLSa = "url_sa"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        libelle = try container.decodeIfPresent(.libelle)
        uRLDdr = try container.decodeIfPresent(.uRLDdr)
        uRLSa = try container.decodeIfPresent(.uRLSa)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(uRLDdr, forKey: .uRLDdr)
        try container.encodeIfPresent(uRLSa, forKey: .uRLSa)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREntiteOrchInscriptionOrcFD else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.uRLDdr == object.uRLDdr else { return false }
      guard self.uRLSa == object.uRLSa else { return false }
      return true
    }

    public static func == (lhs: SKREntiteOrchInscriptionOrcFD, rhs: SKREntiteOrchInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

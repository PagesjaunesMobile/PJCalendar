/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInformationsCarteApiInscriptionOrcFD: StargateKitModel {

    public var informationsParking: String?

    public var informationsQuartier: String?

    public var pap: [SKRPapApiInscriptionOrcFD]?

    public init(informationsParking: String? = nil, informationsQuartier: String? = nil, pap: [SKRPapApiInscriptionOrcFD]? = nil) {
        self.informationsParking = informationsParking
        self.informationsQuartier = informationsQuartier
        self.pap = pap
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case informationsParking = "informations_parking"
        case informationsQuartier = "informations_quartier"
        case pap
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        informationsParking = try container.decodeIfPresent(.informationsParking)
        informationsQuartier = try container.decodeIfPresent(.informationsQuartier)
        pap = try container.decodeArrayIfPresent(.pap)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(informationsParking, forKey: .informationsParking)
        try container.encodeIfPresent(informationsQuartier, forKey: .informationsQuartier)
        try container.encodeIfPresent(pap, forKey: .pap)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInformationsCarteApiInscriptionOrcFD else { return false }
      guard self.informationsParking == object.informationsParking else { return false }
      guard self.informationsQuartier == object.informationsQuartier else { return false }
      guard self.pap == object.pap else { return false }
      return true
    }

    public static func == (lhs: SKRInformationsCarteApiInscriptionOrcFD, rhs: SKRInformationsCarteApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

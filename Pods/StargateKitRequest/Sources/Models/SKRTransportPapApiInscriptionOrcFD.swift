/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTransportPapApiInscriptionOrcFD: StargateKitModel {

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case metro = "METRO"
        case bus = "BUS"
        case tramway = "TRAMWAY"
        case funiculaire = "FUNICULAIRE"
        case rer = "RER"
        case transilien = "TRANSILIEN"
        case ter = "TER"
        case tgv = "TGV"
        case autorail = "AUTORAIL"
    }

    public var ligne: [String]?

    public var type: SKRType?

    public init(ligne: [String]? = nil, type: SKRType? = nil) {
        self.ligne = ligne
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case ligne
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        ligne = try container.decodeArrayIfPresent(.ligne)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(ligne, forKey: .ligne)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTransportPapApiInscriptionOrcFD else { return false }
      guard self.ligne == object.ligne else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRTransportPapApiInscriptionOrcFD, rhs: SKRTransportPapApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

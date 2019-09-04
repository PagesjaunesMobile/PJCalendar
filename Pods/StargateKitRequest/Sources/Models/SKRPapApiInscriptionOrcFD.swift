/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPapApiInscriptionOrcFD: StargateKitModel {

    public var distance: SKRDistancePapApiInscriptionOrcFD?

    public var nom: String?

    public var transports: [SKRTransportPapApiInscriptionOrcFD]?

    public init(distance: SKRDistancePapApiInscriptionOrcFD? = nil, nom: String? = nil, transports: [SKRTransportPapApiInscriptionOrcFD]? = nil) {
        self.distance = distance
        self.nom = nom
        self.transports = transports
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case distance
        case nom
        case transports
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        distance = try container.decodeIfPresent(.distance)
        nom = try container.decodeIfPresent(.nom)
        transports = try container.decodeArrayIfPresent(.transports)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(distance, forKey: .distance)
        try container.encodeIfPresent(nom, forKey: .nom)
        try container.encodeIfPresent(transports, forKey: .transports)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPapApiInscriptionOrcFD else { return false }
      guard self.distance == object.distance else { return false }
      guard self.nom == object.nom else { return false }
      guard self.transports == object.transports else { return false }
      return true
    }

    public static func == (lhs: SKRPapApiInscriptionOrcFD, rhs: SKRPapApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

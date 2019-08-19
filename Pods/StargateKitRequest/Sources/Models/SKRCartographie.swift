/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCartographie: StargateKitModel {

    public var geolocalisation: SKRGeolocalisationOrcFD?

    public init(geolocalisation: SKRGeolocalisationOrcFD? = nil) {
        self.geolocalisation = geolocalisation
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case geolocalisation
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        geolocalisation = try container.decodeIfPresent(.geolocalisation)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(geolocalisation, forKey: .geolocalisation)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCartographie else { return false }
      guard self.geolocalisation == object.geolocalisation else { return false }
      return true
    }

    public static func == (lhs: SKRCartographie, rhs: SKRCartographie) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRGeolocalisationOrcFD: StargateKitModel {

    public var coordinates: [Double]?

    public var qualite: Int?

    public var typeLocalisation: String?

    public init(coordinates: [Double]? = nil, qualite: Int? = nil, typeLocalisation: String? = nil) {
        self.coordinates = coordinates
        self.qualite = qualite
        self.typeLocalisation = typeLocalisation
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case coordinates
        case qualite
        case typeLocalisation = "type_localisation"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        coordinates = try container.decodeArrayIfPresent(.coordinates)
        qualite = try container.decodeIfPresent(.qualite)
        typeLocalisation = try container.decodeIfPresent(.typeLocalisation)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(coordinates, forKey: .coordinates)
        try container.encodeIfPresent(qualite, forKey: .qualite)
        try container.encodeIfPresent(typeLocalisation, forKey: .typeLocalisation)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRGeolocalisationOrcFD else { return false }
      guard self.coordinates == object.coordinates else { return false }
      guard self.qualite == object.qualite else { return false }
      guard self.typeLocalisation == object.typeLocalisation else { return false }
      return true
    }

    public static func == (lhs: SKRGeolocalisationOrcFD, rhs: SKRGeolocalisationOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

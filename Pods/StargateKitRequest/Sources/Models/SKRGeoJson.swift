/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRGeoJson: StargateKitModel {

    public var coordinates: [[[Double]]]?

    public var type: String?

    public init(coordinates: [[[Double]]]? = nil, type: String? = nil) {
        self.coordinates = coordinates
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case coordinates
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        coordinates = try container.decodeArrayIfPresent(.coordinates)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(coordinates, forKey: .coordinates)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRGeoJson else { return false }
      guard self.coordinates == object.coordinates else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRGeoJson, rhs: SKRGeoJson) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

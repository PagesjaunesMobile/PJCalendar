/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDonneesPhotosOrcFD: StargateKitModel {

    public var nombreTotalPhotos: Int?

    public var photos: [SKRPhoto]?

    public init(nombreTotalPhotos: Int? = nil, photos: [SKRPhoto]? = nil) {
        self.nombreTotalPhotos = nombreTotalPhotos
        self.photos = photos
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nombreTotalPhotos = "nombre_total_photos"
        case photos
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nombreTotalPhotos = try container.decodeIfPresent(.nombreTotalPhotos)
        photos = try container.decodeArrayIfPresent(.photos)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(nombreTotalPhotos, forKey: .nombreTotalPhotos)
        try container.encodeIfPresent(photos, forKey: .photos)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDonneesPhotosOrcFD else { return false }
      guard self.nombreTotalPhotos == object.nombreTotalPhotos else { return false }
      guard self.photos == object.photos else { return false }
      return true
    }

    public static func == (lhs: SKRDonneesPhotosOrcFD, rhs: SKRDonneesPhotosOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

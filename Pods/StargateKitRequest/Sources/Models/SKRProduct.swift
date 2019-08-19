/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRProduct: StargateKitModel {

    public var album: SKRAlbum?

    public var appURL: String?

    public var label: String?

    public var nbr: Int?

    public var refC: String?

    public var refV: String?

    public var type: String?

    public init(album: SKRAlbum? = nil, appURL: String? = nil, label: String? = nil, nbr: Int? = nil, refC: String? = nil, refV: String? = nil, type: String? = nil) {
        self.album = album
        self.appURL = appURL
        self.label = label
        self.nbr = nbr
        self.refC = refC
        self.refV = refV
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case album
        case appURL
        case label
        case nbr
        case refC
        case refV
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        album = try container.decodeIfPresent(.album)
        appURL = try container.decodeIfPresent(.appURL)
        label = try container.decodeIfPresent(.label)
        nbr = try container.decodeIfPresent(.nbr)
        refC = try container.decodeIfPresent(.refC)
        refV = try container.decodeIfPresent(.refV)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(album, forKey: .album)
        try container.encodeIfPresent(appURL, forKey: .appURL)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(nbr, forKey: .nbr)
        try container.encodeIfPresent(refC, forKey: .refC)
        try container.encodeIfPresent(refV, forKey: .refV)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRProduct else { return false }
      guard self.album == object.album else { return false }
      guard self.appURL == object.appURL else { return false }
      guard self.label == object.label else { return false }
      guard self.nbr == object.nbr else { return false }
      guard self.refC == object.refC else { return false }
      guard self.refV == object.refV else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRProduct, rhs: SKRProduct) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

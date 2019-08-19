/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRBannerLR: StargateKitModel {

    public var title: String?

    public var typeRes: String?

    public init(title: String? = nil, typeRes: String? = nil) {
        self.title = title
        self.typeRes = typeRes
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case title
        case typeRes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decodeIfPresent(.title)
        typeRes = try container.decodeIfPresent(.typeRes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(typeRes, forKey: .typeRes)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRBannerLR else { return false }
      guard self.title == object.title else { return false }
      guard self.typeRes == object.typeRes else { return false }
      return true
    }

    public static func == (lhs: SKRBannerLR, rhs: SKRBannerLR) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

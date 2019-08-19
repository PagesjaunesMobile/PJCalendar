/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAdv: StargateKitModel {

    public var banner: SKRBanner?

    public var push: SKRPush?

    public init(banner: SKRBanner? = nil, push: SKRPush? = nil) {
        self.banner = banner
        self.push = push
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case banner
        case push
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        banner = try container.decodeIfPresent(.banner)
        push = try container.decodeIfPresent(.push)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(banner, forKey: .banner)
        try container.encodeIfPresent(push, forKey: .push)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAdv else { return false }
      guard self.banner == object.banner else { return false }
      guard self.push == object.push else { return false }
      return true
    }

    public static func == (lhs: SKRAdv, rhs: SKRAdv) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

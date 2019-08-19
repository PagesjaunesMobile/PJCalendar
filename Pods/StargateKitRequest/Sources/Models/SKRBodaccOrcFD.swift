/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRBodaccOrcFD: StargateKitModel {

    public var annonces: [SKRAnnonceBodaccOrcFD]?

    public init(annonces: [SKRAnnonceBodaccOrcFD]? = nil) {
        self.annonces = annonces
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case annonces
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        annonces = try container.decodeArrayIfPresent(.annonces)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(annonces, forKey: .annonces)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRBodaccOrcFD else { return false }
      guard self.annonces == object.annonces else { return false }
      return true
    }

    public static func == (lhs: SKRBodaccOrcFD, rhs: SKRBodaccOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

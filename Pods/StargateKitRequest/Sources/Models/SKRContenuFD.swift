/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContenuFD: StargateKitModel {

    public var contenuFDMenu: [SKRContenuFDMenu]?

    public init(contenuFDMenu: [SKRContenuFDMenu]? = nil) {
        self.contenuFDMenu = contenuFDMenu
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case contenuFDMenu
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        contenuFDMenu = try container.decodeArrayIfPresent(.contenuFDMenu)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(contenuFDMenu, forKey: .contenuFDMenu)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContenuFD else { return false }
      guard self.contenuFDMenu == object.contenuFDMenu else { return false }
      return true
    }

    public static func == (lhs: SKRContenuFD, rhs: SKRContenuFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

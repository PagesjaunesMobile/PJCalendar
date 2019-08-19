/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContenuFDMenu: StargateKitModel {

    public var contenuFDSousMenus: [SKRContenuFDSousMenu]?

    public var titre: String?

    public init(contenuFDSousMenus: [SKRContenuFDSousMenu]? = nil, titre: String? = nil) {
        self.contenuFDSousMenus = contenuFDSousMenus
        self.titre = titre
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case contenuFDSousMenus
        case titre
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        contenuFDSousMenus = try container.decodeArrayIfPresent(.contenuFDSousMenus)
        titre = try container.decodeIfPresent(.titre)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(contenuFDSousMenus, forKey: .contenuFDSousMenus)
        try container.encodeIfPresent(titre, forKey: .titre)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContenuFDMenu else { return false }
      guard self.contenuFDSousMenus == object.contenuFDSousMenus else { return false }
      guard self.titre == object.titre else { return false }
      return true
    }

    public static func == (lhs: SKRContenuFDMenu, rhs: SKRContenuFDMenu) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

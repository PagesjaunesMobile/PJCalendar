/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFormuleApiInscriptionOrcFD: StargateKitModel {

    public var contenu: String?

    public var description: String?

    public var tarif: String?

    public var titre: String?

    public init(contenu: String? = nil, description: String? = nil, tarif: String? = nil, titre: String? = nil) {
        self.contenu = contenu
        self.description = description
        self.tarif = tarif
        self.titre = titre
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case contenu
        case description
        case tarif
        case titre
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        contenu = try container.decodeIfPresent(.contenu)
        description = try container.decodeIfPresent(.description)
        tarif = try container.decodeIfPresent(.tarif)
        titre = try container.decodeIfPresent(.titre)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(contenu, forKey: .contenu)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(tarif, forKey: .tarif)
        try container.encodeIfPresent(titre, forKey: .titre)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFormuleApiInscriptionOrcFD else { return false }
      guard self.contenu == object.contenu else { return false }
      guard self.description == object.description else { return false }
      guard self.tarif == object.tarif else { return false }
      guard self.titre == object.titre else { return false }
      return true
    }

    public static func == (lhs: SKRFormuleApiInscriptionOrcFD, rhs: SKRFormuleApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

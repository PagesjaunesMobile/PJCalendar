/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRemarketingApiInscriptionOrcFD: StargateKitModel {

    public var pushActionTheme: String?

    public var pushRechercheConnexeMnemo: String?

    public var pushRechercheConnexeMnemoLibelle: String?

    public init(pushActionTheme: String? = nil, pushRechercheConnexeMnemo: String? = nil, pushRechercheConnexeMnemoLibelle: String? = nil) {
        self.pushActionTheme = pushActionTheme
        self.pushRechercheConnexeMnemo = pushRechercheConnexeMnemo
        self.pushRechercheConnexeMnemoLibelle = pushRechercheConnexeMnemoLibelle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case pushActionTheme = "push_action_theme"
        case pushRechercheConnexeMnemo = "push_recherche_connexe_mnemo"
        case pushRechercheConnexeMnemoLibelle = "push_recherche_connexe_mnemo_libelle"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        pushActionTheme = try container.decodeIfPresent(.pushActionTheme)
        pushRechercheConnexeMnemo = try container.decodeIfPresent(.pushRechercheConnexeMnemo)
        pushRechercheConnexeMnemoLibelle = try container.decodeIfPresent(.pushRechercheConnexeMnemoLibelle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(pushActionTheme, forKey: .pushActionTheme)
        try container.encodeIfPresent(pushRechercheConnexeMnemo, forKey: .pushRechercheConnexeMnemo)
        try container.encodeIfPresent(pushRechercheConnexeMnemoLibelle, forKey: .pushRechercheConnexeMnemoLibelle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRemarketingApiInscriptionOrcFD else { return false }
      guard self.pushActionTheme == object.pushActionTheme else { return false }
      guard self.pushRechercheConnexeMnemo == object.pushRechercheConnexeMnemo else { return false }
      guard self.pushRechercheConnexeMnemoLibelle == object.pushRechercheConnexeMnemoLibelle else { return false }
      return true
    }

    public static func == (lhs: SKRRemarketingApiInscriptionOrcFD, rhs: SKRRemarketingApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

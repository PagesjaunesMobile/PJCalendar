/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInformationsCoordonneesOrcFD: StargateKitModel {

    public var contactsMails: [SKRContactMailOrcFD]?

    public var coordonneePrincipale: SKRCoordonnee?

    public var coordonneesPanier1: [SKRCoordonnee]?

    public var coordonneesPanier2: [SKRCoordonnee]?

    public var nombreTotalTelephones: Int?

    public init(contactsMails: [SKRContactMailOrcFD]? = nil, coordonneePrincipale: SKRCoordonnee? = nil, coordonneesPanier1: [SKRCoordonnee]? = nil, coordonneesPanier2: [SKRCoordonnee]? = nil, nombreTotalTelephones: Int? = nil) {
        self.contactsMails = contactsMails
        self.coordonneePrincipale = coordonneePrincipale
        self.coordonneesPanier1 = coordonneesPanier1
        self.coordonneesPanier2 = coordonneesPanier2
        self.nombreTotalTelephones = nombreTotalTelephones
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case contactsMails = "contacts_mails"
        case coordonneePrincipale = "coordonnee_principale"
        case coordonneesPanier1 = "coordonnees_panier1"
        case coordonneesPanier2 = "coordonnees_panier2"
        case nombreTotalTelephones = "nombre_total_telephones"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        contactsMails = try container.decodeArrayIfPresent(.contactsMails)
        coordonneePrincipale = try container.decodeIfPresent(.coordonneePrincipale)
        coordonneesPanier1 = try container.decodeArrayIfPresent(.coordonneesPanier1)
        coordonneesPanier2 = try container.decodeArrayIfPresent(.coordonneesPanier2)
        nombreTotalTelephones = try container.decodeIfPresent(.nombreTotalTelephones)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(contactsMails, forKey: .contactsMails)
        try container.encodeIfPresent(coordonneePrincipale, forKey: .coordonneePrincipale)
        try container.encodeIfPresent(coordonneesPanier1, forKey: .coordonneesPanier1)
        try container.encodeIfPresent(coordonneesPanier2, forKey: .coordonneesPanier2)
        try container.encodeIfPresent(nombreTotalTelephones, forKey: .nombreTotalTelephones)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInformationsCoordonneesOrcFD else { return false }
      guard self.contactsMails == object.contactsMails else { return false }
      guard self.coordonneePrincipale == object.coordonneePrincipale else { return false }
      guard self.coordonneesPanier1 == object.coordonneesPanier1 else { return false }
      guard self.coordonneesPanier2 == object.coordonneesPanier2 else { return false }
      guard self.nombreTotalTelephones == object.nombreTotalTelephones else { return false }
      return true
    }

    public static func == (lhs: SKRInformationsCoordonneesOrcFD, rhs: SKRInformationsCoordonneesOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

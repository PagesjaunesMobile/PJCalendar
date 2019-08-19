/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRActualite: StargateKitModel {

    public enum SKREditable: String, Codable, Hashable, CaseIterable {
        case editable = "EDITABLE"
        case nonEditable = "NON_EDITABLE"
        case nonAutorise = "NON_AUTORISE"
        case nonImplemente = "NON_IMPLEMENTE"
    }

    public var actualiteContributeur: SKRActualiteContributeurOrcFD?

    public var dateDebut: String?

    public var dateDerniereModification: String?

    public var dateFin: String?

    public var description: String?

    public var editable: SKREditable?

    public var id: String?

    public var lienSite: String?

    public var titre: String?

    public var uRLPhoto: String?

    public init(actualiteContributeur: SKRActualiteContributeurOrcFD? = nil, dateDebut: String? = nil, dateDerniereModification: String? = nil, dateFin: String? = nil, description: String? = nil, editable: SKREditable? = nil, id: String? = nil, lienSite: String? = nil, titre: String? = nil, uRLPhoto: String? = nil) {
        self.actualiteContributeur = actualiteContributeur
        self.dateDebut = dateDebut
        self.dateDerniereModification = dateDerniereModification
        self.dateFin = dateFin
        self.description = description
        self.editable = editable
        self.id = id
        self.lienSite = lienSite
        self.titre = titre
        self.uRLPhoto = uRLPhoto
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actualiteContributeur = "actualite_contributeur"
        case dateDebut = "date_debut"
        case dateDerniereModification = "date_derniere_modification"
        case dateFin = "date_fin"
        case description
        case editable
        case id
        case lienSite = "lien_site"
        case titre
        case uRLPhoto = "url_photo"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actualiteContributeur = try container.decodeIfPresent(.actualiteContributeur)
        dateDebut = try container.decodeIfPresent(.dateDebut)
        dateDerniereModification = try container.decodeIfPresent(.dateDerniereModification)
        dateFin = try container.decodeIfPresent(.dateFin)
        description = try container.decodeIfPresent(.description)
        editable = try container.decodeIfPresent(.editable)
        id = try container.decodeIfPresent(.id)
        lienSite = try container.decodeIfPresent(.lienSite)
        titre = try container.decodeIfPresent(.titre)
        uRLPhoto = try container.decodeIfPresent(.uRLPhoto)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actualiteContributeur, forKey: .actualiteContributeur)
        try container.encodeIfPresent(dateDebut, forKey: .dateDebut)
        try container.encodeIfPresent(dateDerniereModification, forKey: .dateDerniereModification)
        try container.encodeIfPresent(dateFin, forKey: .dateFin)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(editable, forKey: .editable)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(lienSite, forKey: .lienSite)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(uRLPhoto, forKey: .uRLPhoto)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRActualite else { return false }
      guard self.actualiteContributeur == object.actualiteContributeur else { return false }
      guard self.dateDebut == object.dateDebut else { return false }
      guard self.dateDerniereModification == object.dateDerniereModification else { return false }
      guard self.dateFin == object.dateFin else { return false }
      guard self.description == object.description else { return false }
      guard self.editable == object.editable else { return false }
      guard self.id == object.id else { return false }
      guard self.lienSite == object.lienSite else { return false }
      guard self.titre == object.titre else { return false }
      guard self.uRLPhoto == object.uRLPhoto else { return false }
      return true
    }

    public static func == (lhs: SKRActualite, rhs: SKRActualite) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

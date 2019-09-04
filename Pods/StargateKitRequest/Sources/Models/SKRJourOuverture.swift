/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRJourOuverture: StargateKitModel {

    public enum SKRJour: String, Codable, Hashable, CaseIterable {
        case mon = "Mon"
        case tue = "Tue"
        case wed = "Wed"
        case thu = "Thu"
        case fri = "Fri"
        case sat = "Sat"
        case sun = "Sun"
        case jan = "Jan"
        case feb = "Feb"
        case mar = "Mar"
        case apr = "Apr"
        case may = "May"
        case jun = "Jun"
        case jul = "Jul"
        case aug = "Aug"
        case sep = "Sep"
        case oct = "Oct"
        case nov = "Nov"
        case dec = "Dec"
    }

    public enum SKRType: String, Codable, Hashable, CaseIterable {
        case defaut = "DEFAUT"
        case avecRdv = "AVEC_RDV"
        case avecSansRdv = "AVEC_SANS_RDV"
    }

    public var creneauxHoraire: [SKRCreneauHoraireApiInscriptionOrcFD]?

    public var jour: SKRJour?

    public var ouvert2424: Bool?

    public var type: SKRType?

    public init(creneauxHoraire: [SKRCreneauHoraireApiInscriptionOrcFD]? = nil, jour: SKRJour? = nil, ouvert2424: Bool? = nil, type: SKRType? = nil) {
        self.creneauxHoraire = creneauxHoraire
        self.jour = jour
        self.ouvert2424 = ouvert2424
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case creneauxHoraire = "creneaux_horaire"
        case jour
        case ouvert2424 = "ouvert_2424"
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        creneauxHoraire = try container.decodeArrayIfPresent(.creneauxHoraire)
        jour = try container.decodeIfPresent(.jour)
        ouvert2424 = try container.decodeIfPresent(.ouvert2424)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(creneauxHoraire, forKey: .creneauxHoraire)
        try container.encodeIfPresent(jour, forKey: .jour)
        try container.encodeIfPresent(ouvert2424, forKey: .ouvert2424)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRJourOuverture else { return false }
      guard self.creneauxHoraire == object.creneauxHoraire else { return false }
      guard self.jour == object.jour else { return false }
      guard self.ouvert2424 == object.ouvert2424 else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRJourOuverture, rhs: SKRJourOuverture) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

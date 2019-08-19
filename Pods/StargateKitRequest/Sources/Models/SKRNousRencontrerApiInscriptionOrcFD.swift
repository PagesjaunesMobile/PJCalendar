/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRNousRencontrerApiInscriptionOrcFD: StargateKitModel {

    public var dateDebut: String?

    public var dateFin: String?

    public var intitule: String?

    public var localisation: String?

    public var uRLSite: String?

    public init(dateDebut: String? = nil, dateFin: String? = nil, intitule: String? = nil, localisation: String? = nil, uRLSite: String? = nil) {
        self.dateDebut = dateDebut
        self.dateFin = dateFin
        self.intitule = intitule
        self.localisation = localisation
        self.uRLSite = uRLSite
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dateDebut = "date_debut"
        case dateFin = "date_fin"
        case intitule
        case localisation
        case uRLSite = "url_site"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dateDebut = try container.decodeIfPresent(.dateDebut)
        dateFin = try container.decodeIfPresent(.dateFin)
        intitule = try container.decodeIfPresent(.intitule)
        localisation = try container.decodeIfPresent(.localisation)
        uRLSite = try container.decodeIfPresent(.uRLSite)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dateDebut, forKey: .dateDebut)
        try container.encodeIfPresent(dateFin, forKey: .dateFin)
        try container.encodeIfPresent(intitule, forKey: .intitule)
        try container.encodeIfPresent(localisation, forKey: .localisation)
        try container.encodeIfPresent(uRLSite, forKey: .uRLSite)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRNousRencontrerApiInscriptionOrcFD else { return false }
      guard self.dateDebut == object.dateDebut else { return false }
      guard self.dateFin == object.dateFin else { return false }
      guard self.intitule == object.intitule else { return false }
      guard self.localisation == object.localisation else { return false }
      guard self.uRLSite == object.uRLSite else { return false }
      return true
    }

    public static func == (lhs: SKRNousRencontrerApiInscriptionOrcFD, rhs: SKRNousRencontrerApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFavori: StargateKitModel {

    public var codeActivite: String?

    public var dateAction: DateTime?

    public var dateAjout: DateTime?

    public var designation: String?

    public var epj: String?

    public var localiteId: String?

    public var locationId: String?

    public var raisonSociale: String?

    public var source: String?

    public init(codeActivite: String? = nil, dateAction: DateTime? = nil, dateAjout: DateTime? = nil, designation: String? = nil, epj: String? = nil, localiteId: String? = nil, locationId: String? = nil, raisonSociale: String? = nil, source: String? = nil) {
        self.codeActivite = codeActivite
        self.dateAction = dateAction
        self.dateAjout = dateAjout
        self.designation = designation
        self.epj = epj
        self.localiteId = localiteId
        self.locationId = locationId
        self.raisonSociale = raisonSociale
        self.source = source
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case codeActivite = "code_activite"
        case dateAction = "date_action"
        case dateAjout = "date_ajout"
        case designation
        case epj
        case localiteId = "localite_id"
        case locationId = "location_id"
        case raisonSociale = "raison_sociale"
        case source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        codeActivite = try container.decodeIfPresent(.codeActivite)
        dateAction = try container.decodeIfPresent(.dateAction)
        dateAjout = try container.decodeIfPresent(.dateAjout)
        designation = try container.decodeIfPresent(.designation)
        epj = try container.decodeIfPresent(.epj)
        localiteId = try container.decodeIfPresent(.localiteId)
        locationId = try container.decodeIfPresent(.locationId)
        raisonSociale = try container.decodeIfPresent(.raisonSociale)
        source = try container.decodeIfPresent(.source)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(codeActivite, forKey: .codeActivite)
        try container.encodeIfPresent(dateAction, forKey: .dateAction)
        try container.encodeIfPresent(dateAjout, forKey: .dateAjout)
        try container.encodeIfPresent(designation, forKey: .designation)
        try container.encodeIfPresent(epj, forKey: .epj)
        try container.encodeIfPresent(localiteId, forKey: .localiteId)
        try container.encodeIfPresent(locationId, forKey: .locationId)
        try container.encodeIfPresent(raisonSociale, forKey: .raisonSociale)
        try container.encodeIfPresent(source, forKey: .source)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFavori else { return false }
      guard self.codeActivite == object.codeActivite else { return false }
      guard self.dateAction == object.dateAction else { return false }
      guard self.dateAjout == object.dateAjout else { return false }
      guard self.designation == object.designation else { return false }
      guard self.epj == object.epj else { return false }
      guard self.localiteId == object.localiteId else { return false }
      guard self.locationId == object.locationId else { return false }
      guard self.raisonSociale == object.raisonSociale else { return false }
      guard self.source == object.source else { return false }
      return true
    }

    public static func == (lhs: SKRFavori, rhs: SKRFavori) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

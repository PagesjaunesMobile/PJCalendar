/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContextePubliciteX20OrcFD: StargateKitModel {

    public enum SKRTypeProfilFiltrage: String, Codable, Hashable, CaseIterable {
        case fixe = "FIXE"
        case mobile = "MOBILE"
        case mappy = "MAPPY"
        case pfLogoPhoto = "PF_LOGO_PHOTO"
        case forceExclusion = "FORCE_EXCLUSION"
    }

    public var arrondissement: String?

    public var departement: String?

    public var localite: String?

    public var marque: String?

    public var rubriques: [String]?

    public var thematiques: [String]?

    public var typeProfilFiltrage: SKRTypeProfilFiltrage?

    public init(arrondissement: String? = nil, departement: String? = nil, localite: String? = nil, marque: String? = nil, rubriques: [String]? = nil, thematiques: [String]? = nil, typeProfilFiltrage: SKRTypeProfilFiltrage? = nil) {
        self.arrondissement = arrondissement
        self.departement = departement
        self.localite = localite
        self.marque = marque
        self.rubriques = rubriques
        self.thematiques = thematiques
        self.typeProfilFiltrage = typeProfilFiltrage
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case arrondissement
        case departement
        case localite
        case marque
        case rubriques
        case thematiques
        case typeProfilFiltrage = "type_profil_filtrage"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        arrondissement = try container.decodeIfPresent(.arrondissement)
        departement = try container.decodeIfPresent(.departement)
        localite = try container.decodeIfPresent(.localite)
        marque = try container.decodeIfPresent(.marque)
        rubriques = try container.decodeArrayIfPresent(.rubriques)
        thematiques = try container.decodeArrayIfPresent(.thematiques)
        typeProfilFiltrage = try container.decodeIfPresent(.typeProfilFiltrage)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(arrondissement, forKey: .arrondissement)
        try container.encodeIfPresent(departement, forKey: .departement)
        try container.encodeIfPresent(localite, forKey: .localite)
        try container.encodeIfPresent(marque, forKey: .marque)
        try container.encodeIfPresent(rubriques, forKey: .rubriques)
        try container.encodeIfPresent(thematiques, forKey: .thematiques)
        try container.encodeIfPresent(typeProfilFiltrage, forKey: .typeProfilFiltrage)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContextePubliciteX20OrcFD else { return false }
      guard self.arrondissement == object.arrondissement else { return false }
      guard self.departement == object.departement else { return false }
      guard self.localite == object.localite else { return false }
      guard self.marque == object.marque else { return false }
      guard self.rubriques == object.rubriques else { return false }
      guard self.thematiques == object.thematiques else { return false }
      guard self.typeProfilFiltrage == object.typeProfilFiltrage else { return false }
      return true
    }

    public static func == (lhs: SKRContextePubliciteX20OrcFD, rhs: SKRContextePubliciteX20OrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInformationsOpenGraphOrcFD: StargateKitModel {

    public var adresse: String?

    public var codePostal: String?

    public var coordinates: [Double]?

    public var denomination: String?

    public var email: String?

    public var libelleRubrique: String?

    public var nbAvis: Int?

    public var note: Float?

    public var telephone: String?

    public var type: String?

    public var uRLImage: String?

    public var uRLSitePvi: String?

    public var ville: String?

    public init(adresse: String? = nil, codePostal: String? = nil, coordinates: [Double]? = nil, denomination: String? = nil, email: String? = nil, libelleRubrique: String? = nil, nbAvis: Int? = nil, note: Float? = nil, telephone: String? = nil, type: String? = nil, uRLImage: String? = nil, uRLSitePvi: String? = nil, ville: String? = nil) {
        self.adresse = adresse
        self.codePostal = codePostal
        self.coordinates = coordinates
        self.denomination = denomination
        self.email = email
        self.libelleRubrique = libelleRubrique
        self.nbAvis = nbAvis
        self.note = note
        self.telephone = telephone
        self.type = type
        self.uRLImage = uRLImage
        self.uRLSitePvi = uRLSitePvi
        self.ville = ville
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case adresse
        case codePostal = "code_postal"
        case coordinates
        case denomination
        case email
        case libelleRubrique = "libelle_rubrique"
        case nbAvis = "nb_avis"
        case note
        case telephone
        case type
        case uRLImage = "url_image"
        case uRLSitePvi = "url_site_pvi"
        case ville
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        adresse = try container.decodeIfPresent(.adresse)
        codePostal = try container.decodeIfPresent(.codePostal)
        coordinates = try container.decodeArrayIfPresent(.coordinates)
        denomination = try container.decodeIfPresent(.denomination)
        email = try container.decodeIfPresent(.email)
        libelleRubrique = try container.decodeIfPresent(.libelleRubrique)
        nbAvis = try container.decodeIfPresent(.nbAvis)
        note = try container.decodeIfPresent(.note)
        telephone = try container.decodeIfPresent(.telephone)
        type = try container.decodeIfPresent(.type)
        uRLImage = try container.decodeIfPresent(.uRLImage)
        uRLSitePvi = try container.decodeIfPresent(.uRLSitePvi)
        ville = try container.decodeIfPresent(.ville)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(adresse, forKey: .adresse)
        try container.encodeIfPresent(codePostal, forKey: .codePostal)
        try container.encodeIfPresent(coordinates, forKey: .coordinates)
        try container.encodeIfPresent(denomination, forKey: .denomination)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(libelleRubrique, forKey: .libelleRubrique)
        try container.encodeIfPresent(nbAvis, forKey: .nbAvis)
        try container.encodeIfPresent(note, forKey: .note)
        try container.encodeIfPresent(telephone, forKey: .telephone)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(uRLImage, forKey: .uRLImage)
        try container.encodeIfPresent(uRLSitePvi, forKey: .uRLSitePvi)
        try container.encodeIfPresent(ville, forKey: .ville)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInformationsOpenGraphOrcFD else { return false }
      guard self.adresse == object.adresse else { return false }
      guard self.codePostal == object.codePostal else { return false }
      guard self.coordinates == object.coordinates else { return false }
      guard self.denomination == object.denomination else { return false }
      guard self.email == object.email else { return false }
      guard self.libelleRubrique == object.libelleRubrique else { return false }
      guard self.nbAvis == object.nbAvis else { return false }
      guard self.note == object.note else { return false }
      guard self.telephone == object.telephone else { return false }
      guard self.type == object.type else { return false }
      guard self.uRLImage == object.uRLImage else { return false }
      guard self.uRLSitePvi == object.uRLSitePvi else { return false }
      guard self.ville == object.ville else { return false }
      return true
    }

    public static func == (lhs: SKRInformationsOpenGraphOrcFD, rhs: SKRInformationsOpenGraphOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRVisuelOrcFD: StargateKitModel {

    public enum SKRTypeProfilFiltrage: String, Codable, Hashable, CaseIterable {
        case fixe = "FIXE"
        case mobile = "MOBILE"
        case mappy = "MAPPY"
        case pfLogoPhoto = "PF_LOGO_PHOTO"
        case forceExclusion = "FORCE_EXCLUSION"
    }

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var type: String?

    public var typeProfilFiltrage: SKRTypeProfilFiltrage?

    public var url: String?

    public init(produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, type: String? = nil, typeProfilFiltrage: SKRTypeProfilFiltrage? = nil, url: String? = nil) {
        self.produitPublicitaire = produitPublicitaire
        self.type = type
        self.typeProfilFiltrage = typeProfilFiltrage
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case produitPublicitaire = "produit_publicitaire"
        case type
        case typeProfilFiltrage = "type_profil_filtrage"
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        type = try container.decodeIfPresent(.type)
        typeProfilFiltrage = try container.decodeIfPresent(.typeProfilFiltrage)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(typeProfilFiltrage, forKey: .typeProfilFiltrage)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRVisuelOrcFD else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.type == object.type else { return false }
      guard self.typeProfilFiltrage == object.typeProfilFiltrage else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRVisuelOrcFD, rhs: SKRVisuelOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCritereRechercheOrcFD: StargateKitModel {

    public var categorie: String?

    public var categorieCritereRecherche: SKRCritereRecherche?

    public var formeNormale: String?

    public var libelle: String?

    public var priorite: Int?

    public init(categorie: String? = nil, categorieCritereRecherche: SKRCritereRecherche? = nil, formeNormale: String? = nil, libelle: String? = nil, priorite: Int? = nil) {
        self.categorie = categorie
        self.categorieCritereRecherche = categorieCritereRecherche
        self.formeNormale = formeNormale
        self.libelle = libelle
        self.priorite = priorite
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case categorie
        case categorieCritereRecherche
        case formeNormale
        case libelle
        case priorite
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        categorie = try container.decodeIfPresent(.categorie)
        categorieCritereRecherche = try container.decodeIfPresent(.categorieCritereRecherche)
        formeNormale = try container.decodeIfPresent(.formeNormale)
        libelle = try container.decodeIfPresent(.libelle)
        priorite = try container.decodeIfPresent(.priorite)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(categorie, forKey: .categorie)
        try container.encodeIfPresent(categorieCritereRecherche, forKey: .categorieCritereRecherche)
        try container.encodeIfPresent(formeNormale, forKey: .formeNormale)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(priorite, forKey: .priorite)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCritereRechercheOrcFD else { return false }
      guard self.categorie == object.categorie else { return false }
      guard self.categorieCritereRecherche == object.categorieCritereRecherche else { return false }
      guard self.formeNormale == object.formeNormale else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.priorite == object.priorite else { return false }
      return true
    }

    public static func == (lhs: SKRCritereRechercheOrcFD, rhs: SKRCritereRechercheOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

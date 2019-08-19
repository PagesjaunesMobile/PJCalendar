/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRLienSEOOrcFD: StargateKitModel {

    public enum SKRCode: String, Codable, Hashable, CaseIterable {
        case lrpartFooter = "LRPART_FOOTER"
        case lrproFooter = "LRPRO_FOOTER"
        case lractTopactivites = "LRACT_TOPACTIVITES"
        case lractRechlocalites = "LRACT_RECHLOCALITES"
        case fdproAutrespros = "FDPRO_AUTRESPROS"
        case fdPjAutrespros = "FD_PJ_AUTRESPROS"
        case fdInseeAutrespros = "FD_INSEE_AUTRESPROS"
        case hpproTopactivites = "HPPRO_TOPACTIVITES"
        case lractLiensUtiles = "LRACT_LIENS_UTILES"
        case lrproPushlrfiltrees = "LRPRO_PUSHLRFILTREES"
        case lrDepartement = "LR_DEPARTEMENT"
        case lrRegion = "LR_REGION"
        case lrLocaliteAlpha = "LR_LOCALITE_ALPHA"
        case annuaireLocaliteVoisine = "ANNUAIRE_LOCALITE_VOISINE"
        case lrConceptCodex = "LR_CONCEPT_CODEX"
        case lienConnexe = "LIEN_CONNEXE"
        case hubFooter = "HUB_FOOTER"
        case suggestionFd = "SUGGESTION_FD"
        case lrActLocPro = "LR_ACT_LOC_PRO"
        case annuSeoEnseignes = "ANNU_SEO_ENSEIGNES"
    }

    public var code: SKRCode?

    public var libelle: String?

    public var url: String?

    public init(code: SKRCode? = nil, libelle: String? = nil, url: String? = nil) {
        self.code = code
        self.libelle = libelle
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case libelle
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        libelle = try container.decodeIfPresent(.libelle)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRLienSEOOrcFD else { return false }
      guard self.code == object.code else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRLienSEOOrcFD, rhs: SKRLienSEOOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

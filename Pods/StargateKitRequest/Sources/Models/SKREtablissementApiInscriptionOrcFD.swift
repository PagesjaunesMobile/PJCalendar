/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREtablissementApiInscriptionOrcFD: StargateKitModel {

    public var adresse: SKRAdresseApiInscriptionOrcFD?

    public var brouillageSeo: Bool?

    public var codeEtablissement: String?

    public var denomination: String?

    public var siege: Bool?

    public var uRLSeo: String?

    public init(adresse: SKRAdresseApiInscriptionOrcFD? = nil, brouillageSeo: Bool? = nil, codeEtablissement: String? = nil, denomination: String? = nil, siege: Bool? = nil, uRLSeo: String? = nil) {
        self.adresse = adresse
        self.brouillageSeo = brouillageSeo
        self.codeEtablissement = codeEtablissement
        self.denomination = denomination
        self.siege = siege
        self.uRLSeo = uRLSeo
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case adresse
        case brouillageSeo = "brouillage_seo"
        case codeEtablissement = "code_etablissement"
        case denomination
        case siege
        case uRLSeo = "url_seo"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        adresse = try container.decodeIfPresent(.adresse)
        brouillageSeo = try container.decodeIfPresent(.brouillageSeo)
        codeEtablissement = try container.decodeIfPresent(.codeEtablissement)
        denomination = try container.decodeIfPresent(.denomination)
        siege = try container.decodeIfPresent(.siege)
        uRLSeo = try container.decodeIfPresent(.uRLSeo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(adresse, forKey: .adresse)
        try container.encodeIfPresent(brouillageSeo, forKey: .brouillageSeo)
        try container.encodeIfPresent(codeEtablissement, forKey: .codeEtablissement)
        try container.encodeIfPresent(denomination, forKey: .denomination)
        try container.encodeIfPresent(siege, forKey: .siege)
        try container.encodeIfPresent(uRLSeo, forKey: .uRLSeo)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREtablissementApiInscriptionOrcFD else { return false }
      guard self.adresse == object.adresse else { return false }
      guard self.brouillageSeo == object.brouillageSeo else { return false }
      guard self.codeEtablissement == object.codeEtablissement else { return false }
      guard self.denomination == object.denomination else { return false }
      guard self.siege == object.siege else { return false }
      guard self.uRLSeo == object.uRLSeo else { return false }
      return true
    }

    public static func == (lhs: SKREtablissementApiInscriptionOrcFD, rhs: SKREtablissementApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

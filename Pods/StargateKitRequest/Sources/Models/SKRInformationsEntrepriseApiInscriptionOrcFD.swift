/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInformationsEntrepriseApiInscriptionOrcFD: StargateKitModel {

    public var adresseSiege: SKRAdresseApiInscriptionOrcFD?

    public var autresDenominations: [String]?

    public var autresEtablissements: [SKREtablissementApiInscriptionOrcFD]?

    public var capitalSocial: String?

    public var dateCreationEntreprise: DateTime?

    public var dirigeants: [SKRDirigeantApiInscriptionOrcFD]?

    public var effectifEntreprise: String?

    public var formeJuridique: String?

    public var nombreTotalEtablissements: Int?

    public var siren: String?

    public var tvaIntracommunautaire: String?

    public init(adresseSiege: SKRAdresseApiInscriptionOrcFD? = nil, autresDenominations: [String]? = nil, autresEtablissements: [SKREtablissementApiInscriptionOrcFD]? = nil, capitalSocial: String? = nil, dateCreationEntreprise: DateTime? = nil, dirigeants: [SKRDirigeantApiInscriptionOrcFD]? = nil, effectifEntreprise: String? = nil, formeJuridique: String? = nil, nombreTotalEtablissements: Int? = nil, siren: String? = nil, tvaIntracommunautaire: String? = nil) {
        self.adresseSiege = adresseSiege
        self.autresDenominations = autresDenominations
        self.autresEtablissements = autresEtablissements
        self.capitalSocial = capitalSocial
        self.dateCreationEntreprise = dateCreationEntreprise
        self.dirigeants = dirigeants
        self.effectifEntreprise = effectifEntreprise
        self.formeJuridique = formeJuridique
        self.nombreTotalEtablissements = nombreTotalEtablissements
        self.siren = siren
        self.tvaIntracommunautaire = tvaIntracommunautaire
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case adresseSiege = "adresse_siege"
        case autresDenominations = "autres_denominations"
        case autresEtablissements = "autres_etablissements"
        case capitalSocial = "capital_social"
        case dateCreationEntreprise = "date_creation_entreprise"
        case dirigeants
        case effectifEntreprise = "effectif_entreprise"
        case formeJuridique = "forme_juridique"
        case nombreTotalEtablissements = "nombre_total_etablissements"
        case siren
        case tvaIntracommunautaire = "tva_intracommunautaire"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        adresseSiege = try container.decodeIfPresent(.adresseSiege)
        autresDenominations = try container.decodeArrayIfPresent(.autresDenominations)
        autresEtablissements = try container.decodeArrayIfPresent(.autresEtablissements)
        capitalSocial = try container.decodeIfPresent(.capitalSocial)
        dateCreationEntreprise = try container.decodeIfPresent(.dateCreationEntreprise)
        dirigeants = try container.decodeArrayIfPresent(.dirigeants)
        effectifEntreprise = try container.decodeIfPresent(.effectifEntreprise)
        formeJuridique = try container.decodeIfPresent(.formeJuridique)
        nombreTotalEtablissements = try container.decodeIfPresent(.nombreTotalEtablissements)
        siren = try container.decodeIfPresent(.siren)
        tvaIntracommunautaire = try container.decodeIfPresent(.tvaIntracommunautaire)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(adresseSiege, forKey: .adresseSiege)
        try container.encodeIfPresent(autresDenominations, forKey: .autresDenominations)
        try container.encodeIfPresent(autresEtablissements, forKey: .autresEtablissements)
        try container.encodeIfPresent(capitalSocial, forKey: .capitalSocial)
        try container.encodeIfPresent(dateCreationEntreprise, forKey: .dateCreationEntreprise)
        try container.encodeIfPresent(dirigeants, forKey: .dirigeants)
        try container.encodeIfPresent(effectifEntreprise, forKey: .effectifEntreprise)
        try container.encodeIfPresent(formeJuridique, forKey: .formeJuridique)
        try container.encodeIfPresent(nombreTotalEtablissements, forKey: .nombreTotalEtablissements)
        try container.encodeIfPresent(siren, forKey: .siren)
        try container.encodeIfPresent(tvaIntracommunautaire, forKey: .tvaIntracommunautaire)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInformationsEntrepriseApiInscriptionOrcFD else { return false }
      guard self.adresseSiege == object.adresseSiege else { return false }
      guard self.autresDenominations == object.autresDenominations else { return false }
      guard self.autresEtablissements == object.autresEtablissements else { return false }
      guard self.capitalSocial == object.capitalSocial else { return false }
      guard self.dateCreationEntreprise == object.dateCreationEntreprise else { return false }
      guard self.dirigeants == object.dirigeants else { return false }
      guard self.effectifEntreprise == object.effectifEntreprise else { return false }
      guard self.formeJuridique == object.formeJuridique else { return false }
      guard self.nombreTotalEtablissements == object.nombreTotalEtablissements else { return false }
      guard self.siren == object.siren else { return false }
      guard self.tvaIntracommunautaire == object.tvaIntracommunautaire else { return false }
      return true
    }

    public static func == (lhs: SKRInformationsEntrepriseApiInscriptionOrcFD, rhs: SKRInformationsEntrepriseApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRB2BOrcFD: StargateKitModel {

    public var chiffresClefs: SKRChiffresClefsApiInscriptionOrcFD?

    public var contacts: [SKRContactsB2BApiInscriptionOrcFD]?

    public var informationsEntreprise: SKRInformationsEntrepriseApiInscriptionOrcFD?

    public var informationsEtablissement: SKRInformationsEtablissementApiInscriptionOrcFD?

    public var nousRencontrer: [SKRNousRencontrerApiInscriptionOrcFD]?

    public var produitsServicesMateriel: [String]?

    public init(chiffresClefs: SKRChiffresClefsApiInscriptionOrcFD? = nil, contacts: [SKRContactsB2BApiInscriptionOrcFD]? = nil, informationsEntreprise: SKRInformationsEntrepriseApiInscriptionOrcFD? = nil, informationsEtablissement: SKRInformationsEtablissementApiInscriptionOrcFD? = nil, nousRencontrer: [SKRNousRencontrerApiInscriptionOrcFD]? = nil, produitsServicesMateriel: [String]? = nil) {
        self.chiffresClefs = chiffresClefs
        self.contacts = contacts
        self.informationsEntreprise = informationsEntreprise
        self.informationsEtablissement = informationsEtablissement
        self.nousRencontrer = nousRencontrer
        self.produitsServicesMateriel = produitsServicesMateriel
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case chiffresClefs = "chiffres_clefs"
        case contacts
        case informationsEntreprise = "informations_entreprise"
        case informationsEtablissement = "informations_etablissement"
        case nousRencontrer = "nous_rencontrer"
        case produitsServicesMateriel = "produits_services_materiel"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        chiffresClefs = try container.decodeIfPresent(.chiffresClefs)
        contacts = try container.decodeArrayIfPresent(.contacts)
        informationsEntreprise = try container.decodeIfPresent(.informationsEntreprise)
        informationsEtablissement = try container.decodeIfPresent(.informationsEtablissement)
        nousRencontrer = try container.decodeArrayIfPresent(.nousRencontrer)
        produitsServicesMateriel = try container.decodeArrayIfPresent(.produitsServicesMateriel)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(chiffresClefs, forKey: .chiffresClefs)
        try container.encodeIfPresent(contacts, forKey: .contacts)
        try container.encodeIfPresent(informationsEntreprise, forKey: .informationsEntreprise)
        try container.encodeIfPresent(informationsEtablissement, forKey: .informationsEtablissement)
        try container.encodeIfPresent(nousRencontrer, forKey: .nousRencontrer)
        try container.encodeIfPresent(produitsServicesMateriel, forKey: .produitsServicesMateriel)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRB2BOrcFD else { return false }
      guard self.chiffresClefs == object.chiffresClefs else { return false }
      guard self.contacts == object.contacts else { return false }
      guard self.informationsEntreprise == object.informationsEntreprise else { return false }
      guard self.informationsEtablissement == object.informationsEtablissement else { return false }
      guard self.nousRencontrer == object.nousRencontrer else { return false }
      guard self.produitsServicesMateriel == object.produitsServicesMateriel else { return false }
      return true
    }

    public static func == (lhs: SKRB2BOrcFD, rhs: SKRB2BOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

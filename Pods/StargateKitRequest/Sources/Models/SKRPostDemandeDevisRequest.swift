/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPostDemandeDevisRequest: StargateKitModel {

    public var blocId: String?

    public var codeRubrique: String?

    public var consentement: Bool?

    public var description: String?

    public var device: String?

    public var etabCode: String?

    public var expediteur: String?

    public var nom: String?

    public var prenom: String?

    public var proprietaire: Bool?

    public var telephone: String?

    public var token: String?

    public var typeBatiment: String?

    public var ville: String?

    public init(blocId: String? = nil, codeRubrique: String? = nil, consentement: Bool? = nil, description: String? = nil, device: String? = nil, etabCode: String? = nil, expediteur: String? = nil, nom: String? = nil, prenom: String? = nil, proprietaire: Bool? = nil, telephone: String? = nil, token: String? = nil, typeBatiment: String? = nil, ville: String? = nil) {
        self.blocId = blocId
        self.codeRubrique = codeRubrique
        self.consentement = consentement
        self.description = description
        self.device = device
        self.etabCode = etabCode
        self.expediteur = expediteur
        self.nom = nom
        self.prenom = prenom
        self.proprietaire = proprietaire
        self.telephone = telephone
        self.token = token
        self.typeBatiment = typeBatiment
        self.ville = ville
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case blocId = "bloc_id"
        case codeRubrique = "code_rubrique"
        case consentement
        case description
        case device
        case etabCode = "etab_code"
        case expediteur
        case nom
        case prenom
        case proprietaire
        case telephone
        case token
        case typeBatiment = "type_batiment"
        case ville
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        blocId = try container.decodeIfPresent(.blocId)
        codeRubrique = try container.decodeIfPresent(.codeRubrique)
        consentement = try container.decodeIfPresent(.consentement)
        description = try container.decodeIfPresent(.description)
        device = try container.decodeIfPresent(.device)
        etabCode = try container.decodeIfPresent(.etabCode)
        expediteur = try container.decodeIfPresent(.expediteur)
        nom = try container.decodeIfPresent(.nom)
        prenom = try container.decodeIfPresent(.prenom)
        proprietaire = try container.decodeIfPresent(.proprietaire)
        telephone = try container.decodeIfPresent(.telephone)
        token = try container.decodeIfPresent(.token)
        typeBatiment = try container.decodeIfPresent(.typeBatiment)
        ville = try container.decodeIfPresent(.ville)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(blocId, forKey: .blocId)
        try container.encodeIfPresent(codeRubrique, forKey: .codeRubrique)
        try container.encodeIfPresent(consentement, forKey: .consentement)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(device, forKey: .device)
        try container.encodeIfPresent(etabCode, forKey: .etabCode)
        try container.encodeIfPresent(expediteur, forKey: .expediteur)
        try container.encodeIfPresent(nom, forKey: .nom)
        try container.encodeIfPresent(prenom, forKey: .prenom)
        try container.encodeIfPresent(proprietaire, forKey: .proprietaire)
        try container.encodeIfPresent(telephone, forKey: .telephone)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(typeBatiment, forKey: .typeBatiment)
        try container.encodeIfPresent(ville, forKey: .ville)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPostDemandeDevisRequest else { return false }
      guard self.blocId == object.blocId else { return false }
      guard self.codeRubrique == object.codeRubrique else { return false }
      guard self.consentement == object.consentement else { return false }
      guard self.description == object.description else { return false }
      guard self.device == object.device else { return false }
      guard self.etabCode == object.etabCode else { return false }
      guard self.expediteur == object.expediteur else { return false }
      guard self.nom == object.nom else { return false }
      guard self.prenom == object.prenom else { return false }
      guard self.proprietaire == object.proprietaire else { return false }
      guard self.telephone == object.telephone else { return false }
      guard self.token == object.token else { return false }
      guard self.typeBatiment == object.typeBatiment else { return false }
      guard self.ville == object.ville else { return false }
      return true
    }

    public static func == (lhs: SKRPostDemandeDevisRequest, rhs: SKRPostDemandeDevisRequest) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

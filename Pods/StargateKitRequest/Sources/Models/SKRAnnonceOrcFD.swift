/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAnnonceOrcFD: StargateKitModel {

    public enum SKRTypeAnnonce: String, Codable, Hashable, CaseIterable {
        case auto = "AUTO"
        case moto = "MOTO"
        case immo = "IMMO"
    }

    public enum SKRTypePpp: String, Codable, Hashable, CaseIterable {
        case produitService = "PRODUIT_SERVICE"
        case annonceImmo = "ANNONCE_IMMO"
        case annonceAuto = "ANNONCE_AUTO"
        case annonceMoto = "ANNONCE_MOTO"
        case bonPlan = "BON_PLAN"
    }

    public var dateMiseaJour: DateTime?

    public var description: String?

    public var identifiantClientAj: String?

    public var identifiantPpp: String?

    public var prix: Double?

    public var referencePartenaire: String?

    public var telephone: String?

    public var titre: String?

    public var titreDetail: String?

    public var typeAnnonce: SKRTypeAnnonce?

    public var typePpp: SKRTypePpp?

    public var visuels: [SKRVisuelPPPApiInscriptionOrcFD]?

    public init(dateMiseaJour: DateTime? = nil, description: String? = nil, identifiantClientAj: String? = nil, identifiantPpp: String? = nil, prix: Double? = nil, referencePartenaire: String? = nil, telephone: String? = nil, titre: String? = nil, titreDetail: String? = nil, typeAnnonce: SKRTypeAnnonce? = nil, typePpp: SKRTypePpp? = nil, visuels: [SKRVisuelPPPApiInscriptionOrcFD]? = nil) {
        self.dateMiseaJour = dateMiseaJour
        self.description = description
        self.identifiantClientAj = identifiantClientAj
        self.identifiantPpp = identifiantPpp
        self.prix = prix
        self.referencePartenaire = referencePartenaire
        self.telephone = telephone
        self.titre = titre
        self.titreDetail = titreDetail
        self.typeAnnonce = typeAnnonce
        self.typePpp = typePpp
        self.visuels = visuels
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dateMiseaJour = "date_mise_a_jour"
        case description
        case identifiantClientAj = "identifiant_client_aj"
        case identifiantPpp = "identifiant_ppp"
        case prix
        case referencePartenaire = "reference_partenaire"
        case telephone
        case titre
        case titreDetail = "titre_detail"
        case typeAnnonce = "type_annonce"
        case typePpp = "type_ppp"
        case visuels
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dateMiseaJour = try container.decodeIfPresent(.dateMiseaJour)
        description = try container.decodeIfPresent(.description)
        identifiantClientAj = try container.decodeIfPresent(.identifiantClientAj)
        identifiantPpp = try container.decodeIfPresent(.identifiantPpp)
        prix = try container.decodeIfPresent(.prix)
        referencePartenaire = try container.decodeIfPresent(.referencePartenaire)
        telephone = try container.decodeIfPresent(.telephone)
        titre = try container.decodeIfPresent(.titre)
        titreDetail = try container.decodeIfPresent(.titreDetail)
        typeAnnonce = try container.decodeIfPresent(.typeAnnonce)
        typePpp = try container.decodeIfPresent(.typePpp)
        visuels = try container.decodeArrayIfPresent(.visuels)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dateMiseaJour, forKey: .dateMiseaJour)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(identifiantClientAj, forKey: .identifiantClientAj)
        try container.encodeIfPresent(identifiantPpp, forKey: .identifiantPpp)
        try container.encodeIfPresent(prix, forKey: .prix)
        try container.encodeIfPresent(referencePartenaire, forKey: .referencePartenaire)
        try container.encodeIfPresent(telephone, forKey: .telephone)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(titreDetail, forKey: .titreDetail)
        try container.encodeIfPresent(typeAnnonce, forKey: .typeAnnonce)
        try container.encodeIfPresent(typePpp, forKey: .typePpp)
        try container.encodeIfPresent(visuels, forKey: .visuels)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAnnonceOrcFD else { return false }
      guard self.dateMiseaJour == object.dateMiseaJour else { return false }
      guard self.description == object.description else { return false }
      guard self.identifiantClientAj == object.identifiantClientAj else { return false }
      guard self.identifiantPpp == object.identifiantPpp else { return false }
      guard self.prix == object.prix else { return false }
      guard self.referencePartenaire == object.referencePartenaire else { return false }
      guard self.telephone == object.telephone else { return false }
      guard self.titre == object.titre else { return false }
      guard self.titreDetail == object.titreDetail else { return false }
      guard self.typeAnnonce == object.typeAnnonce else { return false }
      guard self.typePpp == object.typePpp else { return false }
      guard self.visuels == object.visuels else { return false }
      return true
    }

    public static func == (lhs: SKRAnnonceOrcFD, rhs: SKRAnnonceOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

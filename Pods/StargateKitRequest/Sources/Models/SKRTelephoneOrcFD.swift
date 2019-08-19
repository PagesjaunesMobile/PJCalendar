/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTelephoneOrcFD: StargateKitModel {

    public enum SKREquipement: String, Codable, Hashable, CaseIterable {
        case telephone = "TELEPHONE"
        case telephoneFax = "TELEPHONE_FAX"
        case fax = "FAX"
    }

    public enum SKRTarification: String, Codable, Hashable, CaseIterable {
        case normale = "NORMALE"
        case tarifSpecial = "TARIF_SPECIAL"
        case nonSurtaxe = "NON_SURTAXE"
    }

    public enum SKRTypeTarifSpecial: String, Codable, Hashable, CaseIterable {
        case a = "A"
        case b = "B"
        case c = "C"
        case d = "D"
        case e = "E"
        case f = "F"
        case g = "G"
        case h = "H"
        case j = "J"
        case i = "I"
        case k = "K"
        case l = "L"
        case m = "M"
        case n = "N"
        case o = "O"
        case p = "P"
    }

    public var categorieNumero: String?

    public var equipement: SKREquipement?

    public var informationMagique: String?

    public var inscriptionPayante: Bool?

    public var libelle: String?

    public var mentionTarifaire: String?

    public var numero: String?

    public var numeroSansMagique: String?

    public var opposeMarketingDirect: Bool?

    public var tarification: SKRTarification?

    public var typeTarifSpecial: SKRTypeTarifSpecial?

    public init(categorieNumero: String? = nil, equipement: SKREquipement? = nil, informationMagique: String? = nil, inscriptionPayante: Bool? = nil, libelle: String? = nil, mentionTarifaire: String? = nil, numero: String? = nil, numeroSansMagique: String? = nil, opposeMarketingDirect: Bool? = nil, tarification: SKRTarification? = nil, typeTarifSpecial: SKRTypeTarifSpecial? = nil) {
        self.categorieNumero = categorieNumero
        self.equipement = equipement
        self.informationMagique = informationMagique
        self.inscriptionPayante = inscriptionPayante
        self.libelle = libelle
        self.mentionTarifaire = mentionTarifaire
        self.numero = numero
        self.numeroSansMagique = numeroSansMagique
        self.opposeMarketingDirect = opposeMarketingDirect
        self.tarification = tarification
        self.typeTarifSpecial = typeTarifSpecial
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case categorieNumero = "categorie_numero"
        case equipement
        case informationMagique = "information_magique"
        case inscriptionPayante = "inscription_payante"
        case libelle
        case mentionTarifaire = "mention_tarifaire"
        case numero
        case numeroSansMagique = "numero_sans_magique"
        case opposeMarketingDirect = "oppose_marketing_direct"
        case tarification
        case typeTarifSpecial = "type_tarif_special"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        categorieNumero = try container.decodeIfPresent(.categorieNumero)
        equipement = try container.decodeIfPresent(.equipement)
        informationMagique = try container.decodeIfPresent(.informationMagique)
        inscriptionPayante = try container.decodeIfPresent(.inscriptionPayante)
        libelle = try container.decodeIfPresent(.libelle)
        mentionTarifaire = try container.decodeIfPresent(.mentionTarifaire)
        numero = try container.decodeIfPresent(.numero)
        numeroSansMagique = try container.decodeIfPresent(.numeroSansMagique)
        opposeMarketingDirect = try container.decodeIfPresent(.opposeMarketingDirect)
        tarification = try container.decodeIfPresent(.tarification)
        typeTarifSpecial = try container.decodeIfPresent(.typeTarifSpecial)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(categorieNumero, forKey: .categorieNumero)
        try container.encodeIfPresent(equipement, forKey: .equipement)
        try container.encodeIfPresent(informationMagique, forKey: .informationMagique)
        try container.encodeIfPresent(inscriptionPayante, forKey: .inscriptionPayante)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(mentionTarifaire, forKey: .mentionTarifaire)
        try container.encodeIfPresent(numero, forKey: .numero)
        try container.encodeIfPresent(numeroSansMagique, forKey: .numeroSansMagique)
        try container.encodeIfPresent(opposeMarketingDirect, forKey: .opposeMarketingDirect)
        try container.encodeIfPresent(tarification, forKey: .tarification)
        try container.encodeIfPresent(typeTarifSpecial, forKey: .typeTarifSpecial)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTelephoneOrcFD else { return false }
      guard self.categorieNumero == object.categorieNumero else { return false }
      guard self.equipement == object.equipement else { return false }
      guard self.informationMagique == object.informationMagique else { return false }
      guard self.inscriptionPayante == object.inscriptionPayante else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.mentionTarifaire == object.mentionTarifaire else { return false }
      guard self.numero == object.numero else { return false }
      guard self.numeroSansMagique == object.numeroSansMagique else { return false }
      guard self.opposeMarketingDirect == object.opposeMarketingDirect else { return false }
      guard self.tarification == object.tarification else { return false }
      guard self.typeTarifSpecial == object.typeTarifSpecial else { return false }
      return true
    }

    public static func == (lhs: SKRTelephoneOrcFD, rhs: SKRTelephoneOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

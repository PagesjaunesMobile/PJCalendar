/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRChamp: StargateKitModel {

    public var choix: [String]?

    public var choixDouble: [SKRChampChoixOrcRdv]?

    public var estCapitalize: Bool?

    public var estNettoyable: Bool?

    public var estObligatoire: Bool?

    public var estUppercase: Bool?

    public var libelle: String?

    public var nbLigne: Int?

    public var nom: String?

    public var tailleMax: Int?

    public var tailleMin: Int?

    public var type: String?

    public var valeurDefaut: String?

    public init(choix: [String]? = nil, choixDouble: [SKRChampChoixOrcRdv]? = nil, estCapitalize: Bool? = nil, estNettoyable: Bool? = nil, estObligatoire: Bool? = nil, estUppercase: Bool? = nil, libelle: String? = nil, nbLigne: Int? = nil, nom: String? = nil, tailleMax: Int? = nil, tailleMin: Int? = nil, type: String? = nil, valeurDefaut: String? = nil) {
        self.choix = choix
        self.choixDouble = choixDouble
        self.estCapitalize = estCapitalize
        self.estNettoyable = estNettoyable
        self.estObligatoire = estObligatoire
        self.estUppercase = estUppercase
        self.libelle = libelle
        self.nbLigne = nbLigne
        self.nom = nom
        self.tailleMax = tailleMax
        self.tailleMin = tailleMin
        self.type = type
        self.valeurDefaut = valeurDefaut
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case choix
        case choixDouble
        case estCapitalize = "est_capitalize"
        case estNettoyable = "est_nettoyable"
        case estObligatoire = "est_obligatoire"
        case estUppercase = "est_uppercase"
        case libelle
        case nbLigne = "nb_ligne"
        case nom
        case tailleMax = "taille_max"
        case tailleMin = "taille_min"
        case type
        case valeurDefaut = "valeur_defaut"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        choix = try container.decodeArrayIfPresent(.choix)
        choixDouble = try container.decodeArrayIfPresent(.choixDouble)
        estCapitalize = try container.decodeIfPresent(.estCapitalize)
        estNettoyable = try container.decodeIfPresent(.estNettoyable)
        estObligatoire = try container.decodeIfPresent(.estObligatoire)
        estUppercase = try container.decodeIfPresent(.estUppercase)
        libelle = try container.decodeIfPresent(.libelle)
        nbLigne = try container.decodeIfPresent(.nbLigne)
        nom = try container.decodeIfPresent(.nom)
        tailleMax = try container.decodeIfPresent(.tailleMax)
        tailleMin = try container.decodeIfPresent(.tailleMin)
        type = try container.decodeIfPresent(.type)
        valeurDefaut = try container.decodeIfPresent(.valeurDefaut)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(choix, forKey: .choix)
        try container.encodeIfPresent(choixDouble, forKey: .choixDouble)
        try container.encodeIfPresent(estCapitalize, forKey: .estCapitalize)
        try container.encodeIfPresent(estNettoyable, forKey: .estNettoyable)
        try container.encodeIfPresent(estObligatoire, forKey: .estObligatoire)
        try container.encodeIfPresent(estUppercase, forKey: .estUppercase)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(nbLigne, forKey: .nbLigne)
        try container.encodeIfPresent(nom, forKey: .nom)
        try container.encodeIfPresent(tailleMax, forKey: .tailleMax)
        try container.encodeIfPresent(tailleMin, forKey: .tailleMin)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(valeurDefaut, forKey: .valeurDefaut)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRChamp else { return false }
      guard self.choix == object.choix else { return false }
      guard self.choixDouble == object.choixDouble else { return false }
      guard self.estCapitalize == object.estCapitalize else { return false }
      guard self.estNettoyable == object.estNettoyable else { return false }
      guard self.estObligatoire == object.estObligatoire else { return false }
      guard self.estUppercase == object.estUppercase else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.nbLigne == object.nbLigne else { return false }
      guard self.nom == object.nom else { return false }
      guard self.tailleMax == object.tailleMax else { return false }
      guard self.tailleMin == object.tailleMin else { return false }
      guard self.type == object.type else { return false }
      guard self.valeurDefaut == object.valeurDefaut else { return false }
      return true
    }

    public static func == (lhs: SKRChamp, rhs: SKRChamp) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

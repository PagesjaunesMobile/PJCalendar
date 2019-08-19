/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContributeur: StargateKitModel {

    public var age: Int?

    public var dateNaissance: DateTime?

    public var departement: String?

    public var grade: String?

    public var idUtilisateur: Int?

    public var nbContributions: Int?

    public var pseudo: String?

    public var uRLAvatar: String?

    public var uRLFicheContributeur: String?

    public var ville: String?

    public init(age: Int? = nil, dateNaissance: DateTime? = nil, departement: String? = nil, grade: String? = nil, idUtilisateur: Int? = nil, nbContributions: Int? = nil, pseudo: String? = nil, uRLAvatar: String? = nil, uRLFicheContributeur: String? = nil, ville: String? = nil) {
        self.age = age
        self.dateNaissance = dateNaissance
        self.departement = departement
        self.grade = grade
        self.idUtilisateur = idUtilisateur
        self.nbContributions = nbContributions
        self.pseudo = pseudo
        self.uRLAvatar = uRLAvatar
        self.uRLFicheContributeur = uRLFicheContributeur
        self.ville = ville
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case age
        case dateNaissance = "date_naissance"
        case departement
        case grade
        case idUtilisateur = "id_utilisateur"
        case nbContributions = "nb_contributions"
        case pseudo
        case uRLAvatar = "url_avatar"
        case uRLFicheContributeur = "url_fiche_contributeur"
        case ville
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        age = try container.decodeIfPresent(.age)
        dateNaissance = try container.decodeIfPresent(.dateNaissance)
        departement = try container.decodeIfPresent(.departement)
        grade = try container.decodeIfPresent(.grade)
        idUtilisateur = try container.decodeIfPresent(.idUtilisateur)
        nbContributions = try container.decodeIfPresent(.nbContributions)
        pseudo = try container.decodeIfPresent(.pseudo)
        uRLAvatar = try container.decodeIfPresent(.uRLAvatar)
        uRLFicheContributeur = try container.decodeIfPresent(.uRLFicheContributeur)
        ville = try container.decodeIfPresent(.ville)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(age, forKey: .age)
        try container.encodeIfPresent(dateNaissance, forKey: .dateNaissance)
        try container.encodeIfPresent(departement, forKey: .departement)
        try container.encodeIfPresent(grade, forKey: .grade)
        try container.encodeIfPresent(idUtilisateur, forKey: .idUtilisateur)
        try container.encodeIfPresent(nbContributions, forKey: .nbContributions)
        try container.encodeIfPresent(pseudo, forKey: .pseudo)
        try container.encodeIfPresent(uRLAvatar, forKey: .uRLAvatar)
        try container.encodeIfPresent(uRLFicheContributeur, forKey: .uRLFicheContributeur)
        try container.encodeIfPresent(ville, forKey: .ville)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContributeur else { return false }
      guard self.age == object.age else { return false }
      guard self.dateNaissance == object.dateNaissance else { return false }
      guard self.departement == object.departement else { return false }
      guard self.grade == object.grade else { return false }
      guard self.idUtilisateur == object.idUtilisateur else { return false }
      guard self.nbContributions == object.nbContributions else { return false }
      guard self.pseudo == object.pseudo else { return false }
      guard self.uRLAvatar == object.uRLAvatar else { return false }
      guard self.uRLFicheContributeur == object.uRLFicheContributeur else { return false }
      guard self.ville == object.ville else { return false }
      return true
    }

    public static func == (lhs: SKRContributeur, rhs: SKRContributeur) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

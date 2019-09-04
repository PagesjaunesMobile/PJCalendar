/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAvisOrchInscriptionOrcFD: StargateKitModel {

    public var codeEntite: String?

    public var commentaire: String?

    public var dateExperience: DateTime?

    public var dateFinExperience: DateTime?

    public var datePublication: DateTime?

    public var droitReponse: SKRDroitReponseOrchInscriptionOrcFD?

    public var entite: SKREntiteOrchInscriptionOrcFD?

    public var id: String?

    public var justificatifValide: Bool?

    public var lesMoins: String?

    public var lesPlus: String?

    public var notations: [SKRNotationOrchInscriptionOrcFD]?

    public var noteGlobale: Int?

    public var rubrique: SKRRubriqueOrchInscriptionOrcFD?

    public var titre: String?

    public var utilisateur: SKRUtilisateurOrchInscriptionOrcFD?

    public init(codeEntite: String? = nil, commentaire: String? = nil, dateExperience: DateTime? = nil, dateFinExperience: DateTime? = nil, datePublication: DateTime? = nil, droitReponse: SKRDroitReponseOrchInscriptionOrcFD? = nil, entite: SKREntiteOrchInscriptionOrcFD? = nil, id: String? = nil, justificatifValide: Bool? = nil, lesMoins: String? = nil, lesPlus: String? = nil, notations: [SKRNotationOrchInscriptionOrcFD]? = nil, noteGlobale: Int? = nil, rubrique: SKRRubriqueOrchInscriptionOrcFD? = nil, titre: String? = nil, utilisateur: SKRUtilisateurOrchInscriptionOrcFD? = nil) {
        self.codeEntite = codeEntite
        self.commentaire = commentaire
        self.dateExperience = dateExperience
        self.dateFinExperience = dateFinExperience
        self.datePublication = datePublication
        self.droitReponse = droitReponse
        self.entite = entite
        self.id = id
        self.justificatifValide = justificatifValide
        self.lesMoins = lesMoins
        self.lesPlus = lesPlus
        self.notations = notations
        self.noteGlobale = noteGlobale
        self.rubrique = rubrique
        self.titre = titre
        self.utilisateur = utilisateur
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case codeEntite = "code_entite"
        case commentaire
        case dateExperience = "date_experience"
        case dateFinExperience = "date_fin_experience"
        case datePublication = "date_publication"
        case droitReponse = "droit_reponse"
        case entite
        case id
        case justificatifValide = "justificatif_valide"
        case lesMoins = "les_moins"
        case lesPlus = "les_plus"
        case notations
        case noteGlobale = "note_globale"
        case rubrique
        case titre
        case utilisateur
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        codeEntite = try container.decodeIfPresent(.codeEntite)
        commentaire = try container.decodeIfPresent(.commentaire)
        dateExperience = try container.decodeIfPresent(.dateExperience)
        dateFinExperience = try container.decodeIfPresent(.dateFinExperience)
        datePublication = try container.decodeIfPresent(.datePublication)
        droitReponse = try container.decodeIfPresent(.droitReponse)
        entite = try container.decodeIfPresent(.entite)
        id = try container.decodeIfPresent(.id)
        justificatifValide = try container.decodeIfPresent(.justificatifValide)
        lesMoins = try container.decodeIfPresent(.lesMoins)
        lesPlus = try container.decodeIfPresent(.lesPlus)
        notations = try container.decodeArrayIfPresent(.notations)
        noteGlobale = try container.decodeIfPresent(.noteGlobale)
        rubrique = try container.decodeIfPresent(.rubrique)
        titre = try container.decodeIfPresent(.titre)
        utilisateur = try container.decodeIfPresent(.utilisateur)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(codeEntite, forKey: .codeEntite)
        try container.encodeIfPresent(commentaire, forKey: .commentaire)
        try container.encodeIfPresent(dateExperience, forKey: .dateExperience)
        try container.encodeIfPresent(dateFinExperience, forKey: .dateFinExperience)
        try container.encodeIfPresent(datePublication, forKey: .datePublication)
        try container.encodeIfPresent(droitReponse, forKey: .droitReponse)
        try container.encodeIfPresent(entite, forKey: .entite)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(justificatifValide, forKey: .justificatifValide)
        try container.encodeIfPresent(lesMoins, forKey: .lesMoins)
        try container.encodeIfPresent(lesPlus, forKey: .lesPlus)
        try container.encodeIfPresent(notations, forKey: .notations)
        try container.encodeIfPresent(noteGlobale, forKey: .noteGlobale)
        try container.encodeIfPresent(rubrique, forKey: .rubrique)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(utilisateur, forKey: .utilisateur)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAvisOrchInscriptionOrcFD else { return false }
      guard self.codeEntite == object.codeEntite else { return false }
      guard self.commentaire == object.commentaire else { return false }
      guard self.dateExperience == object.dateExperience else { return false }
      guard self.dateFinExperience == object.dateFinExperience else { return false }
      guard self.datePublication == object.datePublication else { return false }
      guard self.droitReponse == object.droitReponse else { return false }
      guard self.entite == object.entite else { return false }
      guard self.id == object.id else { return false }
      guard self.justificatifValide == object.justificatifValide else { return false }
      guard self.lesMoins == object.lesMoins else { return false }
      guard self.lesPlus == object.lesPlus else { return false }
      guard self.notations == object.notations else { return false }
      guard self.noteGlobale == object.noteGlobale else { return false }
      guard self.rubrique == object.rubrique else { return false }
      guard self.titre == object.titre else { return false }
      guard self.utilisateur == object.utilisateur else { return false }
      return true
    }

    public static func == (lhs: SKRAvisOrchInscriptionOrcFD, rhs: SKRAvisOrchInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

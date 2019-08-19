/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContributionApiInscriptionOrcFD: StargateKitModel {

    public enum SKRTypeDateExperience: String, Codable, Hashable, CaseIterable {
        case dateSeule = "DATE_SEULE"
        case periode = "PERIODE"
    }

    public var appreciation: String?

    public var contributeur: SKRContributeur?

    public var dateDebutExperience: DateTime?

    public var dateExperience: DateTime?

    public var dateFinExperience: DateTime?

    public var datePublication: DateTime?

    public var droitDeReponse: SKRDroitDeReponseApiInscriptionOrcFD?

    public var idContribution: Int?

    public var idJustificatif: Int?

    public var lesMoins: String?

    public var lesPlus: String?

    public var marqueurExperience: Bool?

    public var noteGlobale: Int?

    public var notes: [SKRNoteApiInscriptionOrcFD]?

    public var rubrique: SKRRubriqueApiInscriptionOrcFD?

    public var titre: String?

    public var typeDateExperience: SKRTypeDateExperience?

    public init(appreciation: String? = nil, contributeur: SKRContributeur? = nil, dateDebutExperience: DateTime? = nil, dateExperience: DateTime? = nil, dateFinExperience: DateTime? = nil, datePublication: DateTime? = nil, droitDeReponse: SKRDroitDeReponseApiInscriptionOrcFD? = nil, idContribution: Int? = nil, idJustificatif: Int? = nil, lesMoins: String? = nil, lesPlus: String? = nil, marqueurExperience: Bool? = nil, noteGlobale: Int? = nil, notes: [SKRNoteApiInscriptionOrcFD]? = nil, rubrique: SKRRubriqueApiInscriptionOrcFD? = nil, titre: String? = nil, typeDateExperience: SKRTypeDateExperience? = nil) {
        self.appreciation = appreciation
        self.contributeur = contributeur
        self.dateDebutExperience = dateDebutExperience
        self.dateExperience = dateExperience
        self.dateFinExperience = dateFinExperience
        self.datePublication = datePublication
        self.droitDeReponse = droitDeReponse
        self.idContribution = idContribution
        self.idJustificatif = idJustificatif
        self.lesMoins = lesMoins
        self.lesPlus = lesPlus
        self.marqueurExperience = marqueurExperience
        self.noteGlobale = noteGlobale
        self.notes = notes
        self.rubrique = rubrique
        self.titre = titre
        self.typeDateExperience = typeDateExperience
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case appreciation
        case contributeur
        case dateDebutExperience = "date_debut_experience"
        case dateExperience = "date_experience"
        case dateFinExperience = "date_fin_experience"
        case datePublication = "date_publication"
        case droitDeReponse = "droit_de_reponse"
        case idContribution = "id_contribution"
        case idJustificatif = "id_justificatif"
        case lesMoins = "les_moins"
        case lesPlus = "les_plus"
        case marqueurExperience = "marqueur_experience"
        case noteGlobale = "note_globale"
        case notes
        case rubrique
        case titre
        case typeDateExperience = "type_date_experience"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        appreciation = try container.decodeIfPresent(.appreciation)
        contributeur = try container.decodeIfPresent(.contributeur)
        dateDebutExperience = try container.decodeIfPresent(.dateDebutExperience)
        dateExperience = try container.decodeIfPresent(.dateExperience)
        dateFinExperience = try container.decodeIfPresent(.dateFinExperience)
        datePublication = try container.decodeIfPresent(.datePublication)
        droitDeReponse = try container.decodeIfPresent(.droitDeReponse)
        idContribution = try container.decodeIfPresent(.idContribution)
        idJustificatif = try container.decodeIfPresent(.idJustificatif)
        lesMoins = try container.decodeIfPresent(.lesMoins)
        lesPlus = try container.decodeIfPresent(.lesPlus)
        marqueurExperience = try container.decodeIfPresent(.marqueurExperience)
        noteGlobale = try container.decodeIfPresent(.noteGlobale)
        notes = try container.decodeArrayIfPresent(.notes)
        rubrique = try container.decodeIfPresent(.rubrique)
        titre = try container.decodeIfPresent(.titre)
        typeDateExperience = try container.decodeIfPresent(.typeDateExperience)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(appreciation, forKey: .appreciation)
        try container.encodeIfPresent(contributeur, forKey: .contributeur)
        try container.encodeIfPresent(dateDebutExperience, forKey: .dateDebutExperience)
        try container.encodeIfPresent(dateExperience, forKey: .dateExperience)
        try container.encodeIfPresent(dateFinExperience, forKey: .dateFinExperience)
        try container.encodeIfPresent(datePublication, forKey: .datePublication)
        try container.encodeIfPresent(droitDeReponse, forKey: .droitDeReponse)
        try container.encodeIfPresent(idContribution, forKey: .idContribution)
        try container.encodeIfPresent(idJustificatif, forKey: .idJustificatif)
        try container.encodeIfPresent(lesMoins, forKey: .lesMoins)
        try container.encodeIfPresent(lesPlus, forKey: .lesPlus)
        try container.encodeIfPresent(marqueurExperience, forKey: .marqueurExperience)
        try container.encodeIfPresent(noteGlobale, forKey: .noteGlobale)
        try container.encodeIfPresent(notes, forKey: .notes)
        try container.encodeIfPresent(rubrique, forKey: .rubrique)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(typeDateExperience, forKey: .typeDateExperience)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContributionApiInscriptionOrcFD else { return false }
      guard self.appreciation == object.appreciation else { return false }
      guard self.contributeur == object.contributeur else { return false }
      guard self.dateDebutExperience == object.dateDebutExperience else { return false }
      guard self.dateExperience == object.dateExperience else { return false }
      guard self.dateFinExperience == object.dateFinExperience else { return false }
      guard self.datePublication == object.datePublication else { return false }
      guard self.droitDeReponse == object.droitDeReponse else { return false }
      guard self.idContribution == object.idContribution else { return false }
      guard self.idJustificatif == object.idJustificatif else { return false }
      guard self.lesMoins == object.lesMoins else { return false }
      guard self.lesPlus == object.lesPlus else { return false }
      guard self.marqueurExperience == object.marqueurExperience else { return false }
      guard self.noteGlobale == object.noteGlobale else { return false }
      guard self.notes == object.notes else { return false }
      guard self.rubrique == object.rubrique else { return false }
      guard self.titre == object.titre else { return false }
      guard self.typeDateExperience == object.typeDateExperience else { return false }
      return true
    }

    public static func == (lhs: SKRContributionApiInscriptionOrcFD, rhs: SKRContributionApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

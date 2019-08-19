/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDroitDeReponseApiInscriptionOrcFD: StargateKitModel {

    public enum SKREtatModeration: String, Codable, Hashable, CaseIterable {
        case enAttenteModeration = "EN_ATTENTE_MODERATION"
        case enAttentePriseEnCompte = "EN_ATTENTE_PRISE_EN_COMPTE"
        case publie = "PUBLIE"
        case refuse = "REFUSE"
    }

    public var dateCreation: DateTime?

    public var dateModification: DateTime?

    public var datePublication: DateTime?

    public var etatModeration: SKREtatModeration?

    public var idDdrScm: Int?

    public var idDroitReponse: Int?

    public var mailProfessionnel: String?

    public var message: String?

    public init(dateCreation: DateTime? = nil, dateModification: DateTime? = nil, datePublication: DateTime? = nil, etatModeration: SKREtatModeration? = nil, idDdrScm: Int? = nil, idDroitReponse: Int? = nil, mailProfessionnel: String? = nil, message: String? = nil) {
        self.dateCreation = dateCreation
        self.dateModification = dateModification
        self.datePublication = datePublication
        self.etatModeration = etatModeration
        self.idDdrScm = idDdrScm
        self.idDroitReponse = idDroitReponse
        self.mailProfessionnel = mailProfessionnel
        self.message = message
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dateCreation = "date_creation"
        case dateModification = "date_modification"
        case datePublication = "date_publication"
        case etatModeration = "etat_moderation"
        case idDdrScm = "id_ddr_scm"
        case idDroitReponse = "id_droitReponse"
        case mailProfessionnel = "mail_professionnel"
        case message
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dateCreation = try container.decodeIfPresent(.dateCreation)
        dateModification = try container.decodeIfPresent(.dateModification)
        datePublication = try container.decodeIfPresent(.datePublication)
        etatModeration = try container.decodeIfPresent(.etatModeration)
        idDdrScm = try container.decodeIfPresent(.idDdrScm)
        idDroitReponse = try container.decodeIfPresent(.idDroitReponse)
        mailProfessionnel = try container.decodeIfPresent(.mailProfessionnel)
        message = try container.decodeIfPresent(.message)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dateCreation, forKey: .dateCreation)
        try container.encodeIfPresent(dateModification, forKey: .dateModification)
        try container.encodeIfPresent(datePublication, forKey: .datePublication)
        try container.encodeIfPresent(etatModeration, forKey: .etatModeration)
        try container.encodeIfPresent(idDdrScm, forKey: .idDdrScm)
        try container.encodeIfPresent(idDroitReponse, forKey: .idDroitReponse)
        try container.encodeIfPresent(mailProfessionnel, forKey: .mailProfessionnel)
        try container.encodeIfPresent(message, forKey: .message)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDroitDeReponseApiInscriptionOrcFD else { return false }
      guard self.dateCreation == object.dateCreation else { return false }
      guard self.dateModification == object.dateModification else { return false }
      guard self.datePublication == object.datePublication else { return false }
      guard self.etatModeration == object.etatModeration else { return false }
      guard self.idDdrScm == object.idDdrScm else { return false }
      guard self.idDroitReponse == object.idDroitReponse else { return false }
      guard self.mailProfessionnel == object.mailProfessionnel else { return false }
      guard self.message == object.message else { return false }
      return true
    }

    public static func == (lhs: SKRDroitDeReponseApiInscriptionOrcFD, rhs: SKRDroitDeReponseApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

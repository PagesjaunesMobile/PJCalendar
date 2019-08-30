/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFavori: StargateKitModel {

    public enum SKRStatut: String, Codable, Hashable, CaseIterable {
        case valide = "VALIDE"
        case modifie = "MODIFIE"
        case supprime = "SUPPRIME"
    }

    public var bloc: SKRBloc?

    public var code: String?

    public var codeAN9: String?

    public var codeCI: String?

    public var codeEtab: String?

    public var codeLoc: String?

    public var dateCreation: String?

    public var designationLigne: String?

    public var id: String?

    public var idMobile: String?

    public var msg: String?

    public var raisonSociale: String?

    public var statut: SKRStatut?

    public var title: String?

    public var userId: String?

    public init(bloc: SKRBloc? = nil, code: String? = nil, codeAN9: String? = nil, codeCI: String? = nil, codeEtab: String? = nil, codeLoc: String? = nil, dateCreation: String? = nil, designationLigne: String? = nil, id: String? = nil, idMobile: String? = nil, msg: String? = nil, raisonSociale: String? = nil, statut: SKRStatut? = nil, title: String? = nil, userId: String? = nil) {
        self.bloc = bloc
        self.code = code
        self.codeAN9 = codeAN9
        self.codeCI = codeCI
        self.codeEtab = codeEtab
        self.codeLoc = codeLoc
        self.dateCreation = dateCreation
        self.designationLigne = designationLigne
        self.id = id
        self.idMobile = idMobile
        self.msg = msg
        self.raisonSociale = raisonSociale
        self.statut = statut
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case bloc
        case code
        case codeAN9
        case codeCI
        case codeEtab
        case codeLoc
        case dateCreation
        case designationLigne
        case id
        case idMobile = "id_mobile"
        case msg
        case raisonSociale
        case statut
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        bloc = try container.decodeIfPresent(.bloc)
        code = try container.decodeIfPresent(.code)
        codeAN9 = try container.decodeIfPresent(.codeAN9)
        codeCI = try container.decodeIfPresent(.codeCI)
        codeEtab = try container.decodeIfPresent(.codeEtab)
        codeLoc = try container.decodeIfPresent(.codeLoc)
        dateCreation = try container.decodeIfPresent(.dateCreation)
        designationLigne = try container.decodeIfPresent(.designationLigne)
        id = try container.decodeIfPresent(.id)
        idMobile = try container.decodeIfPresent(.idMobile)
        msg = try container.decodeIfPresent(.msg)
        raisonSociale = try container.decodeIfPresent(.raisonSociale)
        statut = try container.decodeIfPresent(.statut)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(bloc, forKey: .bloc)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeAN9, forKey: .codeAN9)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(codeEtab, forKey: .codeEtab)
        try container.encodeIfPresent(codeLoc, forKey: .codeLoc)
        try container.encodeIfPresent(dateCreation, forKey: .dateCreation)
        try container.encodeIfPresent(designationLigne, forKey: .designationLigne)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(idMobile, forKey: .idMobile)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(raisonSociale, forKey: .raisonSociale)
        try container.encodeIfPresent(statut, forKey: .statut)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFavori else { return false }
      guard self.bloc == object.bloc else { return false }
      guard self.code == object.code else { return false }
      guard self.codeAN9 == object.codeAN9 else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.codeEtab == object.codeEtab else { return false }
      guard self.codeLoc == object.codeLoc else { return false }
      guard self.dateCreation == object.dateCreation else { return false }
      guard self.designationLigne == object.designationLigne else { return false }
      guard self.id == object.id else { return false }
      guard self.idMobile == object.idMobile else { return false }
      guard self.msg == object.msg else { return false }
      guard self.raisonSociale == object.raisonSociale else { return false }
      guard self.statut == object.statut else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRFavori, rhs: SKRFavori) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

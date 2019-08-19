/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResSynchronizeFavorites: StargateKitModel {

    public var ack: [SKRAck]?

    public var actions: [SKRAbstractFavoriAction]?

    public var code: String?

    public var codeCI: String?

    public var dateSynchronisation: DateTime?

    public var favori: [SKRFavori]?

    public var groupe: [SKRGroupe]?

    public var msg: String?

    public var nbMax: Int?

    public var title: String?

    public var token: String?

    public var userId: String?

    public init(ack: [SKRAck]? = nil, actions: [SKRAbstractFavoriAction]? = nil, code: String? = nil, codeCI: String? = nil, dateSynchronisation: DateTime? = nil, favori: [SKRFavori]? = nil, groupe: [SKRGroupe]? = nil, msg: String? = nil, nbMax: Int? = nil, title: String? = nil, token: String? = nil, userId: String? = nil) {
        self.ack = ack
        self.actions = actions
        self.code = code
        self.codeCI = codeCI
        self.dateSynchronisation = dateSynchronisation
        self.favori = favori
        self.groupe = groupe
        self.msg = msg
        self.nbMax = nbMax
        self.title = title
        self.token = token
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case ack
        case actions
        case code
        case codeCI
        case dateSynchronisation
        case favori
        case groupe
        case msg
        case nbMax
        case title
        case token
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        ack = try container.decodeArrayIfPresent(.ack)
        actions = try container.decodeArrayIfPresent(.actions)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        dateSynchronisation = try container.decodeIfPresent(.dateSynchronisation)
        favori = try container.decodeArrayIfPresent(.favori)
        groupe = try container.decodeArrayIfPresent(.groupe)
        msg = try container.decodeIfPresent(.msg)
        nbMax = try container.decodeIfPresent(.nbMax)
        title = try container.decodeIfPresent(.title)
        token = try container.decodeIfPresent(.token)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(ack, forKey: .ack)
        try container.encodeIfPresent(actions, forKey: .actions)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(dateSynchronisation, forKey: .dateSynchronisation)
        try container.encodeIfPresent(favori, forKey: .favori)
        try container.encodeIfPresent(groupe, forKey: .groupe)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(nbMax, forKey: .nbMax)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResSynchronizeFavorites else { return false }
      guard self.ack == object.ack else { return false }
      guard self.actions == object.actions else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.dateSynchronisation == object.dateSynchronisation else { return false }
      guard self.favori == object.favori else { return false }
      guard self.groupe == object.groupe else { return false }
      guard self.msg == object.msg else { return false }
      guard self.nbMax == object.nbMax else { return false }
      guard self.title == object.title else { return false }
      guard self.token == object.token else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResSynchronizeFavorites, rhs: SKRResSynchronizeFavorites) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

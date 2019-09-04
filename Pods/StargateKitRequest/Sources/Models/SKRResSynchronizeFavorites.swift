/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResSynchronizeFavorites: StargateKitModel {

    public var acks: [SKRAck]?

    public var actions: [SKRAbstractFavoriAction]?

    public var code: String?

    public var codeCI: String?

    public var dateSynchronisation: DateTime?

    public var favoris: [SKRFavori]?

    public var groupes: [SKRGroupe]?

    public var msg: String?

    public var nbMax: Int?

    public var title: String?

    public var token: String?

    public var userId: String?

    public init(acks: [SKRAck]? = nil, actions: [SKRAbstractFavoriAction]? = nil, code: String? = nil, codeCI: String? = nil, dateSynchronisation: DateTime? = nil, favoris: [SKRFavori]? = nil, groupes: [SKRGroupe]? = nil, msg: String? = nil, nbMax: Int? = nil, title: String? = nil, token: String? = nil, userId: String? = nil) {
        self.acks = acks
        self.actions = actions
        self.code = code
        self.codeCI = codeCI
        self.dateSynchronisation = dateSynchronisation
        self.favoris = favoris
        self.groupes = groupes
        self.msg = msg
        self.nbMax = nbMax
        self.title = title
        self.token = token
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case acks
        case actions
        case code
        case codeCI
        case dateSynchronisation
        case favoris
        case groupes
        case msg
        case nbMax
        case title
        case token
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        acks = try container.decodeArrayIfPresent(.acks)
        actions = try container.decodeArrayIfPresent(.actions)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        dateSynchronisation = try container.decodeIfPresent(.dateSynchronisation)
        favoris = try container.decodeArrayIfPresent(.favoris)
        groupes = try container.decodeArrayIfPresent(.groupes)
        msg = try container.decodeIfPresent(.msg)
        nbMax = try container.decodeIfPresent(.nbMax)
        title = try container.decodeIfPresent(.title)
        token = try container.decodeIfPresent(.token)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(acks, forKey: .acks)
        try container.encodeIfPresent(actions, forKey: .actions)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(dateSynchronisation, forKey: .dateSynchronisation)
        try container.encodeIfPresent(favoris, forKey: .favoris)
        try container.encodeIfPresent(groupes, forKey: .groupes)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(nbMax, forKey: .nbMax)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResSynchronizeFavorites else { return false }
      guard self.acks == object.acks else { return false }
      guard self.actions == object.actions else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.dateSynchronisation == object.dateSynchronisation else { return false }
      guard self.favoris == object.favoris else { return false }
      guard self.groupes == object.groupes else { return false }
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

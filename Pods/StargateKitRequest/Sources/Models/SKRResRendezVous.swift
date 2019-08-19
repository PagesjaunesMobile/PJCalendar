/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResRendezVous: StargateKitModel {

    public var code: String?

    public var codeCI: String?

    public var idRdv: String?

    public var msg: String?

    public var pushR: SKRPushR?

    public var rdv: SKRRdv?

    public var redirectUrl: String?

    public var rendezvous: SKRRendezvous?

    public var rendezvousOld: SKRRendezvousOld?

    public var tags: [SKRTag]?

    public var title: String?

    public var userId: String?

    public init(code: String? = nil, codeCI: String? = nil, idRdv: String? = nil, msg: String? = nil, pushR: SKRPushR? = nil, rdv: SKRRdv? = nil, redirectUrl: String? = nil, rendezvous: SKRRendezvous? = nil, rendezvousOld: SKRRendezvousOld? = nil, tags: [SKRTag]? = nil, title: String? = nil, userId: String? = nil) {
        self.code = code
        self.codeCI = codeCI
        self.idRdv = idRdv
        self.msg = msg
        self.pushR = pushR
        self.rdv = rdv
        self.redirectUrl = redirectUrl
        self.rendezvous = rendezvous
        self.rendezvousOld = rendezvousOld
        self.tags = tags
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case codeCI
        case idRdv = "id_rdv"
        case msg
        case pushR
        case rdv
        case redirectUrl
        case rendezvous
        case rendezvousOld = "rendezvous_old"
        case tags
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        idRdv = try container.decodeIfPresent(.idRdv)
        msg = try container.decodeIfPresent(.msg)
        pushR = try container.decodeIfPresent(.pushR)
        rdv = try container.decodeIfPresent(.rdv)
        redirectUrl = try container.decodeIfPresent(.redirectUrl)
        rendezvous = try container.decodeIfPresent(.rendezvous)
        rendezvousOld = try container.decodeIfPresent(.rendezvousOld)
        tags = try container.decodeArrayIfPresent(.tags)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(idRdv, forKey: .idRdv)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(pushR, forKey: .pushR)
        try container.encodeIfPresent(rdv, forKey: .rdv)
        try container.encodeIfPresent(redirectUrl, forKey: .redirectUrl)
        try container.encodeIfPresent(rendezvous, forKey: .rendezvous)
        try container.encodeIfPresent(rendezvousOld, forKey: .rendezvousOld)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResRendezVous else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.idRdv == object.idRdv else { return false }
      guard self.msg == object.msg else { return false }
      guard self.pushR == object.pushR else { return false }
      guard self.rdv == object.rdv else { return false }
      guard self.redirectUrl == object.redirectUrl else { return false }
      guard self.rendezvous == object.rendezvous else { return false }
      guard self.rendezvousOld == object.rendezvousOld else { return false }
      guard self.tags == object.tags else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResRendezVous, rhs: SKRResRendezVous) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRReqSynchronizeFavorites: StargateKitModel {

    public var actions: [SKRAbstractFavoriAction]?

    public var ajout: [SKRFavoriRequest]?

    public var dateDerniereSynchronisation: DateTime?

    public var suppression: [SKRFavoriRequest]?

    public var token: String?

    public init(actions: [SKRAbstractFavoriAction]? = nil, ajout: [SKRFavoriRequest]? = nil, dateDerniereSynchronisation: DateTime? = nil, suppression: [SKRFavoriRequest]? = nil, token: String? = nil) {
        self.actions = actions
        self.ajout = ajout
        self.dateDerniereSynchronisation = dateDerniereSynchronisation
        self.suppression = suppression
        self.token = token
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actions
        case ajout
        case dateDerniereSynchronisation
        case suppression
        case token
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actions = try container.decodeArrayIfPresent(.actions)
        ajout = try container.decodeArrayIfPresent(.ajout)
        dateDerniereSynchronisation = try container.decodeIfPresent(.dateDerniereSynchronisation)
        suppression = try container.decodeArrayIfPresent(.suppression)
        token = try container.decodeIfPresent(.token)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actions, forKey: .actions)
        try container.encodeIfPresent(ajout, forKey: .ajout)
        try container.encodeIfPresent(dateDerniereSynchronisation, forKey: .dateDerniereSynchronisation)
        try container.encodeIfPresent(suppression, forKey: .suppression)
        try container.encodeIfPresent(token, forKey: .token)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRReqSynchronizeFavorites else { return false }
      guard self.actions == object.actions else { return false }
      guard self.ajout == object.ajout else { return false }
      guard self.dateDerniereSynchronisation == object.dateDerniereSynchronisation else { return false }
      guard self.suppression == object.suppression else { return false }
      guard self.token == object.token else { return false }
      return true
    }

    public static func == (lhs: SKRReqSynchronizeFavorites, rhs: SKRReqSynchronizeFavorites) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

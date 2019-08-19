/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRReqSynchronizeFavorites: StargateKitModel {

    public var actions: [SKRAbstractFavoriAction]?

    public var ajoutFavoris: [SKRFavori]?

    public var dateDerniereSynchronisation: DateTime?

    public var suppressionFavoris: [SKRFavori]?

    public var token: String?

    public init(actions: [SKRAbstractFavoriAction]? = nil, ajoutFavoris: [SKRFavori]? = nil, dateDerniereSynchronisation: DateTime? = nil, suppressionFavoris: [SKRFavori]? = nil, token: String? = nil) {
        self.actions = actions
        self.ajoutFavoris = ajoutFavoris
        self.dateDerniereSynchronisation = dateDerniereSynchronisation
        self.suppressionFavoris = suppressionFavoris
        self.token = token
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actions
        case ajoutFavoris
        case dateDerniereSynchronisation
        case suppressionFavoris
        case token
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actions = try container.decodeArrayIfPresent(.actions)
        ajoutFavoris = try container.decodeArrayIfPresent(.ajoutFavoris)
        dateDerniereSynchronisation = try container.decodeIfPresent(.dateDerniereSynchronisation)
        suppressionFavoris = try container.decodeArrayIfPresent(.suppressionFavoris)
        token = try container.decodeIfPresent(.token)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actions, forKey: .actions)
        try container.encodeIfPresent(ajoutFavoris, forKey: .ajoutFavoris)
        try container.encodeIfPresent(dateDerniereSynchronisation, forKey: .dateDerniereSynchronisation)
        try container.encodeIfPresent(suppressionFavoris, forKey: .suppressionFavoris)
        try container.encodeIfPresent(token, forKey: .token)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRReqSynchronizeFavorites else { return false }
      guard self.actions == object.actions else { return false }
      guard self.ajoutFavoris == object.ajoutFavoris else { return false }
      guard self.dateDerniereSynchronisation == object.dateDerniereSynchronisation else { return false }
      guard self.suppressionFavoris == object.suppressionFavoris else { return false }
      guard self.token == object.token else { return false }
      return true
    }

    public static func == (lhs: SKRReqSynchronizeFavorites, rhs: SKRReqSynchronizeFavorites) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

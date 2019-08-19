/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRClick: StargateKitModel {

    public var action: String?

    public var cible: String?

    public var costCode: String?

    public var costLabel: String?

    public var costMention: String?

    public var url: String?

    public init(action: String? = nil, cible: String? = nil, costCode: String? = nil, costLabel: String? = nil, costMention: String? = nil, url: String? = nil) {
        self.action = action
        self.cible = cible
        self.costCode = costCode
        self.costLabel = costLabel
        self.costMention = costMention
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case action
        case cible
        case costCode
        case costLabel
        case costMention
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        action = try container.decodeIfPresent(.action)
        cible = try container.decodeIfPresent(.cible)
        costCode = try container.decodeIfPresent(.costCode)
        costLabel = try container.decodeIfPresent(.costLabel)
        costMention = try container.decodeIfPresent(.costMention)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(action, forKey: .action)
        try container.encodeIfPresent(cible, forKey: .cible)
        try container.encodeIfPresent(costCode, forKey: .costCode)
        try container.encodeIfPresent(costLabel, forKey: .costLabel)
        try container.encodeIfPresent(costMention, forKey: .costMention)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRClick else { return false }
      guard self.action == object.action else { return false }
      guard self.cible == object.cible else { return false }
      guard self.costCode == object.costCode else { return false }
      guard self.costLabel == object.costLabel else { return false }
      guard self.costMention == object.costMention else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRClick, rhs: SKRClick) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

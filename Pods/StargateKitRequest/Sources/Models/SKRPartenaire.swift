/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPartenaire: StargateKitModel {

    public var action: [SKRAction]?

    public var id: String?

    public var label: String?

    public var message: String?

    public var name: String?

    public var title: String?

    public init(action: [SKRAction]? = nil, id: String? = nil, label: String? = nil, message: String? = nil, name: String? = nil, title: String? = nil) {
        self.action = action
        self.id = id
        self.label = label
        self.message = message
        self.name = name
        self.title = title
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case action
        case id
        case label
        case message
        case name
        case title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        action = try container.decodeArrayIfPresent(.action)
        id = try container.decodeIfPresent(.id)
        label = try container.decodeIfPresent(.label)
        message = try container.decodeIfPresent(.message)
        name = try container.decodeIfPresent(.name)
        title = try container.decodeIfPresent(.title)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(action, forKey: .action)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(message, forKey: .message)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(title, forKey: .title)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPartenaire else { return false }
      guard self.action == object.action else { return false }
      guard self.id == object.id else { return false }
      guard self.label == object.label else { return false }
      guard self.message == object.message else { return false }
      guard self.name == object.name else { return false }
      guard self.title == object.title else { return false }
      return true
    }

    public static func == (lhs: SKRPartenaire, rhs: SKRPartenaire) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

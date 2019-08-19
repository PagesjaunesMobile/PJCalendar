/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAction: StargateKitModel {

    public var buttonLabel: String?

    public var message: String?

    public var name: String?

    public var title: String?

    public var url: String?

    public init(buttonLabel: String? = nil, message: String? = nil, name: String? = nil, title: String? = nil, url: String? = nil) {
        self.buttonLabel = buttonLabel
        self.message = message
        self.name = name
        self.title = title
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case buttonLabel
        case message
        case name
        case title
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        buttonLabel = try container.decodeIfPresent(.buttonLabel)
        message = try container.decodeIfPresent(.message)
        name = try container.decodeIfPresent(.name)
        title = try container.decodeIfPresent(.title)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(buttonLabel, forKey: .buttonLabel)
        try container.encodeIfPresent(message, forKey: .message)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAction else { return false }
      guard self.buttonLabel == object.buttonLabel else { return false }
      guard self.message == object.message else { return false }
      guard self.name == object.name else { return false }
      guard self.title == object.title else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRAction, rhs: SKRAction) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

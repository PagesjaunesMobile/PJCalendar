/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRStatusContent: StargateKitModel {

    public var code: String?

    public var message: String?

    public init(code: String? = nil, message: String? = nil) {
        self.code = code
        self.message = message
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case message
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        message = try container.decodeIfPresent(.message)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(message, forKey: .message)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRStatusContent else { return false }
      guard self.code == object.code else { return false }
      guard self.message == object.message else { return false }
      return true
    }

    public static func == (lhs: SKRStatusContent, rhs: SKRStatusContent) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

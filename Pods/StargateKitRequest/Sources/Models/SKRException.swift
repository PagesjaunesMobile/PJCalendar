/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRException: StargateKitModel {

    public var `class`: String?

    public var stack: String?

    public var status: SKRStatus?

    public init(`class`: String? = nil, stack: String? = nil, status: SKRStatus? = nil) {
        self.`class` = `class`
        self.stack = stack
        self.status = status
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case `class` = "class"
        case stack
        case status
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        `class` = try container.decodeIfPresent(.`class`)
        stack = try container.decodeIfPresent(.stack)
        status = try container.decodeIfPresent(.status)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(`class`, forKey: .`class`)
        try container.encodeIfPresent(stack, forKey: .stack)
        try container.encodeIfPresent(status, forKey: .status)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRException else { return false }
      guard self.`class` == object.`class` else { return false }
      guard self.stack == object.stack else { return false }
      guard self.status == object.status else { return false }
      return true
    }

    public static func == (lhs: SKRException, rhs: SKRException) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

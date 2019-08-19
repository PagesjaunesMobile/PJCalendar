/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRStatus: StargateKitModel {

    public var statusContent: [SKRStatusContent]?

    public init(statusContent: [SKRStatusContent]? = nil) {
        self.statusContent = statusContent
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case statusContent = "status_content"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        statusContent = try container.decodeArrayIfPresent(.statusContent)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(statusContent, forKey: .statusContent)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRStatus else { return false }
      guard self.statusContent == object.statusContent else { return false }
      return true
    }

    public static func == (lhs: SKRStatus, rhs: SKRStatus) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

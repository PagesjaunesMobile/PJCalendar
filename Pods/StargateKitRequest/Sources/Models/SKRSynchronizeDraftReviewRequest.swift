/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSynchronizeDraftReviewRequest: StargateKitModel {

    public var drafts: [SKRDraft]?

    public var token: String?

    public init(drafts: [SKRDraft]? = nil, token: String? = nil) {
        self.drafts = drafts
        self.token = token
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case drafts
        case token
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        drafts = try container.decodeArrayIfPresent(.drafts)
        token = try container.decodeIfPresent(.token)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(drafts, forKey: .drafts)
        try container.encodeIfPresent(token, forKey: .token)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSynchronizeDraftReviewRequest else { return false }
      guard self.drafts == object.drafts else { return false }
      guard self.token == object.token else { return false }
      return true
    }

    public static func == (lhs: SKRSynchronizeDraftReviewRequest, rhs: SKRSynchronizeDraftReviewRequest) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

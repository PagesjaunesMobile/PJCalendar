/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSuggestionsStargate: StargateKitModel {

    public var label: String?

    public var suggestion: [SKRSuggestionStargate]?

    public init(label: String? = nil, suggestion: [SKRSuggestionStargate]? = nil) {
        self.label = label
        self.suggestion = suggestion
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case label
        case suggestion
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        label = try container.decodeIfPresent(.label)
        suggestion = try container.decodeArrayIfPresent(.suggestion)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(suggestion, forKey: .suggestion)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSuggestionsStargate else { return false }
      guard self.label == object.label else { return false }
      guard self.suggestion == object.suggestion else { return false }
      return true
    }

    public static func == (lhs: SKRSuggestionsStargate, rhs: SKRSuggestionsStargate) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

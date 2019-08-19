/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSuggestions: StargateKitModel {

    public var intervention: [SKRIntervention]?

    public var label: String?

    public var landingStep: String?

    public init(intervention: [SKRIntervention]? = nil, label: String? = nil, landingStep: String? = nil) {
        self.intervention = intervention
        self.label = label
        self.landingStep = landingStep
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case intervention
        case label
        case landingStep
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        intervention = try container.decodeArrayIfPresent(.intervention)
        label = try container.decodeIfPresent(.label)
        landingStep = try container.decodeIfPresent(.landingStep)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(intervention, forKey: .intervention)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(landingStep, forKey: .landingStep)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSuggestions else { return false }
      guard self.intervention == object.intervention else { return false }
      guard self.label == object.label else { return false }
      guard self.landingStep == object.landingStep else { return false }
      return true
    }

    public static func == (lhs: SKRSuggestions, rhs: SKRSuggestions) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

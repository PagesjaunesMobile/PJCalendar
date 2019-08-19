/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResInterventions: StargateKitModel {

    public var code: String?

    public var codeCI: String?

    public var intervention: [SKRIntervention]?

    public var landingStep: String?

    public var msg: String?

    public var title: String?

    public var userId: String?

    public init(code: String? = nil, codeCI: String? = nil, intervention: [SKRIntervention]? = nil, landingStep: String? = nil, msg: String? = nil, title: String? = nil, userId: String? = nil) {
        self.code = code
        self.codeCI = codeCI
        self.intervention = intervention
        self.landingStep = landingStep
        self.msg = msg
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case code
        case codeCI
        case intervention
        case landingStep
        case msg
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        intervention = try container.decodeArrayIfPresent(.intervention)
        landingStep = try container.decodeIfPresent(.landingStep)
        msg = try container.decodeIfPresent(.msg)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(intervention, forKey: .intervention)
        try container.encodeIfPresent(landingStep, forKey: .landingStep)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResInterventions else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.intervention == object.intervention else { return false }
      guard self.landingStep == object.landingStep else { return false }
      guard self.msg == object.msg else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResInterventions, rhs: SKRResInterventions) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDispoSanteResumes: StargateKitModel {

    public var resume: [SKRResume]?

    public var stitle: String?

    public init(resume: [SKRResume]? = nil, stitle: String? = nil) {
        self.resume = resume
        self.stitle = stitle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case resume
        case stitle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        resume = try container.decodeArrayIfPresent(.resume)
        stitle = try container.decodeIfPresent(.stitle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(resume, forKey: .resume)
        try container.encodeIfPresent(stitle, forKey: .stitle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDispoSanteResumes else { return false }
      guard self.resume == object.resume else { return false }
      guard self.stitle == object.stitle else { return false }
      return true
    }

    public static func == (lhs: SKRDispoSanteResumes, rhs: SKRDispoSanteResumes) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

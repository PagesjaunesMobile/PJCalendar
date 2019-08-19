/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRedirectionSEOOrcFD: StargateKitModel {

    public var codeHttp: Int?

    public init(codeHttp: Int? = nil) {
        self.codeHttp = codeHttp
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case codeHttp = "code_http"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        codeHttp = try container.decodeIfPresent(.codeHttp)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(codeHttp, forKey: .codeHttp)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRedirectionSEOOrcFD else { return false }
      guard self.codeHttp == object.codeHttp else { return false }
      return true
    }

    public static func == (lhs: SKRRedirectionSEOOrcFD, rhs: SKRRedirectionSEOOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

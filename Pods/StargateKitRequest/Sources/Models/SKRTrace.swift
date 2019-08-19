/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTrace: StargateKitModel {

    public var ci: SKRCi?

    public var reqPertimmPrincipal: String?

    public var reqPertimmPrincipalDenombrement: [String]?

    public var reqPertimmRemplissage: String?

    public var yes: SKRYes?

    public init(ci: SKRCi? = nil, reqPertimmPrincipal: String? = nil, reqPertimmPrincipalDenombrement: [String]? = nil, reqPertimmRemplissage: String? = nil, yes: SKRYes? = nil) {
        self.ci = ci
        self.reqPertimmPrincipal = reqPertimmPrincipal
        self.reqPertimmPrincipalDenombrement = reqPertimmPrincipalDenombrement
        self.reqPertimmRemplissage = reqPertimmRemplissage
        self.yes = yes
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case ci
        case reqPertimmPrincipal = "req_pertimm_principal"
        case reqPertimmPrincipalDenombrement = "req_pertimm_principal_denombrement"
        case reqPertimmRemplissage = "req_pertimm_remplissage"
        case yes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        ci = try container.decodeIfPresent(.ci)
        reqPertimmPrincipal = try container.decodeIfPresent(.reqPertimmPrincipal)
        reqPertimmPrincipalDenombrement = try container.decodeArrayIfPresent(.reqPertimmPrincipalDenombrement)
        reqPertimmRemplissage = try container.decodeIfPresent(.reqPertimmRemplissage)
        yes = try container.decodeIfPresent(.yes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(ci, forKey: .ci)
        try container.encodeIfPresent(reqPertimmPrincipal, forKey: .reqPertimmPrincipal)
        try container.encodeIfPresent(reqPertimmPrincipalDenombrement, forKey: .reqPertimmPrincipalDenombrement)
        try container.encodeIfPresent(reqPertimmRemplissage, forKey: .reqPertimmRemplissage)
        try container.encodeIfPresent(yes, forKey: .yes)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTrace else { return false }
      guard self.ci == object.ci else { return false }
      guard self.reqPertimmPrincipal == object.reqPertimmPrincipal else { return false }
      guard self.reqPertimmPrincipalDenombrement == object.reqPertimmPrincipalDenombrement else { return false }
      guard self.reqPertimmRemplissage == object.reqPertimmRemplissage else { return false }
      guard self.yes == object.yes else { return false }
      return true
    }

    public static func == (lhs: SKRTrace, rhs: SKRTrace) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

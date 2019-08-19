/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMoyensContactsDesignesOrcFD: StargateKitModel {

    public var designation: String?

    public var email: String?

    public var telephones: [SKRTelephoneOrcFD]?

    public init(designation: String? = nil, email: String? = nil, telephones: [SKRTelephoneOrcFD]? = nil) {
        self.designation = designation
        self.email = email
        self.telephones = telephones
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case designation
        case email
        case telephones
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        designation = try container.decodeIfPresent(.designation)
        email = try container.decodeIfPresent(.email)
        telephones = try container.decodeArrayIfPresent(.telephones)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(designation, forKey: .designation)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(telephones, forKey: .telephones)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMoyensContactsDesignesOrcFD else { return false }
      guard self.designation == object.designation else { return false }
      guard self.email == object.email else { return false }
      guard self.telephones == object.telephones else { return false }
      return true
    }

    public static func == (lhs: SKRMoyensContactsDesignesOrcFD, rhs: SKRMoyensContactsDesignesOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

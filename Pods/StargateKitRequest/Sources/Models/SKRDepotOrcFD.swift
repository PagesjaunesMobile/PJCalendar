/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDepotOrcFD: StargateKitModel {

    public var dateCloture: String?

    public var descriptif: String?

    public var type: String?

    public init(dateCloture: String? = nil, descriptif: String? = nil, type: String? = nil) {
        self.dateCloture = dateCloture
        self.descriptif = descriptif
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dateCloture = "date_cloture"
        case descriptif
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dateCloture = try container.decodeIfPresent(.dateCloture)
        descriptif = try container.decodeIfPresent(.descriptif)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dateCloture, forKey: .dateCloture)
        try container.encodeIfPresent(descriptif, forKey: .descriptif)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDepotOrcFD else { return false }
      guard self.dateCloture == object.dateCloture else { return false }
      guard self.descriptif == object.descriptif else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRDepotOrcFD, rhs: SKRDepotOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

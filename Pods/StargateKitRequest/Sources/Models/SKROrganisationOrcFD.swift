/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKROrganisationOrcFD: StargateKitModel {

    public var nombreServices: Int?

    public var services: [SKRService]?

    public init(nombreServices: Int? = nil, services: [SKRService]? = nil) {
        self.nombreServices = nombreServices
        self.services = services
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nombreServices = "nombre_services"
        case services
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nombreServices = try container.decodeIfPresent(.nombreServices)
        services = try container.decodeArrayIfPresent(.services)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(nombreServices, forKey: .nombreServices)
        try container.encodeIfPresent(services, forKey: .services)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKROrganisationOrcFD else { return false }
      guard self.nombreServices == object.nombreServices else { return false }
      guard self.services == object.services else { return false }
      return true
    }

    public static func == (lhs: SKROrganisationOrcFD, rhs: SKROrganisationOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

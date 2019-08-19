/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDispoSanteServices: StargateKitModel {

    public var service: [SKRService]?

    public var stitle: String?

    public init(service: [SKRService]? = nil, stitle: String? = nil) {
        self.service = service
        self.stitle = stitle
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case service
        case stitle
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        service = try container.decodeArrayIfPresent(.service)
        stitle = try container.decodeIfPresent(.stitle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(service, forKey: .service)
        try container.encodeIfPresent(stitle, forKey: .stitle)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDispoSanteServices else { return false }
      guard self.service == object.service else { return false }
      guard self.stitle == object.stitle else { return false }
      return true
    }

    public static func == (lhs: SKRDispoSanteServices, rhs: SKRDispoSanteServices) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

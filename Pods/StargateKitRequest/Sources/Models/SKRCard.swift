/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCard: StargateKitModel {

    public var lstDish: [SKRLstDish]

    public var title: String?

    public init(lstDish: [SKRLstDish], title: String? = nil) {
        self.lstDish = lstDish
        self.title = title
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case lstDish
        case title
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        lstDish = try container.decodeArray(.lstDish)
        title = try container.decodeIfPresent(.title)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(lstDish, forKey: .lstDish)
        try container.encodeIfPresent(title, forKey: .title)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCard else { return false }
      guard self.lstDish == object.lstDish else { return false }
      guard self.title == object.title else { return false }
      return true
    }

    public static func == (lhs: SKRCard, rhs: SKRCard) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

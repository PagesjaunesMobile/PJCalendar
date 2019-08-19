/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSearch: StargateKitModel {

    public var filters: [SKRFilters]?

    public var sorts: SKRSorts?

    public var trace: SKRTrace?

    public init(filters: [SKRFilters]? = nil, sorts: SKRSorts? = nil, trace: SKRTrace? = nil) {
        self.filters = filters
        self.sorts = sorts
        self.trace = trace
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case filters
        case sorts
        case trace
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        filters = try container.decodeArrayIfPresent(.filters)
        sorts = try container.decodeIfPresent(.sorts)
        trace = try container.decodeIfPresent(.trace)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(filters, forKey: .filters)
        try container.encodeIfPresent(sorts, forKey: .sorts)
        try container.encodeIfPresent(trace, forKey: .trace)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSearch else { return false }
      guard self.filters == object.filters else { return false }
      guard self.sorts == object.sorts else { return false }
      guard self.trace == object.trace else { return false }
      return true
    }

    public static func == (lhs: SKRSearch, rhs: SKRSearch) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

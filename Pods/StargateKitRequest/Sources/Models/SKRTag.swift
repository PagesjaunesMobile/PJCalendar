/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTag: StargateKitModel {

    public var destination: String?

    public var filter: String?

    public var label: String?

    public var sort: String?

    public var transacType: String?

    public var value: String?

    public init(destination: String? = nil, filter: String? = nil, label: String? = nil, sort: String? = nil, transacType: String? = nil, value: String? = nil) {
        self.destination = destination
        self.filter = filter
        self.label = label
        self.sort = sort
        self.transacType = transacType
        self.value = value
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case destination
        case filter
        case label
        case sort
        case transacType
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        destination = try container.decodeIfPresent(.destination)
        filter = try container.decodeIfPresent(.filter)
        label = try container.decodeIfPresent(.label)
        sort = try container.decodeIfPresent(.sort)
        transacType = try container.decodeIfPresent(.transacType)
        value = try container.decodeIfPresent(.value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(destination, forKey: .destination)
        try container.encodeIfPresent(filter, forKey: .filter)
        try container.encodeIfPresent(label, forKey: .label)
        try container.encodeIfPresent(sort, forKey: .sort)
        try container.encodeIfPresent(transacType, forKey: .transacType)
        try container.encodeIfPresent(value, forKey: .value)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTag else { return false }
      guard self.destination == object.destination else { return false }
      guard self.filter == object.filter else { return false }
      guard self.label == object.label else { return false }
      guard self.sort == object.sort else { return false }
      guard self.transacType == object.transacType else { return false }
      guard self.value == object.value else { return false }
      return true
    }

    public static func == (lhs: SKRTag, rhs: SKRTag) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

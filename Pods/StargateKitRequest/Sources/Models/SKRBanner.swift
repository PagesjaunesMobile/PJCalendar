/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRBanner: StargateKitModel {

    public var click: SKRClick?

    public var countURL: String?

    public var endDate: String?

    public var idCamp: String?

    public var lastUpdate: String?

    public var lstDispParam: SKRLstDispParam?

    public var lstText: SKRLstText?

    public var lstVisual: SKRLstVisual?

    public var startDate: String?

    public var type: String?

    public init(click: SKRClick? = nil, countURL: String? = nil, endDate: String? = nil, idCamp: String? = nil, lastUpdate: String? = nil, lstDispParam: SKRLstDispParam? = nil, lstText: SKRLstText? = nil, lstVisual: SKRLstVisual? = nil, startDate: String? = nil, type: String? = nil) {
        self.click = click
        self.countURL = countURL
        self.endDate = endDate
        self.idCamp = idCamp
        self.lastUpdate = lastUpdate
        self.lstDispParam = lstDispParam
        self.lstText = lstText
        self.lstVisual = lstVisual
        self.startDate = startDate
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case click
        case countURL
        case endDate
        case idCamp
        case lastUpdate
        case lstDispParam
        case lstText
        case lstVisual
        case startDate
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        click = try container.decodeIfPresent(.click)
        countURL = try container.decodeIfPresent(.countURL)
        endDate = try container.decodeIfPresent(.endDate)
        idCamp = try container.decodeIfPresent(.idCamp)
        lastUpdate = try container.decodeIfPresent(.lastUpdate)
        lstDispParam = try container.decodeIfPresent(.lstDispParam)
        lstText = try container.decodeIfPresent(.lstText)
        lstVisual = try container.decodeIfPresent(.lstVisual)
        startDate = try container.decodeIfPresent(.startDate)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(click, forKey: .click)
        try container.encodeIfPresent(countURL, forKey: .countURL)
        try container.encodeIfPresent(endDate, forKey: .endDate)
        try container.encodeIfPresent(idCamp, forKey: .idCamp)
        try container.encodeIfPresent(lastUpdate, forKey: .lastUpdate)
        try container.encodeIfPresent(lstDispParam, forKey: .lstDispParam)
        try container.encodeIfPresent(lstText, forKey: .lstText)
        try container.encodeIfPresent(lstVisual, forKey: .lstVisual)
        try container.encodeIfPresent(startDate, forKey: .startDate)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRBanner else { return false }
      guard self.click == object.click else { return false }
      guard self.countURL == object.countURL else { return false }
      guard self.endDate == object.endDate else { return false }
      guard self.idCamp == object.idCamp else { return false }
      guard self.lastUpdate == object.lastUpdate else { return false }
      guard self.lstDispParam == object.lstDispParam else { return false }
      guard self.lstText == object.lstText else { return false }
      guard self.lstVisual == object.lstVisual else { return false }
      guard self.startDate == object.startDate else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRBanner, rhs: SKRBanner) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

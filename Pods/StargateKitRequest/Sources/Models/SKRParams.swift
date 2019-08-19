/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRParams: StargateKitModel {

    public var calendId: String?

    public var categId: String?

    public var dtime: String?

    public var etabCode: String?

    public var goto: String?

    public var groupeId: String?

    public var intervId: String?

    public var sdtime: String?

    public var serviceId: String?

    public var url: String?

    public init(calendId: String? = nil, categId: String? = nil, dtime: String? = nil, etabCode: String? = nil, goto: String? = nil, groupeId: String? = nil, intervId: String? = nil, sdtime: String? = nil, serviceId: String? = nil, url: String? = nil) {
        self.calendId = calendId
        self.categId = categId
        self.dtime = dtime
        self.etabCode = etabCode
        self.goto = goto
        self.groupeId = groupeId
        self.intervId = intervId
        self.sdtime = sdtime
        self.serviceId = serviceId
        self.url = url
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case calendId = "calend_id"
        case categId = "categ_id"
        case dtime
        case etabCode = "etab_code"
        case goto
        case groupeId = "groupe_id"
        case intervId = "interv_id"
        case sdtime
        case serviceId = "service_id"
        case url
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        calendId = try container.decodeIfPresent(.calendId)
        categId = try container.decodeIfPresent(.categId)
        dtime = try container.decodeIfPresent(.dtime)
        etabCode = try container.decodeIfPresent(.etabCode)
        goto = try container.decodeIfPresent(.goto)
        groupeId = try container.decodeIfPresent(.groupeId)
        intervId = try container.decodeIfPresent(.intervId)
        sdtime = try container.decodeIfPresent(.sdtime)
        serviceId = try container.decodeIfPresent(.serviceId)
        url = try container.decodeIfPresent(.url)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(calendId, forKey: .calendId)
        try container.encodeIfPresent(categId, forKey: .categId)
        try container.encodeIfPresent(dtime, forKey: .dtime)
        try container.encodeIfPresent(etabCode, forKey: .etabCode)
        try container.encodeIfPresent(goto, forKey: .goto)
        try container.encodeIfPresent(groupeId, forKey: .groupeId)
        try container.encodeIfPresent(intervId, forKey: .intervId)
        try container.encodeIfPresent(sdtime, forKey: .sdtime)
        try container.encodeIfPresent(serviceId, forKey: .serviceId)
        try container.encodeIfPresent(url, forKey: .url)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRParams else { return false }
      guard self.calendId == object.calendId else { return false }
      guard self.categId == object.categId else { return false }
      guard self.dtime == object.dtime else { return false }
      guard self.etabCode == object.etabCode else { return false }
      guard self.goto == object.goto else { return false }
      guard self.groupeId == object.groupeId else { return false }
      guard self.intervId == object.intervId else { return false }
      guard self.sdtime == object.sdtime else { return false }
      guard self.serviceId == object.serviceId else { return false }
      guard self.url == object.url else { return false }
      return true
    }

    public static func == (lhs: SKRParams, rhs: SKRParams) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

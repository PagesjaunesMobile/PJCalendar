/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDraft: StargateKitModel {

    public enum SKRStatus: String, Codable, Hashable, CaseIterable {
        case enregistre = "ENREGISTRE"
        case envoye = "ENVOYE"
        case notifie = "NOTIFIE"
        case ouvert = "OUVERT"
    }

    public var codeActivite: String?

    public var epj: String?

    public var locationId: String?

    public var origineSollicitation: String?

    public var status: SKRStatus?

    public init(codeActivite: String? = nil, epj: String? = nil, locationId: String? = nil, origineSollicitation: String? = nil, status: SKRStatus? = nil) {
        self.codeActivite = codeActivite
        self.epj = epj
        self.locationId = locationId
        self.origineSollicitation = origineSollicitation
        self.status = status
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case codeActivite = "code_activite"
        case epj
        case locationId = "location_id"
        case origineSollicitation = "origine_sollicitation"
        case status
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        codeActivite = try container.decodeIfPresent(.codeActivite)
        epj = try container.decodeIfPresent(.epj)
        locationId = try container.decodeIfPresent(.locationId)
        origineSollicitation = try container.decodeIfPresent(.origineSollicitation)
        status = try container.decodeIfPresent(.status)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(codeActivite, forKey: .codeActivite)
        try container.encodeIfPresent(epj, forKey: .epj)
        try container.encodeIfPresent(locationId, forKey: .locationId)
        try container.encodeIfPresent(origineSollicitation, forKey: .origineSollicitation)
        try container.encodeIfPresent(status, forKey: .status)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDraft else { return false }
      guard self.codeActivite == object.codeActivite else { return false }
      guard self.epj == object.epj else { return false }
      guard self.locationId == object.locationId else { return false }
      guard self.origineSollicitation == object.origineSollicitation else { return false }
      guard self.status == object.status else { return false }
      return true
    }

    public static func == (lhs: SKRDraft, rhs: SKRDraft) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

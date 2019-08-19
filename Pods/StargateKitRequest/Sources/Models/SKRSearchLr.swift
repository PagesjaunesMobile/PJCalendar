/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRSearchLr: StargateKitModel {

    public var accIds: String?

    public var acy: Int?

    public var bannerLR: [SKRBannerLR]?

    public var btFilters: Bool?

    public var coordinates: String?

    public var everywhere: Bool?

    public var filters: [SKRFilters]?

    public var filtersDispo: [SKRFilters]?

    public var idLieu: String?

    public var lstSug: [SKRLstSug]?

    public var mnemo: String?

    public var proximity: Bool?

    public var pushR: SKRPushR?

    public var resaResto: SKRResaResto?

    public var searchAT: String?

    public var sort: [SKRSort]?

    public var trace: SKRTrace?

    public var type: String?

    public var typeLieu: String?

    public var what: String?

    public var `where`: String?

    public init(accIds: String? = nil, acy: Int? = nil, bannerLR: [SKRBannerLR]? = nil, btFilters: Bool? = nil, coordinates: String? = nil, everywhere: Bool? = nil, filters: [SKRFilters]? = nil, filtersDispo: [SKRFilters]? = nil, idLieu: String? = nil, lstSug: [SKRLstSug]? = nil, mnemo: String? = nil, proximity: Bool? = nil, pushR: SKRPushR? = nil, resaResto: SKRResaResto? = nil, searchAT: String? = nil, sort: [SKRSort]? = nil, trace: SKRTrace? = nil, type: String? = nil, typeLieu: String? = nil, what: String? = nil, `where`: String? = nil) {
        self.accIds = accIds
        self.acy = acy
        self.bannerLR = bannerLR
        self.btFilters = btFilters
        self.coordinates = coordinates
        self.everywhere = everywhere
        self.filters = filters
        self.filtersDispo = filtersDispo
        self.idLieu = idLieu
        self.lstSug = lstSug
        self.mnemo = mnemo
        self.proximity = proximity
        self.pushR = pushR
        self.resaResto = resaResto
        self.searchAT = searchAT
        self.sort = sort
        self.trace = trace
        self.type = type
        self.typeLieu = typeLieu
        self.what = what
        self.`where` = `where`
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case accIds
        case acy
        case bannerLR
        case btFilters
        case coordinates
        case everywhere
        case filters
        case filtersDispo
        case idLieu
        case lstSug
        case mnemo
        case proximity
        case pushR
        case resaResto
        case searchAT
        case sort
        case trace
        case type
        case typeLieu
        case what
        case `where` = "where"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        accIds = try container.decodeIfPresent(.accIds)
        acy = try container.decodeIfPresent(.acy)
        bannerLR = try container.decodeArrayIfPresent(.bannerLR)
        btFilters = try container.decodeIfPresent(.btFilters)
        coordinates = try container.decodeIfPresent(.coordinates)
        everywhere = try container.decodeIfPresent(.everywhere)
        filters = try container.decodeArrayIfPresent(.filters)
        filtersDispo = try container.decodeArrayIfPresent(.filtersDispo)
        idLieu = try container.decodeIfPresent(.idLieu)
        lstSug = try container.decodeArrayIfPresent(.lstSug)
        mnemo = try container.decodeIfPresent(.mnemo)
        proximity = try container.decodeIfPresent(.proximity)
        pushR = try container.decodeIfPresent(.pushR)
        resaResto = try container.decodeIfPresent(.resaResto)
        searchAT = try container.decodeIfPresent(.searchAT)
        sort = try container.decodeArrayIfPresent(.sort)
        trace = try container.decodeIfPresent(.trace)
        type = try container.decodeIfPresent(.type)
        typeLieu = try container.decodeIfPresent(.typeLieu)
        what = try container.decodeIfPresent(.what)
        `where` = try container.decodeIfPresent(.`where`)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(accIds, forKey: .accIds)
        try container.encodeIfPresent(acy, forKey: .acy)
        try container.encodeIfPresent(bannerLR, forKey: .bannerLR)
        try container.encodeIfPresent(btFilters, forKey: .btFilters)
        try container.encodeIfPresent(coordinates, forKey: .coordinates)
        try container.encodeIfPresent(everywhere, forKey: .everywhere)
        try container.encodeIfPresent(filters, forKey: .filters)
        try container.encodeIfPresent(filtersDispo, forKey: .filtersDispo)
        try container.encodeIfPresent(idLieu, forKey: .idLieu)
        try container.encodeIfPresent(lstSug, forKey: .lstSug)
        try container.encodeIfPresent(mnemo, forKey: .mnemo)
        try container.encodeIfPresent(proximity, forKey: .proximity)
        try container.encodeIfPresent(pushR, forKey: .pushR)
        try container.encodeIfPresent(resaResto, forKey: .resaResto)
        try container.encodeIfPresent(searchAT, forKey: .searchAT)
        try container.encodeIfPresent(sort, forKey: .sort)
        try container.encodeIfPresent(trace, forKey: .trace)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(typeLieu, forKey: .typeLieu)
        try container.encodeIfPresent(what, forKey: .what)
        try container.encodeIfPresent(`where`, forKey: .`where`)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRSearchLr else { return false }
      guard self.accIds == object.accIds else { return false }
      guard self.acy == object.acy else { return false }
      guard self.bannerLR == object.bannerLR else { return false }
      guard self.btFilters == object.btFilters else { return false }
      guard self.coordinates == object.coordinates else { return false }
      guard self.everywhere == object.everywhere else { return false }
      guard self.filters == object.filters else { return false }
      guard self.filtersDispo == object.filtersDispo else { return false }
      guard self.idLieu == object.idLieu else { return false }
      guard self.lstSug == object.lstSug else { return false }
      guard self.mnemo == object.mnemo else { return false }
      guard self.proximity == object.proximity else { return false }
      guard self.pushR == object.pushR else { return false }
      guard self.resaResto == object.resaResto else { return false }
      guard self.searchAT == object.searchAT else { return false }
      guard self.sort == object.sort else { return false }
      guard self.trace == object.trace else { return false }
      guard self.type == object.type else { return false }
      guard self.typeLieu == object.typeLieu else { return false }
      guard self.what == object.what else { return false }
      guard self.`where` == object.`where` else { return false }
      return true
    }

    public static func == (lhs: SKRSearchLr, rhs: SKRSearchLr) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRBloc: StargateKitModel {

    public enum SKRTypeBI: String, Codable, Hashable, CaseIterable {
        case pro = "PRO"
        case proExtraLocal = "PRO_EXTRA_LOCAL"
        case proLocal = "PRO_LOCAL"
        case proUv = "PRO_UV"
        case proExtraUv = "PRO_EXTRA_UV"
    }

    public var act: [SKRAct]?

    public var ad: SKRAd?

    public var ameli: SKRAmeli?

    public var blockId: String?

    public var bpEpj: String?

    public var categories: SKRCategories?

    public var contenuChaud: SKRContenuChaud?

    public var cps: [SKRContenusPrioritaires]?

    public var cvi: SKRCvi?

    public var dateProchaineDisponibilite: String?

    public var descFD: String?

    public var devis: String?

    public var eco: Bool?

    public var fName: String?

    public var full: Bool?

    public var id: String?

    public var idODA: String?

    public var index: String?

    public var isRanked: Bool?

    public var isZoneIntervention: Bool?

    public var items: SKRItemsFicheDetaillee?

    public var lost: Bool?

    public var mCoords: Bool?

    public var mappy: Bool?

    public var mention: [SKRMention]?

    public var name: String?

    public var newsEpj: String?

    public var notGeocod: Bool?

    public var omstatut: String?

    public var pMenu: Bool?

    public var pictos: SKRPictos?

    public var pj: Bool?

    public var place: [SKRPlace]?

    public var polepo: Bool?

    public var prospectTransac: Bool?

    public var restauration: Bool?

    public var review: SKRReviewBloc?

    public var rge: String?

    public var suggestions: SKRSuggestions?

    public var swapDenom: String?

    public var tags: String?

    public var thumbLR: String?

    public var transac: String?

    public var transactionnel: SKRTransactionnelOrcAnnuaire?

    public var type: String?

    public var typeBI: SKRTypeBI?

    public var typeRes: String?

    public var typeParcoursTransac: String?

    public var typesCuisine: String?

    public var vtEpj: String?

    public var zc: SKRZoneContextuelle?

    public init(act: [SKRAct]? = nil, ad: SKRAd? = nil, ameli: SKRAmeli? = nil, blockId: String? = nil, bpEpj: String? = nil, categories: SKRCategories? = nil, contenuChaud: SKRContenuChaud? = nil, cps: [SKRContenusPrioritaires]? = nil, cvi: SKRCvi? = nil, dateProchaineDisponibilite: String? = nil, descFD: String? = nil, devis: String? = nil, eco: Bool? = nil, fName: String? = nil, full: Bool? = nil, id: String? = nil, idODA: String? = nil, index: String? = nil, isRanked: Bool? = nil, isZoneIntervention: Bool? = nil, items: SKRItemsFicheDetaillee? = nil, lost: Bool? = nil, mCoords: Bool? = nil, mappy: Bool? = nil, mention: [SKRMention]? = nil, name: String? = nil, newsEpj: String? = nil, notGeocod: Bool? = nil, omstatut: String? = nil, pMenu: Bool? = nil, pictos: SKRPictos? = nil, pj: Bool? = nil, place: [SKRPlace]? = nil, polepo: Bool? = nil, prospectTransac: Bool? = nil, restauration: Bool? = nil, review: SKRReviewBloc? = nil, rge: String? = nil, suggestions: SKRSuggestions? = nil, swapDenom: String? = nil, tags: String? = nil, thumbLR: String? = nil, transac: String? = nil, transactionnel: SKRTransactionnelOrcAnnuaire? = nil, type: String? = nil, typeBI: SKRTypeBI? = nil, typeRes: String? = nil, typeParcoursTransac: String? = nil, typesCuisine: String? = nil, vtEpj: String? = nil, zc: SKRZoneContextuelle? = nil) {
        self.act = act
        self.ad = ad
        self.ameli = ameli
        self.blockId = blockId
        self.bpEpj = bpEpj
        self.categories = categories
        self.contenuChaud = contenuChaud
        self.cps = cps
        self.cvi = cvi
        self.dateProchaineDisponibilite = dateProchaineDisponibilite
        self.descFD = descFD
        self.devis = devis
        self.eco = eco
        self.fName = fName
        self.full = full
        self.id = id
        self.idODA = idODA
        self.index = index
        self.isRanked = isRanked
        self.isZoneIntervention = isZoneIntervention
        self.items = items
        self.lost = lost
        self.mCoords = mCoords
        self.mappy = mappy
        self.mention = mention
        self.name = name
        self.newsEpj = newsEpj
        self.notGeocod = notGeocod
        self.omstatut = omstatut
        self.pMenu = pMenu
        self.pictos = pictos
        self.pj = pj
        self.place = place
        self.polepo = polepo
        self.prospectTransac = prospectTransac
        self.restauration = restauration
        self.review = review
        self.rge = rge
        self.suggestions = suggestions
        self.swapDenom = swapDenom
        self.tags = tags
        self.thumbLR = thumbLR
        self.transac = transac
        self.transactionnel = transactionnel
        self.type = type
        self.typeBI = typeBI
        self.typeRes = typeRes
        self.typeParcoursTransac = typeParcoursTransac
        self.typesCuisine = typesCuisine
        self.vtEpj = vtEpj
        self.zc = zc
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case act
        case ad
        case ameli
        case blockId
        case bpEpj = "bp_epj"
        case categories
        case contenuChaud
        case cps
        case cvi
        case dateProchaineDisponibilite = "date_prochaine_disponibilite"
        case descFD
        case devis
        case eco
        case fName
        case full
        case id
        case idODA
        case index
        case isRanked
        case isZoneIntervention
        case items
        case lost
        case mCoords
        case mappy
        case mention
        case name
        case newsEpj = "news_epj"
        case notGeocod
        case omstatut
        case pMenu
        case pictos
        case pj
        case place
        case polepo
        case prospectTransac = "prospect_transac"
        case restauration
        case review
        case rge
        case suggestions
        case swapDenom = "swap_denom"
        case tags
        case thumbLR
        case transac
        case transactionnel
        case type
        case typeBI
        case typeRes
        case typeParcoursTransac = "type_parcours_transac"
        case typesCuisine
        case vtEpj = "vt_epj"
        case zc
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        act = try container.decodeArrayIfPresent(.act)
        ad = try container.decodeIfPresent(.ad)
        ameli = try container.decodeIfPresent(.ameli)
        blockId = try container.decodeIfPresent(.blockId)
        bpEpj = try container.decodeIfPresent(.bpEpj)
        categories = try container.decodeIfPresent(.categories)
        contenuChaud = try container.decodeIfPresent(.contenuChaud)
        cps = try container.decodeArrayIfPresent(.cps)
        cvi = try container.decodeIfPresent(.cvi)
        dateProchaineDisponibilite = try container.decodeIfPresent(.dateProchaineDisponibilite)
        descFD = try container.decodeIfPresent(.descFD)
        devis = try container.decodeIfPresent(.devis)
        eco = try container.decodeIfPresent(.eco)
        fName = try container.decodeIfPresent(.fName)
        full = try container.decodeIfPresent(.full)
        id = try container.decodeIfPresent(.id)
        idODA = try container.decodeIfPresent(.idODA)
        index = try container.decodeIfPresent(.index)
        isRanked = try container.decodeIfPresent(.isRanked)
        isZoneIntervention = try container.decodeIfPresent(.isZoneIntervention)
        items = try container.decodeIfPresent(.items)
        lost = try container.decodeIfPresent(.lost)
        mCoords = try container.decodeIfPresent(.mCoords)
        mappy = try container.decodeIfPresent(.mappy)
        mention = try container.decodeArrayIfPresent(.mention)
        name = try container.decodeIfPresent(.name)
        newsEpj = try container.decodeIfPresent(.newsEpj)
        notGeocod = try container.decodeIfPresent(.notGeocod)
        omstatut = try container.decodeIfPresent(.omstatut)
        pMenu = try container.decodeIfPresent(.pMenu)
        pictos = try container.decodeIfPresent(.pictos)
        pj = try container.decodeIfPresent(.pj)
        place = try container.decodeArrayIfPresent(.place)
        polepo = try container.decodeIfPresent(.polepo)
        prospectTransac = try container.decodeIfPresent(.prospectTransac)
        restauration = try container.decodeIfPresent(.restauration)
        review = try container.decodeIfPresent(.review)
        rge = try container.decodeIfPresent(.rge)
        suggestions = try container.decodeIfPresent(.suggestions)
        swapDenom = try container.decodeIfPresent(.swapDenom)
        tags = try container.decodeIfPresent(.tags)
        thumbLR = try container.decodeIfPresent(.thumbLR)
        transac = try container.decodeIfPresent(.transac)
        transactionnel = try container.decodeIfPresent(.transactionnel)
        type = try container.decodeIfPresent(.type)
        typeBI = try container.decodeIfPresent(.typeBI)
        typeRes = try container.decodeIfPresent(.typeRes)
        typeParcoursTransac = try container.decodeIfPresent(.typeParcoursTransac)
        typesCuisine = try container.decodeIfPresent(.typesCuisine)
        vtEpj = try container.decodeIfPresent(.vtEpj)
        zc = try container.decodeIfPresent(.zc)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(act, forKey: .act)
        try container.encodeIfPresent(ad, forKey: .ad)
        try container.encodeIfPresent(ameli, forKey: .ameli)
        try container.encodeIfPresent(blockId, forKey: .blockId)
        try container.encodeIfPresent(bpEpj, forKey: .bpEpj)
        try container.encodeIfPresent(categories, forKey: .categories)
        try container.encodeIfPresent(contenuChaud, forKey: .contenuChaud)
        try container.encodeIfPresent(cps, forKey: .cps)
        try container.encodeIfPresent(cvi, forKey: .cvi)
        try container.encodeIfPresent(dateProchaineDisponibilite, forKey: .dateProchaineDisponibilite)
        try container.encodeIfPresent(descFD, forKey: .descFD)
        try container.encodeIfPresent(devis, forKey: .devis)
        try container.encodeIfPresent(eco, forKey: .eco)
        try container.encodeIfPresent(fName, forKey: .fName)
        try container.encodeIfPresent(full, forKey: .full)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(idODA, forKey: .idODA)
        try container.encodeIfPresent(index, forKey: .index)
        try container.encodeIfPresent(isRanked, forKey: .isRanked)
        try container.encodeIfPresent(isZoneIntervention, forKey: .isZoneIntervention)
        try container.encodeIfPresent(items, forKey: .items)
        try container.encodeIfPresent(lost, forKey: .lost)
        try container.encodeIfPresent(mCoords, forKey: .mCoords)
        try container.encodeIfPresent(mappy, forKey: .mappy)
        try container.encodeIfPresent(mention, forKey: .mention)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(newsEpj, forKey: .newsEpj)
        try container.encodeIfPresent(notGeocod, forKey: .notGeocod)
        try container.encodeIfPresent(omstatut, forKey: .omstatut)
        try container.encodeIfPresent(pMenu, forKey: .pMenu)
        try container.encodeIfPresent(pictos, forKey: .pictos)
        try container.encodeIfPresent(pj, forKey: .pj)
        try container.encodeIfPresent(place, forKey: .place)
        try container.encodeIfPresent(polepo, forKey: .polepo)
        try container.encodeIfPresent(prospectTransac, forKey: .prospectTransac)
        try container.encodeIfPresent(restauration, forKey: .restauration)
        try container.encodeIfPresent(review, forKey: .review)
        try container.encodeIfPresent(rge, forKey: .rge)
        try container.encodeIfPresent(suggestions, forKey: .suggestions)
        try container.encodeIfPresent(swapDenom, forKey: .swapDenom)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(thumbLR, forKey: .thumbLR)
        try container.encodeIfPresent(transac, forKey: .transac)
        try container.encodeIfPresent(transactionnel, forKey: .transactionnel)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(typeBI, forKey: .typeBI)
        try container.encodeIfPresent(typeRes, forKey: .typeRes)
        try container.encodeIfPresent(typeParcoursTransac, forKey: .typeParcoursTransac)
        try container.encodeIfPresent(typesCuisine, forKey: .typesCuisine)
        try container.encodeIfPresent(vtEpj, forKey: .vtEpj)
        try container.encodeIfPresent(zc, forKey: .zc)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRBloc else { return false }
      guard self.act == object.act else { return false }
      guard self.ad == object.ad else { return false }
      guard self.ameli == object.ameli else { return false }
      guard self.blockId == object.blockId else { return false }
      guard self.bpEpj == object.bpEpj else { return false }
      guard self.categories == object.categories else { return false }
      guard self.contenuChaud == object.contenuChaud else { return false }
      guard self.cps == object.cps else { return false }
      guard self.cvi == object.cvi else { return false }
      guard self.dateProchaineDisponibilite == object.dateProchaineDisponibilite else { return false }
      guard self.descFD == object.descFD else { return false }
      guard self.devis == object.devis else { return false }
      guard self.eco == object.eco else { return false }
      guard self.fName == object.fName else { return false }
      guard self.full == object.full else { return false }
      guard self.id == object.id else { return false }
      guard self.idODA == object.idODA else { return false }
      guard self.index == object.index else { return false }
      guard self.isRanked == object.isRanked else { return false }
      guard self.isZoneIntervention == object.isZoneIntervention else { return false }
      guard self.items == object.items else { return false }
      guard self.lost == object.lost else { return false }
      guard self.mCoords == object.mCoords else { return false }
      guard self.mappy == object.mappy else { return false }
      guard self.mention == object.mention else { return false }
      guard self.name == object.name else { return false }
      guard self.newsEpj == object.newsEpj else { return false }
      guard self.notGeocod == object.notGeocod else { return false }
      guard self.omstatut == object.omstatut else { return false }
      guard self.pMenu == object.pMenu else { return false }
      guard self.pictos == object.pictos else { return false }
      guard self.pj == object.pj else { return false }
      guard self.place == object.place else { return false }
      guard self.polepo == object.polepo else { return false }
      guard self.prospectTransac == object.prospectTransac else { return false }
      guard self.restauration == object.restauration else { return false }
      guard self.review == object.review else { return false }
      guard self.rge == object.rge else { return false }
      guard self.suggestions == object.suggestions else { return false }
      guard self.swapDenom == object.swapDenom else { return false }
      guard self.tags == object.tags else { return false }
      guard self.thumbLR == object.thumbLR else { return false }
      guard self.transac == object.transac else { return false }
      guard self.transactionnel == object.transactionnel else { return false }
      guard self.type == object.type else { return false }
      guard self.typeBI == object.typeBI else { return false }
      guard self.typeRes == object.typeRes else { return false }
      guard self.typeParcoursTransac == object.typeParcoursTransac else { return false }
      guard self.typesCuisine == object.typesCuisine else { return false }
      guard self.vtEpj == object.vtEpj else { return false }
      guard self.zc == object.zc else { return false }
      return true
    }

    public static func == (lhs: SKRBloc, rhs: SKRBloc) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

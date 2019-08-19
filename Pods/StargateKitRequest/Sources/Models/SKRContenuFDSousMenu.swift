/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContenuFDSousMenu: StargateKitModel {

    public enum SKRContenuFDModule: String, Codable, Hashable, CaseIterable {
        case actualites = "ACTUALITES"
        case ambiance = "AMBIANCE"
        case ambianceLegacy = "AMBIANCE_LEGACY"
        case ameli = "AMELI"
        case ameliDispositif = "AMELI_DISPOSITIF"
        case ameliDispositifLegacy = "AMELI_DISPOSITIF_LEGACY"
        case ameliInfo = "AMELI_INFO"
        case ameliInfoLegacy = "AMELI_INFO_LEGACY"
        case ameliLegacy = "AMELI_LEGACY"
        case ameliPublication = "AMELI_PUBLICATION"
        case ameliPublicationLegacy = "AMELI_PUBLICATION_LEGACY"
        case brand = "BRAND"
        case brandLegacy = "BRAND_LEGACY"
        case budgetHotel = "BUDGET_HOTEL"
        case budgetHotelLegacy = "BUDGET_HOTEL_LEGACY"
        case budgetRestaurant = "BUDGET_RESTAURANT"
        case budgetRestaurantLegacy = "BUDGET_RESTAURANT_LEGACY"
        case carto = "CARTO"
        case category = "CATEGORY"
        case categoryLegacy = "CATEGORY_LEGACY"
        case certification = "CERTIFICATION"
        case certificationLegacy = "CERTIFICATION_LEGACY"
        case chef = "CHEF"
        case chefLegacy = "CHEF_LEGACY"
        case contentfirst = "CONTENTFIRST"
        case contentfirstBigLegacy = "CONTENTFIRST_BIG_LEGACY"
        case contenuPrio = "CONTENU_PRIO"
        case contenuPrioLegacy = "CONTENU_PRIO_LEGACY"
        case creationDateLegacy = "CREATION_DATE_LEGACY"
        case cta = "CTA"
        case cqfd = "CQFD"
        case cuisine = "CUISINE"
        case cuisineLegacy = "CUISINE_LEGACY"
        case customers = "CUSTOMERS"
        case customersLegacy = "CUSTOMERS_LEGACY"
        case cvi = "CVI"
        case cviLegacy = "CVI_LEGACY"
        case cviLf = "CVI_LF"
        case cviLfLegacy = "CVI_LF_LEGACY"
        case diploma = "DIPLOMA"
        case diplomaLegacy = "DIPLOMA_LEGACY"
        case flatwareNumber = "FLATWARE_NUMBER"
        case flatwareNumberLegacy = "FLATWARE_NUMBER_LEGACY"
        case gooddealLegacy = "GOODDEAL_LEGACY"
        case guestNumber = "GUEST_NUMBER"
        case guestNumberLegacy = "GUEST_NUMBER_LEGACY"
        case header = "HEADER"
        case healthConventionnement = "HEALTH_CONVENTIONNEMENT"
        case healthConventionnementLegacy = "HEALTH_CONVENTIONNEMENT_LEGACY"
        case healthCost = "HEALTH_COST"
        case healthCostLegacy = "HEALTH_COST_LEGACY"
        case healthDescriptionLegacy = "HEALTH_DESCRIPTION_LEGACY"
        case healthDiploma = "HEALTH_DIPLOMA"
        case healthDiplomaLegacy = "HEALTH_DIPLOMA_LEGACY"
        case healthItemList = "HEALTH_ITEM_LIST"
        case healthItemListLegacy = "HEALTH_ITEM_LIST_LEGACY"
        case healthLanguage = "HEALTH_LANGUAGE"
        case healthLanguageLegacy = "HEALTH_LANGUAGE_LEGACY"
        case healthRdv = "HEALTH_RDV"
        case healthRdvLegacy = "HEALTH_RDV_LEGACY"
        case healthSpeciality = "HEALTH_SPECIALITY"
        case healthSpecialtyLegacy = "HEALTH_SPECIALTY_LEGACY"
        case informations = "INFORMATIONS"
        case interventionArea = "INTERVENTION_AREA"
        case interventionAreaLegacy = "INTERVENTION_AREA_LEGACY"
        case mainInfo = "MAIN_INFO"
        case media = "MEDIA"
        case mediaLegacy = "MEDIA_LEGACY"
        case mentions = "MENTIONS"
        case mentionsLegacy = "MENTIONS_LEGACY"
        case menu = "MENU"
        case menuLegacy = "MENU_LEGACY"
        case navigation = "NAVIGATION"
        case network = "NETWORK"
        case networkLegacy = "NETWORK_LEGACY"
        case newsLegacy = "NEWS_LEGACY"
        case numberOfRoom = "NUMBER_OF_ROOM"
        case numberOfRoomLegacy = "NUMBER_OF_ROOM_LEGACY"
        case otherCoordinates = "OTHER_COORDINATES"
        case otherCoordinatesLegacy = "OTHER_COORDINATES_LEGACY"
        case papLegacy = "PAP_LEGACY"
        case paymentSupported = "PAYMENT_SUPPORTED"
        case paymentSupportedLegacy = "PAYMENT_SUPPORTED_LEGACY"
        case prestations = "PRESTATIONS"
        case product = "PRODUCT"
        case productLegacy = "PRODUCT_LEGACY"
        case pvi = "PVI"
        case pviLegacy = "PVI_LEGACY"
        case recommandation = "RECOMMANDATION"
        case recommandationLegacy = "RECOMMANDATION_LEGACY"
        case restaurantHotel = "RESTAURANT_HOTEL"
        case restaurantHotelLegacy = "RESTAURANT_HOTEL_LEGACY"
        case reviewLegacy = "REVIEW_LEGACY"
        case reviewLight = "REVIEW_LIGHT"
        case reviews = "REVIEWS"
        case reviewsNote = "REVIEWS_NOTE"
        case reviewsUser = "REVIEWS_USER"
        case reviewsTop = "REVIEWS_TOP"
        case service = "SERVICE"
        case serviceLegacy = "SERVICE_LEGACY"
        case shedule = "SHEDULE"
        case sheduleLegacy = "SHEDULE_LEGACY"
        case shippingLocationLegacy = "SHIPPING_LOCATION_LEGACY"
        case soins = "SOINS"
        case specialty = "SPECIALTY"
        case specialtyLegacy = "SPECIALTY_LEGACY"
        case team = "TEAM"
        case teamLegacy = "TEAM_LEGACY"
        case vpsAutoMotoLegacy = "VPS_AUTO_MOTO_LEGACY"
        case vpsImmoLegacy = "VPS_IMMO_LEGACY"
        case vpsLegacy = "VPS_LEGACY"
        case vpsAutoMoto = "VPS_AUTO_MOTO"
        case vpsImmo = "VPS_IMMO"
        case vps = "VPS"
    }

    public var contenuFDModule: [SKRContenuFDModule]?

    public var elevated: Bool?

    public var titre: String?

    public init(contenuFDModule: [SKRContenuFDModule]? = nil, elevated: Bool? = nil, titre: String? = nil) {
        self.contenuFDModule = contenuFDModule
        self.elevated = elevated
        self.titre = titre
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case contenuFDModule
        case elevated
        case titre
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        contenuFDModule = try container.decodeArrayIfPresent(.contenuFDModule)
        elevated = try container.decodeIfPresent(.elevated)
        titre = try container.decodeIfPresent(.titre)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(contenuFDModule, forKey: .contenuFDModule)
        try container.encodeIfPresent(elevated, forKey: .elevated)
        try container.encodeIfPresent(titre, forKey: .titre)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContenuFDSousMenu else { return false }
      guard self.contenuFDModule == object.contenuFDModule else { return false }
      guard self.elevated == object.elevated else { return false }
      guard self.titre == object.titre else { return false }
      return true
    }

    public static func == (lhs: SKRContenuFDSousMenu, rhs: SKRContenuFDSousMenu) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

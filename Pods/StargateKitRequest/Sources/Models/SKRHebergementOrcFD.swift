/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRHebergementOrcFD: StargateKitModel {

    public var conditions: SKRMasquableSEOElementSimpleOrcFDString?

    public var idHotel: String?

    public var prestationsServicesCamping: [SKRDonneesSCPApiInscriptionOrcFD]?

    public var prestationsServicesChambreHote: [SKRDonneesSCPApiInscriptionOrcFD]?

    public var prestationsServicesGite: [SKRDonneesSCPApiInscriptionOrcFD]?

    public var prestationsServicesHotel: [SKRDonneesSCPApiInscriptionOrcFD]?

    public var renovation: SKRMasquableSEOElementSimpleOrcFDString?

    public var reservable: Bool?

    public var servicesLoisirs: SKRMasquableSEOElementSimpleOrcFDString?

    public init(conditions: SKRMasquableSEOElementSimpleOrcFDString? = nil, idHotel: String? = nil, prestationsServicesCamping: [SKRDonneesSCPApiInscriptionOrcFD]? = nil, prestationsServicesChambreHote: [SKRDonneesSCPApiInscriptionOrcFD]? = nil, prestationsServicesGite: [SKRDonneesSCPApiInscriptionOrcFD]? = nil, prestationsServicesHotel: [SKRDonneesSCPApiInscriptionOrcFD]? = nil, renovation: SKRMasquableSEOElementSimpleOrcFDString? = nil, reservable: Bool? = nil, servicesLoisirs: SKRMasquableSEOElementSimpleOrcFDString? = nil) {
        self.conditions = conditions
        self.idHotel = idHotel
        self.prestationsServicesCamping = prestationsServicesCamping
        self.prestationsServicesChambreHote = prestationsServicesChambreHote
        self.prestationsServicesGite = prestationsServicesGite
        self.prestationsServicesHotel = prestationsServicesHotel
        self.renovation = renovation
        self.reservable = reservable
        self.servicesLoisirs = servicesLoisirs
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case conditions
        case idHotel = "id_hotel"
        case prestationsServicesCamping = "prestations_services_camping"
        case prestationsServicesChambreHote = "prestations_services_chambre_hote"
        case prestationsServicesGite = "prestations_services_gite"
        case prestationsServicesHotel = "prestations_services_hotel"
        case renovation
        case reservable
        case servicesLoisirs = "services_loisirs"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        conditions = try container.decodeIfPresent(.conditions)
        idHotel = try container.decodeIfPresent(.idHotel)
        prestationsServicesCamping = try container.decodeArrayIfPresent(.prestationsServicesCamping)
        prestationsServicesChambreHote = try container.decodeArrayIfPresent(.prestationsServicesChambreHote)
        prestationsServicesGite = try container.decodeArrayIfPresent(.prestationsServicesGite)
        prestationsServicesHotel = try container.decodeArrayIfPresent(.prestationsServicesHotel)
        renovation = try container.decodeIfPresent(.renovation)
        reservable = try container.decodeIfPresent(.reservable)
        servicesLoisirs = try container.decodeIfPresent(.servicesLoisirs)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(conditions, forKey: .conditions)
        try container.encodeIfPresent(idHotel, forKey: .idHotel)
        try container.encodeIfPresent(prestationsServicesCamping, forKey: .prestationsServicesCamping)
        try container.encodeIfPresent(prestationsServicesChambreHote, forKey: .prestationsServicesChambreHote)
        try container.encodeIfPresent(prestationsServicesGite, forKey: .prestationsServicesGite)
        try container.encodeIfPresent(prestationsServicesHotel, forKey: .prestationsServicesHotel)
        try container.encodeIfPresent(renovation, forKey: .renovation)
        try container.encodeIfPresent(reservable, forKey: .reservable)
        try container.encodeIfPresent(servicesLoisirs, forKey: .servicesLoisirs)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRHebergementOrcFD else { return false }
      guard self.conditions == object.conditions else { return false }
      guard self.idHotel == object.idHotel else { return false }
      guard self.prestationsServicesCamping == object.prestationsServicesCamping else { return false }
      guard self.prestationsServicesChambreHote == object.prestationsServicesChambreHote else { return false }
      guard self.prestationsServicesGite == object.prestationsServicesGite else { return false }
      guard self.prestationsServicesHotel == object.prestationsServicesHotel else { return false }
      guard self.renovation == object.renovation else { return false }
      guard self.reservable == object.reservable else { return false }
      guard self.servicesLoisirs == object.servicesLoisirs else { return false }
      return true
    }

    public static func == (lhs: SKRHebergementOrcFD, rhs: SKRHebergementOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

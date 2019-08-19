/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInformationsTarifairesOrcFD: StargateKitModel {

    public var affichageSeo: Bool?

    public var tarifAmeli: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var tarifConventionne: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var tarifMinReservableHotel: String?

    public var tarifSante: SKRTarifSanteOrcFD?

    public var tarifsGenerique: SKRMasquableSEOElementListeOrcFDTarifOrcFD?

    public var tarifsHebergement: SKRMasquableSEOElementListeOrcFDTarifOrcFD?

    public var tarifsRestauration: SKRMasquableSEOElementListeOrcFDTarifOrcFD?

    public init(affichageSeo: Bool? = nil, tarifAmeli: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, tarifConventionne: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, tarifMinReservableHotel: String? = nil, tarifSante: SKRTarifSanteOrcFD? = nil, tarifsGenerique: SKRMasquableSEOElementListeOrcFDTarifOrcFD? = nil, tarifsHebergement: SKRMasquableSEOElementListeOrcFDTarifOrcFD? = nil, tarifsRestauration: SKRMasquableSEOElementListeOrcFDTarifOrcFD? = nil) {
        self.affichageSeo = affichageSeo
        self.tarifAmeli = tarifAmeli
        self.tarifConventionne = tarifConventionne
        self.tarifMinReservableHotel = tarifMinReservableHotel
        self.tarifSante = tarifSante
        self.tarifsGenerique = tarifsGenerique
        self.tarifsHebergement = tarifsHebergement
        self.tarifsRestauration = tarifsRestauration
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case affichageSeo = "affichage_seo"
        case tarifAmeli = "tarif_ameli"
        case tarifConventionne = "tarif_conventionne"
        case tarifMinReservableHotel = "tarif_min_reservable_hotel"
        case tarifSante = "tarif_sante"
        case tarifsGenerique = "tarifs_generique"
        case tarifsHebergement = "tarifs_hebergement"
        case tarifsRestauration = "tarifs_restauration"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        affichageSeo = try container.decodeIfPresent(.affichageSeo)
        tarifAmeli = try container.decodeIfPresent(.tarifAmeli)
        tarifConventionne = try container.decodeIfPresent(.tarifConventionne)
        tarifMinReservableHotel = try container.decodeIfPresent(.tarifMinReservableHotel)
        tarifSante = try container.decodeIfPresent(.tarifSante)
        tarifsGenerique = try container.decodeIfPresent(.tarifsGenerique)
        tarifsHebergement = try container.decodeIfPresent(.tarifsHebergement)
        tarifsRestauration = try container.decodeIfPresent(.tarifsRestauration)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(affichageSeo, forKey: .affichageSeo)
        try container.encodeIfPresent(tarifAmeli, forKey: .tarifAmeli)
        try container.encodeIfPresent(tarifConventionne, forKey: .tarifConventionne)
        try container.encodeIfPresent(tarifMinReservableHotel, forKey: .tarifMinReservableHotel)
        try container.encodeIfPresent(tarifSante, forKey: .tarifSante)
        try container.encodeIfPresent(tarifsGenerique, forKey: .tarifsGenerique)
        try container.encodeIfPresent(tarifsHebergement, forKey: .tarifsHebergement)
        try container.encodeIfPresent(tarifsRestauration, forKey: .tarifsRestauration)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInformationsTarifairesOrcFD else { return false }
      guard self.affichageSeo == object.affichageSeo else { return false }
      guard self.tarifAmeli == object.tarifAmeli else { return false }
      guard self.tarifConventionne == object.tarifConventionne else { return false }
      guard self.tarifMinReservableHotel == object.tarifMinReservableHotel else { return false }
      guard self.tarifSante == object.tarifSante else { return false }
      guard self.tarifsGenerique == object.tarifsGenerique else { return false }
      guard self.tarifsHebergement == object.tarifsHebergement else { return false }
      guard self.tarifsRestauration == object.tarifsRestauration else { return false }
      return true
    }

    public static func == (lhs: SKRInformationsTarifairesOrcFD, rhs: SKRInformationsTarifairesOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

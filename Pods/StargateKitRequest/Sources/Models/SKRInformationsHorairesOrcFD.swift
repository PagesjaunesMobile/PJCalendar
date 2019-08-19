/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInformationsHorairesOrcFD: StargateKitModel {

    public var checkInOut: SKRCheckInOutOrcFD?

    public var freeHours: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var fuseauHoraire: String?

    public var happyHours: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD?

    public var horaires: SKRMasquableSEOElementListeOrcFDHoraireOrcFD?

    public init(checkInOut: SKRCheckInOutOrcFD? = nil, freeHours: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, fuseauHoraire: String? = nil, happyHours: SKRMasquableSEOElementListeOrcFDLibelleLogoOrcFD? = nil, horaires: SKRMasquableSEOElementListeOrcFDHoraireOrcFD? = nil) {
        self.checkInOut = checkInOut
        self.freeHours = freeHours
        self.fuseauHoraire = fuseauHoraire
        self.happyHours = happyHours
        self.horaires = horaires
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case checkInOut = "check_in_out"
        case freeHours = "free_hours"
        case fuseauHoraire = "fuseau_horaire"
        case happyHours = "happy_hours"
        case horaires
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        checkInOut = try container.decodeIfPresent(.checkInOut)
        freeHours = try container.decodeIfPresent(.freeHours)
        fuseauHoraire = try container.decodeIfPresent(.fuseauHoraire)
        happyHours = try container.decodeIfPresent(.happyHours)
        horaires = try container.decodeIfPresent(.horaires)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(checkInOut, forKey: .checkInOut)
        try container.encodeIfPresent(freeHours, forKey: .freeHours)
        try container.encodeIfPresent(fuseauHoraire, forKey: .fuseauHoraire)
        try container.encodeIfPresent(happyHours, forKey: .happyHours)
        try container.encodeIfPresent(horaires, forKey: .horaires)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInformationsHorairesOrcFD else { return false }
      guard self.checkInOut == object.checkInOut else { return false }
      guard self.freeHours == object.freeHours else { return false }
      guard self.fuseauHoraire == object.fuseauHoraire else { return false }
      guard self.happyHours == object.happyHours else { return false }
      guard self.horaires == object.horaires else { return false }
      return true
    }

    public static func == (lhs: SKRInformationsHorairesOrcFD, rhs: SKRInformationsHorairesOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRConventionnementOrcFD: StargateKitModel {

    public enum SKRSource: String, Codable, Hashable, CaseIterable {
        case cviv = "CVIV"
        case dv = "DV"
        case de = "DE"
        case partenaire = "PARTENAIRE"
        case search = "SEARCH"
        case ameli = "AMELI"
    }

    public var carteVitale: Bool?

    public var contratAccesSoins: Bool?

    public var conventionne: Bool?

    public var secteur: String?

    public var source: SKRSource?

    public init(carteVitale: Bool? = nil, contratAccesSoins: Bool? = nil, conventionne: Bool? = nil, secteur: String? = nil, source: SKRSource? = nil) {
        self.carteVitale = carteVitale
        self.contratAccesSoins = contratAccesSoins
        self.conventionne = conventionne
        self.secteur = secteur
        self.source = source
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case carteVitale = "carte_vitale"
        case contratAccesSoins = "contrat_acces_soins"
        case conventionne
        case secteur
        case source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        carteVitale = try container.decodeIfPresent(.carteVitale)
        contratAccesSoins = try container.decodeIfPresent(.contratAccesSoins)
        conventionne = try container.decodeIfPresent(.conventionne)
        secteur = try container.decodeIfPresent(.secteur)
        source = try container.decodeIfPresent(.source)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(carteVitale, forKey: .carteVitale)
        try container.encodeIfPresent(contratAccesSoins, forKey: .contratAccesSoins)
        try container.encodeIfPresent(conventionne, forKey: .conventionne)
        try container.encodeIfPresent(secteur, forKey: .secteur)
        try container.encodeIfPresent(source, forKey: .source)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRConventionnementOrcFD else { return false }
      guard self.carteVitale == object.carteVitale else { return false }
      guard self.contratAccesSoins == object.contratAccesSoins else { return false }
      guard self.conventionne == object.conventionne else { return false }
      guard self.secteur == object.secteur else { return false }
      guard self.source == object.source else { return false }
      return true
    }

    public static func == (lhs: SKRConventionnementOrcFD, rhs: SKRConventionnementOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

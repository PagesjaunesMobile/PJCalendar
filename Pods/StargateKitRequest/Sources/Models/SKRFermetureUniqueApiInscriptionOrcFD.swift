/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRFermetureUniqueApiInscriptionOrcFD: StargateKitModel {

    public enum SKRTypeFermetureUnique: String, Codable, Hashable, CaseIterable {
        case mois = "MOIS"
        case jourSemaine = "JOUR_SEMAINE"
        case date = "DATE"
    }

    public enum SKRTypePeriodeFermeture: String, Codable, Hashable, CaseIterable {
        case unique = "UNIQUE"
        case intervalle = "INTERVALLE"
    }

    public var typeFermetureUnique: SKRTypeFermetureUnique

    public var typePeriodeFermeture: SKRTypePeriodeFermeture

    public var valeur: String?

    public init(typeFermetureUnique: SKRTypeFermetureUnique, typePeriodeFermeture: SKRTypePeriodeFermeture, valeur: String? = nil) {
        self.typeFermetureUnique = typeFermetureUnique
        self.typePeriodeFermeture = typePeriodeFermeture
        self.valeur = valeur
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case typeFermetureUnique = "type_fermeture_unique"
        case typePeriodeFermeture = "type_periode_fermeture"
        case valeur
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        typeFermetureUnique = try container.decode(.typeFermetureUnique)
        typePeriodeFermeture = try container.decode(.typePeriodeFermeture)
        valeur = try container.decodeIfPresent(.valeur)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(typeFermetureUnique, forKey: .typeFermetureUnique)
        try container.encode(typePeriodeFermeture, forKey: .typePeriodeFermeture)
        try container.encodeIfPresent(valeur, forKey: .valeur)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRFermetureUniqueApiInscriptionOrcFD else { return false }
      guard self.typeFermetureUnique == object.typeFermetureUnique else { return false }
      guard self.typePeriodeFermeture == object.typePeriodeFermeture else { return false }
      guard self.valeur == object.valeur else { return false }
      return true
    }

    public static func == (lhs: SKRFermetureUniqueApiInscriptionOrcFD, rhs: SKRFermetureUniqueApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

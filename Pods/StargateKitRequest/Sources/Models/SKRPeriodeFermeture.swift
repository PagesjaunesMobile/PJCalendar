/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPeriodeFermeture: StargateKitModel {

    public enum SKRTypePeriodeFermeture: String, Codable, Hashable, CaseIterable {
        case unique = "UNIQUE"
        case intervalle = "INTERVALLE"
    }

    public enum SKRTypeFermetureUnique: String, Codable, Hashable, CaseIterable {
        case mois = "MOIS"
        case jourSemaine = "JOUR_SEMAINE"
        case date = "DATE"
    }

    public enum SKRTypeIntervalleFermeture: String, Codable, Hashable, CaseIterable {
        case mois = "MOIS"
        case jourSemaine = "JOUR_SEMAINE"
        case date = "DATE"
    }

    public var typePeriodeFermeture: SKRTypePeriodeFermeture

    public var debut: SKRFermetureUniqueApiInscriptionOrcFD?

    public var fin: SKRFermetureUniqueApiInscriptionOrcFD?

    public var typeFermetureUnique: SKRTypeFermetureUnique?

    public var typeIntervalleFermeture: SKRTypeIntervalleFermeture?

    public var valeur: String?

    public init(typePeriodeFermeture: SKRTypePeriodeFermeture, debut: SKRFermetureUniqueApiInscriptionOrcFD? = nil, fin: SKRFermetureUniqueApiInscriptionOrcFD? = nil, typeFermetureUnique: SKRTypeFermetureUnique? = nil, typeIntervalleFermeture: SKRTypeIntervalleFermeture? = nil, valeur: String? = nil) {
        self.typePeriodeFermeture = typePeriodeFermeture
        self.debut = debut
        self.fin = fin
        self.typeFermetureUnique = typeFermetureUnique
        self.typeIntervalleFermeture = typeIntervalleFermeture
        self.valeur = valeur
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case typePeriodeFermeture = "type_periode_fermeture"
        case debut
        case fin
        case typeFermetureUnique = "type_fermeture_unique"
        case typeIntervalleFermeture = "type_intervalle_fermeture"
        case valeur
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        typePeriodeFermeture = try container.decode(.typePeriodeFermeture)
        debut = try container.decodeIfPresent(.debut)
        fin = try container.decodeIfPresent(.fin)
        typeFermetureUnique = try container.decodeIfPresent(.typeFermetureUnique)
        typeIntervalleFermeture = try container.decodeIfPresent(.typeIntervalleFermeture)
        valeur = try container.decodeIfPresent(.valeur)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(typePeriodeFermeture, forKey: .typePeriodeFermeture)
        try container.encodeIfPresent(debut, forKey: .debut)
        try container.encodeIfPresent(fin, forKey: .fin)
        try container.encodeIfPresent(typeFermetureUnique, forKey: .typeFermetureUnique)
        try container.encodeIfPresent(typeIntervalleFermeture, forKey: .typeIntervalleFermeture)
        try container.encodeIfPresent(valeur, forKey: .valeur)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPeriodeFermeture else { return false }
      guard self.typePeriodeFermeture == object.typePeriodeFermeture else { return false }
      guard self.debut == object.debut else { return false }
      guard self.fin == object.fin else { return false }
      guard self.typeFermetureUnique == object.typeFermetureUnique else { return false }
      guard self.typeIntervalleFermeture == object.typeIntervalleFermeture else { return false }
      guard self.valeur == object.valeur else { return false }
      return true
    }

    public static func == (lhs: SKRPeriodeFermeture, rhs: SKRPeriodeFermeture) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

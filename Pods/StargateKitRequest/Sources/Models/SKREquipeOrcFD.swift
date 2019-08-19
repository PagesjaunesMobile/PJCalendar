/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREquipeOrcFD: StargateKitModel {

    public var nombrePraticiens: Int?

    public var praticiens: [SKRPraticien]?

    public init(nombrePraticiens: Int? = nil, praticiens: [SKRPraticien]? = nil) {
        self.nombrePraticiens = nombrePraticiens
        self.praticiens = praticiens
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case nombrePraticiens = "nombre_praticiens"
        case praticiens
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nombrePraticiens = try container.decodeIfPresent(.nombrePraticiens)
        praticiens = try container.decodeArrayIfPresent(.praticiens)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(nombrePraticiens, forKey: .nombrePraticiens)
        try container.encodeIfPresent(praticiens, forKey: .praticiens)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREquipeOrcFD else { return false }
      guard self.nombrePraticiens == object.nombrePraticiens else { return false }
      guard self.praticiens == object.praticiens else { return false }
      return true
    }

    public static func == (lhs: SKREquipeOrcFD, rhs: SKREquipeOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

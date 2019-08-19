/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPraticien: StargateKitModel {

    public var denomination: String?

    public var epj: String?

    public var id: String?

    public var libelleRubrique: String?

    public var lien: SKRLienOrcFD?

    public var photo: String?

    public var visuel: SKRVisuelOrcFD?

    public init(denomination: String? = nil, epj: String? = nil, id: String? = nil, libelleRubrique: String? = nil, lien: SKRLienOrcFD? = nil, photo: String? = nil, visuel: SKRVisuelOrcFD? = nil) {
        self.denomination = denomination
        self.epj = epj
        self.id = id
        self.libelleRubrique = libelleRubrique
        self.lien = lien
        self.photo = photo
        self.visuel = visuel
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case denomination
        case epj
        case id
        case libelleRubrique = "libelle_rubrique"
        case lien
        case photo
        case visuel
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        denomination = try container.decodeIfPresent(.denomination)
        epj = try container.decodeIfPresent(.epj)
        id = try container.decodeIfPresent(.id)
        libelleRubrique = try container.decodeIfPresent(.libelleRubrique)
        lien = try container.decodeIfPresent(.lien)
        photo = try container.decodeIfPresent(.photo)
        visuel = try container.decodeIfPresent(.visuel)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(denomination, forKey: .denomination)
        try container.encodeIfPresent(epj, forKey: .epj)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(libelleRubrique, forKey: .libelleRubrique)
        try container.encodeIfPresent(lien, forKey: .lien)
        try container.encodeIfPresent(photo, forKey: .photo)
        try container.encodeIfPresent(visuel, forKey: .visuel)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPraticien else { return false }
      guard self.denomination == object.denomination else { return false }
      guard self.epj == object.epj else { return false }
      guard self.id == object.id else { return false }
      guard self.libelleRubrique == object.libelleRubrique else { return false }
      guard self.lien == object.lien else { return false }
      guard self.photo == object.photo else { return false }
      guard self.visuel == object.visuel else { return false }
      return true
    }

    public static func == (lhs: SKRPraticien, rhs: SKRPraticien) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

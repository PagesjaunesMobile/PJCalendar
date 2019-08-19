/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRNews: StargateKitModel {

    public var dateD: DateTime?

    public var dateELabel: String?

    public var dateF: DateTime?

    public var dateP: String?

    public var datePLabel: String?

    public var desc: String?

    public var id: String?

    public var site: String?

    public var titre: String?

    public var urlP: String?

    public init(dateD: DateTime? = nil, dateELabel: String? = nil, dateF: DateTime? = nil, dateP: String? = nil, datePLabel: String? = nil, desc: String? = nil, id: String? = nil, site: String? = nil, titre: String? = nil, urlP: String? = nil) {
        self.dateD = dateD
        self.dateELabel = dateELabel
        self.dateF = dateF
        self.dateP = dateP
        self.datePLabel = datePLabel
        self.desc = desc
        self.id = id
        self.site = site
        self.titre = titre
        self.urlP = urlP
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case dateD
        case dateELabel
        case dateF
        case dateP
        case datePLabel
        case desc
        case id
        case site
        case titre
        case urlP
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dateD = try container.decodeIfPresent(.dateD)
        dateELabel = try container.decodeIfPresent(.dateELabel)
        dateF = try container.decodeIfPresent(.dateF)
        dateP = try container.decodeIfPresent(.dateP)
        datePLabel = try container.decodeIfPresent(.datePLabel)
        desc = try container.decodeIfPresent(.desc)
        id = try container.decodeIfPresent(.id)
        site = try container.decodeIfPresent(.site)
        titre = try container.decodeIfPresent(.titre)
        urlP = try container.decodeIfPresent(.urlP)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(dateD, forKey: .dateD)
        try container.encodeIfPresent(dateELabel, forKey: .dateELabel)
        try container.encodeIfPresent(dateF, forKey: .dateF)
        try container.encodeIfPresent(dateP, forKey: .dateP)
        try container.encodeIfPresent(datePLabel, forKey: .datePLabel)
        try container.encodeIfPresent(desc, forKey: .desc)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(site, forKey: .site)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(urlP, forKey: .urlP)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRNews else { return false }
      guard self.dateD == object.dateD else { return false }
      guard self.dateELabel == object.dateELabel else { return false }
      guard self.dateF == object.dateF else { return false }
      guard self.dateP == object.dateP else { return false }
      guard self.datePLabel == object.datePLabel else { return false }
      guard self.desc == object.desc else { return false }
      guard self.id == object.id else { return false }
      guard self.site == object.site else { return false }
      guard self.titre == object.titre else { return false }
      guard self.urlP == object.urlP else { return false }
      return true
    }

    public static func == (lhs: SKRNews, rhs: SKRNews) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

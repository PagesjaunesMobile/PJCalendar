/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMedia: StargateKitModel {

    public var category: String?

    public var dateDebut: DateTime?

    public var dateFin: DateTime?

    public var horizontalAlignment: String?

    public var horizontalConstraint: Int?

    public var isWeekend: Bool?

    public var keyword: String?

    public var name: String?

    public var onHome: Bool?

    public var originX: Int?

    public var originY: Int?

    public var size: String?

    public var sousTitre: String?

    public var surcharge: Bool?

    public var titre: String?

    public var type: String?

    public var url: String?

    public var verticalAlignment: String?

    public var verticalConstraint: Int?

    public init(category: String? = nil, dateDebut: DateTime? = nil, dateFin: DateTime? = nil, horizontalAlignment: String? = nil, horizontalConstraint: Int? = nil, isWeekend: Bool? = nil, keyword: String? = nil, name: String? = nil, onHome: Bool? = nil, originX: Int? = nil, originY: Int? = nil, size: String? = nil, sousTitre: String? = nil, surcharge: Bool? = nil, titre: String? = nil, type: String? = nil, url: String? = nil, verticalAlignment: String? = nil, verticalConstraint: Int? = nil) {
        self.category = category
        self.dateDebut = dateDebut
        self.dateFin = dateFin
        self.horizontalAlignment = horizontalAlignment
        self.horizontalConstraint = horizontalConstraint
        self.isWeekend = isWeekend
        self.keyword = keyword
        self.name = name
        self.onHome = onHome
        self.originX = originX
        self.originY = originY
        self.size = size
        self.sousTitre = sousTitre
        self.surcharge = surcharge
        self.titre = titre
        self.type = type
        self.url = url
        self.verticalAlignment = verticalAlignment
        self.verticalConstraint = verticalConstraint
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case category
        case dateDebut
        case dateFin
        case horizontalAlignment
        case horizontalConstraint
        case isWeekend
        case keyword
        case name
        case onHome
        case originX
        case originY
        case size
        case sousTitre
        case surcharge
        case titre
        case type
        case url
        case verticalAlignment
        case verticalConstraint
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        category = try container.decodeIfPresent(.category)
        dateDebut = try container.decodeIfPresent(.dateDebut)
        dateFin = try container.decodeIfPresent(.dateFin)
        horizontalAlignment = try container.decodeIfPresent(.horizontalAlignment)
        horizontalConstraint = try container.decodeIfPresent(.horizontalConstraint)
        isWeekend = try container.decodeIfPresent(.isWeekend)
        keyword = try container.decodeIfPresent(.keyword)
        name = try container.decodeIfPresent(.name)
        onHome = try container.decodeIfPresent(.onHome)
        originX = try container.decodeIfPresent(.originX)
        originY = try container.decodeIfPresent(.originY)
        size = try container.decodeIfPresent(.size)
        sousTitre = try container.decodeIfPresent(.sousTitre)
        surcharge = try container.decodeIfPresent(.surcharge)
        titre = try container.decodeIfPresent(.titre)
        type = try container.decodeIfPresent(.type)
        url = try container.decodeIfPresent(.url)
        verticalAlignment = try container.decodeIfPresent(.verticalAlignment)
        verticalConstraint = try container.decodeIfPresent(.verticalConstraint)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(dateDebut, forKey: .dateDebut)
        try container.encodeIfPresent(dateFin, forKey: .dateFin)
        try container.encodeIfPresent(horizontalAlignment, forKey: .horizontalAlignment)
        try container.encodeIfPresent(horizontalConstraint, forKey: .horizontalConstraint)
        try container.encodeIfPresent(isWeekend, forKey: .isWeekend)
        try container.encodeIfPresent(keyword, forKey: .keyword)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(onHome, forKey: .onHome)
        try container.encodeIfPresent(originX, forKey: .originX)
        try container.encodeIfPresent(originY, forKey: .originY)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(sousTitre, forKey: .sousTitre)
        try container.encodeIfPresent(surcharge, forKey: .surcharge)
        try container.encodeIfPresent(titre, forKey: .titre)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(verticalAlignment, forKey: .verticalAlignment)
        try container.encodeIfPresent(verticalConstraint, forKey: .verticalConstraint)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMedia else { return false }
      guard self.category == object.category else { return false }
      guard self.dateDebut == object.dateDebut else { return false }
      guard self.dateFin == object.dateFin else { return false }
      guard self.horizontalAlignment == object.horizontalAlignment else { return false }
      guard self.horizontalConstraint == object.horizontalConstraint else { return false }
      guard self.isWeekend == object.isWeekend else { return false }
      guard self.keyword == object.keyword else { return false }
      guard self.name == object.name else { return false }
      guard self.onHome == object.onHome else { return false }
      guard self.originX == object.originX else { return false }
      guard self.originY == object.originY else { return false }
      guard self.size == object.size else { return false }
      guard self.sousTitre == object.sousTitre else { return false }
      guard self.surcharge == object.surcharge else { return false }
      guard self.titre == object.titre else { return false }
      guard self.type == object.type else { return false }
      guard self.url == object.url else { return false }
      guard self.verticalAlignment == object.verticalAlignment else { return false }
      guard self.verticalConstraint == object.verticalConstraint else { return false }
      return true
    }

    public static func == (lhs: SKRMedia, rhs: SKRMedia) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

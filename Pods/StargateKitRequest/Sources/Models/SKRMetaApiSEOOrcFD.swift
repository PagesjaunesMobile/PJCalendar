/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMetaApiSEOOrcFD: StargateKitModel {

    public enum SKRTypeMeta: String, Codable, Hashable, CaseIterable {
        case meta = "META"
        case link = "LINK"
    }

    public enum SKRTypesReglesMeta: String, Codable, Hashable, CaseIterable {
        case url = "URL"
        case nonOuvert = "NON_OUVERT"
        case pattern = "PATTERN"
        case urlNext = "URL_NEXT"
        case urlPrev = "URL_PREV"
        case pageReferencee = "PAGE_REFERENCEE"
    }

    public var cle: String?

    public var media: String?

    public var prioriteAffichage: Int?

    public var typeMeta: SKRTypeMeta?

    public var typesReglesMeta: [SKRTypesReglesMeta]?

    public var valeur: String?

    public init(cle: String? = nil, media: String? = nil, prioriteAffichage: Int? = nil, typeMeta: SKRTypeMeta? = nil, typesReglesMeta: [SKRTypesReglesMeta]? = nil, valeur: String? = nil) {
        self.cle = cle
        self.media = media
        self.prioriteAffichage = prioriteAffichage
        self.typeMeta = typeMeta
        self.typesReglesMeta = typesReglesMeta
        self.valeur = valeur
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case cle
        case media
        case prioriteAffichage = "priorite_affichage"
        case typeMeta = "type_meta"
        case typesReglesMeta = "types_regles_meta"
        case valeur
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        cle = try container.decodeIfPresent(.cle)
        media = try container.decodeIfPresent(.media)
        prioriteAffichage = try container.decodeIfPresent(.prioriteAffichage)
        typeMeta = try container.decodeIfPresent(.typeMeta)
        typesReglesMeta = try container.decodeArrayIfPresent(.typesReglesMeta)
        valeur = try container.decodeIfPresent(.valeur)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(cle, forKey: .cle)
        try container.encodeIfPresent(media, forKey: .media)
        try container.encodeIfPresent(prioriteAffichage, forKey: .prioriteAffichage)
        try container.encodeIfPresent(typeMeta, forKey: .typeMeta)
        try container.encodeIfPresent(typesReglesMeta, forKey: .typesReglesMeta)
        try container.encodeIfPresent(valeur, forKey: .valeur)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMetaApiSEOOrcFD else { return false }
      guard self.cle == object.cle else { return false }
      guard self.media == object.media else { return false }
      guard self.prioriteAffichage == object.prioriteAffichage else { return false }
      guard self.typeMeta == object.typeMeta else { return false }
      guard self.typesReglesMeta == object.typesReglesMeta else { return false }
      guard self.valeur == object.valeur else { return false }
      return true
    }

    public static func == (lhs: SKRMetaApiSEOOrcFD, rhs: SKRMetaApiSEOOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

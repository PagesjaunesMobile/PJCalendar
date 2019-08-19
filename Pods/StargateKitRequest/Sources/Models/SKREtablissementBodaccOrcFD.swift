/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREtablissementBodaccOrcFD: StargateKitModel {

    public var activite: String?

    public var adresse: String?

    public var enseigne: String?

    public var origineFonds: String?

    public var qualite: String?

    public init(activite: String? = nil, adresse: String? = nil, enseigne: String? = nil, origineFonds: String? = nil, qualite: String? = nil) {
        self.activite = activite
        self.adresse = adresse
        self.enseigne = enseigne
        self.origineFonds = origineFonds
        self.qualite = qualite
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case activite
        case adresse
        case enseigne
        case origineFonds = "origine_fonds"
        case qualite
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        activite = try container.decodeIfPresent(.activite)
        adresse = try container.decodeIfPresent(.adresse)
        enseigne = try container.decodeIfPresent(.enseigne)
        origineFonds = try container.decodeIfPresent(.origineFonds)
        qualite = try container.decodeIfPresent(.qualite)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(activite, forKey: .activite)
        try container.encodeIfPresent(adresse, forKey: .adresse)
        try container.encodeIfPresent(enseigne, forKey: .enseigne)
        try container.encodeIfPresent(origineFonds, forKey: .origineFonds)
        try container.encodeIfPresent(qualite, forKey: .qualite)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREtablissementBodaccOrcFD else { return false }
      guard self.activite == object.activite else { return false }
      guard self.adresse == object.adresse else { return false }
      guard self.enseigne == object.enseigne else { return false }
      guard self.origineFonds == object.origineFonds else { return false }
      guard self.qualite == object.qualite else { return false }
      return true
    }

    public static func == (lhs: SKREtablissementBodaccOrcFD, rhs: SKREtablissementBodaccOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

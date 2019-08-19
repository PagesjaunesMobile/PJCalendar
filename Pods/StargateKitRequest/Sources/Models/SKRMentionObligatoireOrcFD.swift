/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRMentionObligatoireOrcFD: StargateKitModel {

    public enum SKRTypeMention: String, Codable, Hashable, CaseIterable {
        case individuelle = "INDIVIDUELLE"
        case generique = "GENERIQUE"
        case domiciliation = "DOMICILIATION"
    }

    public var contenu: String?

    public var libelle: String?

    public var typeMention: SKRTypeMention?

    public init(contenu: String? = nil, libelle: String? = nil, typeMention: SKRTypeMention? = nil) {
        self.contenu = contenu
        self.libelle = libelle
        self.typeMention = typeMention
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case contenu
        case libelle
        case typeMention = "type_mention"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        contenu = try container.decodeIfPresent(.contenu)
        libelle = try container.decodeIfPresent(.libelle)
        typeMention = try container.decodeIfPresent(.typeMention)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(contenu, forKey: .contenu)
        try container.encodeIfPresent(libelle, forKey: .libelle)
        try container.encodeIfPresent(typeMention, forKey: .typeMention)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRMentionObligatoireOrcFD else { return false }
      guard self.contenu == object.contenu else { return false }
      guard self.libelle == object.libelle else { return false }
      guard self.typeMention == object.typeMention else { return false }
      return true
    }

    public static func == (lhs: SKRMentionObligatoireOrcFD, rhs: SKRMentionObligatoireOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

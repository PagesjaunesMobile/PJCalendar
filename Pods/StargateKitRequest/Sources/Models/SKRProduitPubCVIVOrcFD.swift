/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRProduitPubCVIVOrcFD: StargateKitModel {

    public enum SKRTypeTemplate: String, Codable, Hashable, CaseIterable {
        case t1 = "T1"
        case t2 = "T2"
        case t3 = "T3"
        case t3b = "T3b"
        case t4 = "T4"
        case t4b = "T4b"
        case t5 = "T5"
        case t6 = "T6"
        case t7 = "T7"
        case t8 = "T8"
    }

    public var client: String?

    public var code: String?

    public var identifiant: String?

    public var typeTemplate: SKRTypeTemplate?

    public init(client: String? = nil, code: String? = nil, identifiant: String? = nil, typeTemplate: SKRTypeTemplate? = nil) {
        self.client = client
        self.code = code
        self.identifiant = identifiant
        self.typeTemplate = typeTemplate
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case client
        case code
        case identifiant
        case typeTemplate = "type_template"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        client = try container.decodeIfPresent(.client)
        code = try container.decodeIfPresent(.code)
        identifiant = try container.decodeIfPresent(.identifiant)
        typeTemplate = try container.decodeIfPresent(.typeTemplate)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(client, forKey: .client)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(identifiant, forKey: .identifiant)
        try container.encodeIfPresent(typeTemplate, forKey: .typeTemplate)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRProduitPubCVIVOrcFD else { return false }
      guard self.client == object.client else { return false }
      guard self.code == object.code else { return false }
      guard self.identifiant == object.identifiant else { return false }
      guard self.typeTemplate == object.typeTemplate else { return false }
      return true
    }

    public static func == (lhs: SKRProduitPubCVIVOrcFD, rhs: SKRProduitPubCVIVOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRCoordonnee: StargateKitModel {

    public enum SKRTypeCoordonnee: String, Codable, Hashable, CaseIterable {
        case inscription = "INSCRIPTION"
        case epjLie = "EPJ_LIE"
    }

    public var adresse: SKRAdresseApiInscriptionOrcFD?

    public var cartographie: SKRCartographie?

    public var codeEtablissement: String?

    public var denomination: String?

    public var moyensContactsDesignes: [SKRMoyensContactsDesignesOrcFD]?

    public var numeroSequence: Int?

    public var typeCoordonnee: SKRTypeCoordonnee?

    public init(adresse: SKRAdresseApiInscriptionOrcFD? = nil, cartographie: SKRCartographie? = nil, codeEtablissement: String? = nil, denomination: String? = nil, moyensContactsDesignes: [SKRMoyensContactsDesignesOrcFD]? = nil, numeroSequence: Int? = nil, typeCoordonnee: SKRTypeCoordonnee? = nil) {
        self.adresse = adresse
        self.cartographie = cartographie
        self.codeEtablissement = codeEtablissement
        self.denomination = denomination
        self.moyensContactsDesignes = moyensContactsDesignes
        self.numeroSequence = numeroSequence
        self.typeCoordonnee = typeCoordonnee
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case adresse
        case cartographie
        case codeEtablissement = "code_etablissement"
        case denomination
        case moyensContactsDesignes = "moyens_contacts_designes"
        case numeroSequence = "numero_sequence"
        case typeCoordonnee = "type_coordonnee"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        adresse = try container.decodeIfPresent(.adresse)
        cartographie = try container.decodeIfPresent(.cartographie)
        codeEtablissement = try container.decodeIfPresent(.codeEtablissement)
        denomination = try container.decodeIfPresent(.denomination)
        moyensContactsDesignes = try container.decodeArrayIfPresent(.moyensContactsDesignes)
        numeroSequence = try container.decodeIfPresent(.numeroSequence)
        typeCoordonnee = try container.decodeIfPresent(.typeCoordonnee)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(adresse, forKey: .adresse)
        try container.encodeIfPresent(cartographie, forKey: .cartographie)
        try container.encodeIfPresent(codeEtablissement, forKey: .codeEtablissement)
        try container.encodeIfPresent(denomination, forKey: .denomination)
        try container.encodeIfPresent(moyensContactsDesignes, forKey: .moyensContactsDesignes)
        try container.encodeIfPresent(numeroSequence, forKey: .numeroSequence)
        try container.encodeIfPresent(typeCoordonnee, forKey: .typeCoordonnee)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRCoordonnee else { return false }
      guard self.adresse == object.adresse else { return false }
      guard self.cartographie == object.cartographie else { return false }
      guard self.codeEtablissement == object.codeEtablissement else { return false }
      guard self.denomination == object.denomination else { return false }
      guard self.moyensContactsDesignes == object.moyensContactsDesignes else { return false }
      guard self.numeroSequence == object.numeroSequence else { return false }
      guard self.typeCoordonnee == object.typeCoordonnee else { return false }
      return true
    }

    public static func == (lhs: SKRCoordonnee, rhs: SKRCoordonnee) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

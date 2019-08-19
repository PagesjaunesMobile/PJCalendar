/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRContactsB2BApiInscriptionOrcFD: StargateKitModel {

    public var email: String?

    public var fonction: String?

    public var nomPrenom: String?

    public var numero: String?

    public init(email: String? = nil, fonction: String? = nil, nomPrenom: String? = nil, numero: String? = nil) {
        self.email = email
        self.fonction = fonction
        self.nomPrenom = nomPrenom
        self.numero = numero
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case email
        case fonction
        case nomPrenom = "nom_prenom"
        case numero
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        email = try container.decodeIfPresent(.email)
        fonction = try container.decodeIfPresent(.fonction)
        nomPrenom = try container.decodeIfPresent(.nomPrenom)
        numero = try container.decodeIfPresent(.numero)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(fonction, forKey: .fonction)
        try container.encodeIfPresent(nomPrenom, forKey: .nomPrenom)
        try container.encodeIfPresent(numero, forKey: .numero)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRContactsB2BApiInscriptionOrcFD else { return false }
      guard self.email == object.email else { return false }
      guard self.fonction == object.fonction else { return false }
      guard self.nomPrenom == object.nomPrenom else { return false }
      guard self.numero == object.numero else { return false }
      return true
    }

    public static func == (lhs: SKRContactsB2BApiInscriptionOrcFD, rhs: SKRContactsB2BApiInscriptionOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKREngagementEcoResponsableOrcFD: StargateKitModel {

    public enum SKRTypeEngagement: String, Codable, Hashable, CaseIterable {
        case ecoProduit = "ECO_PRODUIT"
        case economieEnergie = "ECONOMIE_ENERGIE"
        case gestionDechets = "GESTION_DECHETS"
        case responsabiliteSocietale = "RESPONSABILITE_SOCIETALE"
    }

    public var description: String?

    public var typeEngagement: SKRTypeEngagement?

    public init(description: String? = nil, typeEngagement: SKRTypeEngagement? = nil) {
        self.description = description
        self.typeEngagement = typeEngagement
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case description
        case typeEngagement = "type_engagement"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        description = try container.decodeIfPresent(.description)
        typeEngagement = try container.decodeIfPresent(.typeEngagement)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(typeEngagement, forKey: .typeEngagement)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKREngagementEcoResponsableOrcFD else { return false }
      guard self.description == object.description else { return false }
      guard self.typeEngagement == object.typeEngagement else { return false }
      return true
    }

    public static func == (lhs: SKREngagementEcoResponsableOrcFD, rhs: SKREngagementEcoResponsableOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

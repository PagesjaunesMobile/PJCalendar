/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRInfoJour: StargateKitModel {

    public var typOuv: Int

    public var creneau: [SKRCreneauHoraire]?

    public var text: String?

    public init(typOuv: Int, creneau: [SKRCreneauHoraire]? = nil, text: String? = nil) {
        self.typOuv = typOuv
        self.creneau = creneau
        self.text = text
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case typOuv
        case creneau
        case text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        typOuv = try container.decode(.typOuv)
        creneau = try container.decodeArrayIfPresent(.creneau)
        text = try container.decodeIfPresent(.text)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(typOuv, forKey: .typOuv)
        try container.encodeIfPresent(creneau, forKey: .creneau)
        try container.encodeIfPresent(text, forKey: .text)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRInfoJour else { return false }
      guard self.typOuv == object.typOuv else { return false }
      guard self.creneau == object.creneau else { return false }
      guard self.text == object.text else { return false }
      return true
    }

    public static func == (lhs: SKRInfoJour, rhs: SKRInfoJour) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

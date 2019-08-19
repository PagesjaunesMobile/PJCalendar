/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRActPlace: StargateKitModel {

    public var actCode: String?

    public var formulaire: String?

    public var isCtr: Bool?

    public init(actCode: String? = nil, formulaire: String? = nil, isCtr: Bool? = nil) {
        self.actCode = actCode
        self.formulaire = formulaire
        self.isCtr = isCtr
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case actCode
        case formulaire
        case isCtr
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        actCode = try container.decodeIfPresent(.actCode)
        formulaire = try container.decodeIfPresent(.formulaire)
        isCtr = try container.decodeIfPresent(.isCtr)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(actCode, forKey: .actCode)
        try container.encodeIfPresent(formulaire, forKey: .formulaire)
        try container.encodeIfPresent(isCtr, forKey: .isCtr)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRActPlace else { return false }
      guard self.actCode == object.actCode else { return false }
      guard self.formulaire == object.formulaire else { return false }
      guard self.isCtr == object.isCtr else { return false }
      return true
    }

    public static func == (lhs: SKRActPlace, rhs: SKRActPlace) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

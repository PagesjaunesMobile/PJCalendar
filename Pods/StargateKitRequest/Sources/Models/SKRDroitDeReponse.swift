/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRDroitDeReponse: StargateKitModel {

    public var ddrId: String?

    public var mDate: String?

    public var text: String?

    public init(ddrId: String? = nil, mDate: String? = nil, text: String? = nil) {
        self.ddrId = ddrId
        self.mDate = mDate
        self.text = text
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case ddrId
        case mDate
        case text
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        ddrId = try container.decodeIfPresent(.ddrId)
        mDate = try container.decodeIfPresent(.mDate)
        text = try container.decodeIfPresent(.text)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(ddrId, forKey: .ddrId)
        try container.encodeIfPresent(mDate, forKey: .mDate)
        try container.encodeIfPresent(text, forKey: .text)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRDroitDeReponse else { return false }
      guard self.ddrId == object.ddrId else { return false }
      guard self.mDate == object.mDate else { return false }
      guard self.text == object.text else { return false }
      return true
    }

    public static func == (lhs: SKRDroitDeReponse, rhs: SKRDroitDeReponse) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

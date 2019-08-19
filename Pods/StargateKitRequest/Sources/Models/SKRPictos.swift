/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPictos: StargateKitModel {

    public var pictoPay: [SKRPicto]?

    public var pictoReco: [SKRPicto]?

    public var pictoSrv: [SKRPicto]?

    public init(pictoPay: [SKRPicto]? = nil, pictoReco: [SKRPicto]? = nil, pictoSrv: [SKRPicto]? = nil) {
        self.pictoPay = pictoPay
        self.pictoReco = pictoReco
        self.pictoSrv = pictoSrv
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case pictoPay
        case pictoReco
        case pictoSrv
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        pictoPay = try container.decodeArrayIfPresent(.pictoPay)
        pictoReco = try container.decodeArrayIfPresent(.pictoReco)
        pictoSrv = try container.decodeArrayIfPresent(.pictoSrv)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(pictoPay, forKey: .pictoPay)
        try container.encodeIfPresent(pictoReco, forKey: .pictoReco)
        try container.encodeIfPresent(pictoSrv, forKey: .pictoSrv)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPictos else { return false }
      guard self.pictoPay == object.pictoPay else { return false }
      guard self.pictoReco == object.pictoReco else { return false }
      guard self.pictoSrv == object.pictoSrv else { return false }
      return true
    }

    public static func == (lhs: SKRPictos, rhs: SKRPictos) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

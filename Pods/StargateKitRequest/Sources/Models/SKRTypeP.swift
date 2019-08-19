/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRTypeP: StargateKitModel {

    public var appPath: String?

    public var clickP: String?

    public var count: Int?

    public var countAJR: Int?

    public var countAJS: Int?

    public var countP: Int?

    public var countS: Int?

    public var info: String?

    public var labelP: String?

    public var logoP: String?

    public var path: String?

    public var photo: [SKRPhoto]?

    public var pos: String?

    public var type: String?

    public init(appPath: String? = nil, clickP: String? = nil, count: Int? = nil, countAJR: Int? = nil, countAJS: Int? = nil, countP: Int? = nil, countS: Int? = nil, info: String? = nil, labelP: String? = nil, logoP: String? = nil, path: String? = nil, photo: [SKRPhoto]? = nil, pos: String? = nil, type: String? = nil) {
        self.appPath = appPath
        self.clickP = clickP
        self.count = count
        self.countAJR = countAJR
        self.countAJS = countAJS
        self.countP = countP
        self.countS = countS
        self.info = info
        self.labelP = labelP
        self.logoP = logoP
        self.path = path
        self.photo = photo
        self.pos = pos
        self.type = type
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case appPath
        case clickP
        case count
        case countAJR
        case countAJS
        case countP
        case countS
        case info
        case labelP
        case logoP
        case path
        case photo
        case pos
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        appPath = try container.decodeIfPresent(.appPath)
        clickP = try container.decodeIfPresent(.clickP)
        count = try container.decodeIfPresent(.count)
        countAJR = try container.decodeIfPresent(.countAJR)
        countAJS = try container.decodeIfPresent(.countAJS)
        countP = try container.decodeIfPresent(.countP)
        countS = try container.decodeIfPresent(.countS)
        info = try container.decodeIfPresent(.info)
        labelP = try container.decodeIfPresent(.labelP)
        logoP = try container.decodeIfPresent(.logoP)
        path = try container.decodeIfPresent(.path)
        photo = try container.decodeArrayIfPresent(.photo)
        pos = try container.decodeIfPresent(.pos)
        type = try container.decodeIfPresent(.type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(appPath, forKey: .appPath)
        try container.encodeIfPresent(clickP, forKey: .clickP)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(countAJR, forKey: .countAJR)
        try container.encodeIfPresent(countAJS, forKey: .countAJS)
        try container.encodeIfPresent(countP, forKey: .countP)
        try container.encodeIfPresent(countS, forKey: .countS)
        try container.encodeIfPresent(info, forKey: .info)
        try container.encodeIfPresent(labelP, forKey: .labelP)
        try container.encodeIfPresent(logoP, forKey: .logoP)
        try container.encodeIfPresent(path, forKey: .path)
        try container.encodeIfPresent(photo, forKey: .photo)
        try container.encodeIfPresent(pos, forKey: .pos)
        try container.encodeIfPresent(type, forKey: .type)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRTypeP else { return false }
      guard self.appPath == object.appPath else { return false }
      guard self.clickP == object.clickP else { return false }
      guard self.count == object.count else { return false }
      guard self.countAJR == object.countAJR else { return false }
      guard self.countAJS == object.countAJS else { return false }
      guard self.countP == object.countP else { return false }
      guard self.countS == object.countS else { return false }
      guard self.info == object.info else { return false }
      guard self.labelP == object.labelP else { return false }
      guard self.logoP == object.logoP else { return false }
      guard self.path == object.path else { return false }
      guard self.photo == object.photo else { return false }
      guard self.pos == object.pos else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: SKRTypeP, rhs: SKRTypeP) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

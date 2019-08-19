/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRPushA: StargateKitModel {

    public var call: String?

    public var codeAN9: String?

    public var codeEtab: String?

    public var codeLoc: String?

    public var goto: String?

    public var theme: String?

    public var timingAction: String?

    public var timingTransac: String?

    public init(call: String? = nil, codeAN9: String? = nil, codeEtab: String? = nil, codeLoc: String? = nil, goto: String? = nil, theme: String? = nil, timingAction: String? = nil, timingTransac: String? = nil) {
        self.call = call
        self.codeAN9 = codeAN9
        self.codeEtab = codeEtab
        self.codeLoc = codeLoc
        self.goto = goto
        self.theme = theme
        self.timingAction = timingAction
        self.timingTransac = timingTransac
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case call
        case codeAN9
        case codeEtab
        case codeLoc
        case goto
        case theme
        case timingAction
        case timingTransac
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        call = try container.decodeIfPresent(.call)
        codeAN9 = try container.decodeIfPresent(.codeAN9)
        codeEtab = try container.decodeIfPresent(.codeEtab)
        codeLoc = try container.decodeIfPresent(.codeLoc)
        goto = try container.decodeIfPresent(.goto)
        theme = try container.decodeIfPresent(.theme)
        timingAction = try container.decodeIfPresent(.timingAction)
        timingTransac = try container.decodeIfPresent(.timingTransac)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(call, forKey: .call)
        try container.encodeIfPresent(codeAN9, forKey: .codeAN9)
        try container.encodeIfPresent(codeEtab, forKey: .codeEtab)
        try container.encodeIfPresent(codeLoc, forKey: .codeLoc)
        try container.encodeIfPresent(goto, forKey: .goto)
        try container.encodeIfPresent(theme, forKey: .theme)
        try container.encodeIfPresent(timingAction, forKey: .timingAction)
        try container.encodeIfPresent(timingTransac, forKey: .timingTransac)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRPushA else { return false }
      guard self.call == object.call else { return false }
      guard self.codeAN9 == object.codeAN9 else { return false }
      guard self.codeEtab == object.codeEtab else { return false }
      guard self.codeLoc == object.codeLoc else { return false }
      guard self.goto == object.goto else { return false }
      guard self.theme == object.theme else { return false }
      guard self.timingAction == object.timingAction else { return false }
      guard self.timingTransac == object.timingTransac else { return false }
      return true
    }

    public static func == (lhs: SKRPushA, rhs: SKRPushA) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

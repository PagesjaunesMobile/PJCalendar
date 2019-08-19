/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public protocol StargateBaseModel {
  var code: String? { set get }
  var codeCI: String? { set get }
  var msg: String? { set get }
  var token: String? { set get }
}

extension StargateBaseModel  {
  public var code: String? {
    get { return nil }
    set {}
  }
	
  public var codeCI: String? {
    get { return nil }
    set {}
  }
	
  public var msg: String? {
    get { return nil }
    set {}
  }
	
  public var token: String? {
    get { return nil }
    set {}
  }
}

typealias StargateKitModel = StargateBaseModel & Codable & Hashable

extension DateTime : Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(date)
  }
}

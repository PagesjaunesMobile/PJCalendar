// To parse the JSON, add this file to your project and do:
//
//   let buttonKitUIRepresentation = try ButtonKitUIRepresentation(json)


import Foundation
import UIKit

public typealias ButtonKitUIRepresentation = [ButtonKitUIRepresentationElement]

public extension Array where Element == ButtonKitUIRepresentation.Element {
  static func instanciate() -> ButtonKitUIRepresentation? {
    return try? ButtonKitUIRepresentation(ButtonKitUIRepresentationJSONFile)
  }
}
  

public struct ButtonKitUIRepresentationElement: Codable {
  public let style: StyleElement
  public let layout: LayoutElement
  public let sizes: [Size]
  public let controlStates: [Configuration]
}

public enum StyleElement: String, Codable {
  case brand = "brand"
  case basic = "basic"
  case plain = "plain"
  case outline = "outline"
  case link = "link"
}

public enum LayoutElement: String, Codable {
  case light = "light"
  case dark = "dark"
}


public struct Configuration: Codable {
  public let mode: ConfigurationMode
  public let backgroundColor: String
  public let font: FontStyle
  public let fontColor: String
  public let border: Border?
  public let shadow: Shadow?
  public let image: String?
}

public struct Border: Codable {
  let color: String
  let size: Int
}

public enum FontStyle: String, Codable {
  case bold = "bold"
  case light = "light"
  case roman = "roman"

  func fontFor(size : CGFloat) -> UIFont {
    switch self {
    case .bold: return UIFont.diloBold(size: size)
    case .light: return UIFont.diloLight(size: size)
    case .roman: return UIFont.diloRoman(size: size)
    }
  }
}

public enum ConfigurationMode: String, Codable {
  case selected = "selected"
  case normal = "normal"
  case highlighted = "highlighted"
  case disabled = "disabled"

  public func controlState() -> UIControl.State {
    switch self {
    case .selected: return .selected
    case .normal: return .normal
    case .highlighted: return .highlighted
    case .disabled: return .disabled
    }
  }

  static public func mode(controlState : UIControl.State) -> ConfigurationMode {
    switch controlState {
    case .selected: return .selected
    case .normal: return .normal
    case .highlighted: return .highlighted
    case .disabled: return .disabled
    default:  return .normal
    }
  }
}

public struct Shadow: Codable {
  let masksToBounds: Bool
  let shadowRadius: Float
  let shadowColor: String
  let shadowOffset: ShadowOffset
  let shadowOpacity: Float
}

public struct ShadowOffset: Codable {
  let width, height: Float
}

public struct Size: Codable {
  let font: Float?
  let fontStyle: String?
  let borderRadius: Float
  let contentEdgeInsets: ContentEdgeInsets?
  let expended: ExpendedMode?
  let contentHorizontalAlignment: ConfigurationContentHorizontalAlignment?
  let height: Float
  let imageHeight : Int?
  let imageWidth : Int?
  let width: Int?
  let mode: SizeMode
}


public enum ExpendedMode: String, Codable {
  case full
  case conserveSpacing
}

public enum SizeMode: String, Codable {
  case medium
  case small
  case full
  case extended
  case fab
}

public enum ConfigurationContentHorizontalAlignment: String, Codable {
  case center = "center"
  case right = "right"
  case left = "left"
  case fill = "fill"

  func contentHorizontalAlignment() -> UIControl.ContentHorizontalAlignment {
    switch self {
    case .center: return .center
    case .right: return .right
    case .left: return .left
    case .fill: return .fill
    }
  }
}


public struct ContentEdgeInsets: Codable {
  let top, left, bottom, right: Float

  enum CodingKeys: String, CodingKey {
    case top
    case left
    case bottom
    case right
  }
}

// MARK: Convenience initializers

extension ButtonKitUIRepresentationElement {
  init(data: Data) throws {
    self = try JSONDecoder().decode(ButtonKitUIRepresentationElement.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension Configuration {
  init(data: Data) throws {
    self = try JSONDecoder().decode(Configuration.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension Border {
  init(data: Data) throws {
    self = try JSONDecoder().decode(Border.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension Shadow {
  init(data: Data) throws {
    self = try JSONDecoder().decode(Shadow.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension ShadowOffset {
  init(data: Data) throws {
    self = try JSONDecoder().decode(ShadowOffset.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension Size {
  init(data: Data) throws {
    self = try JSONDecoder().decode(Size.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension ContentEdgeInsets {
  init(data: Data) throws {
    self = try JSONDecoder().decode(ContentEdgeInsets.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension Array where Element == ButtonKitUIRepresentation.Element {
  init(data: Data) throws {
    self = try JSONDecoder().decode(ButtonKitUIRepresentation.self, from: data)
  }

  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }

  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }

  func jsonData() throws -> Data {
    return try JSONEncoder().encode(self)
  }

  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}



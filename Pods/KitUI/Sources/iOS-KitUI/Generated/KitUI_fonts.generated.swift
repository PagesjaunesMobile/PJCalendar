// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen


import UIKit

#if os(OSX)
  import AppKit.NSFont
  public typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  public typealias Font = UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

public struct FontConvertible {
  public let name: String
  public let family: String
  public let path: String

  public func font(size: CGFloat) -> Font {
    return Font(font: self, size: size) ?? UIFont.systemFont(ofSize: size)
  }

  public func register() {
    guard let url = url else { return }
    var errorRef: Unmanaged<CFError>?
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
  }

  fileprivate var url: URL? {
    let r : [String] = path.split(separator: ".").compactMap({ String($0) })
    let bundle = Bundle(for: ButtonKitUI.self)
    guard
      r.count == 2,
      let fontName = r.first,
      let fontExt = r.last
      else { return nil }

    return bundle.url(forResource: fontName, withExtension: fontExt)
  }
}

public extension Font {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable identifier_name line_length type_body_length
public enum PJFont {
  public enum DiLoIOS {
    public static let _45Light = FontConvertible(name: "DiLoiOS-45Light", family: "DiLo iOS", path: "DiLoIOS-45Light.ttf")
    public static let _55Roman = FontConvertible(name: "DiLoiOS-55Roman", family: "DiLo iOS", path: "DiLoIOS-55Roman.ttf")
    public static let _65Bold = FontConvertible(name: "DiLoiOS-65Bold", family: "DiLo iOS", path: "DiLoIOS-65Bold.ttf")
  }
}
// swiftlint:enable identifier_name line_length type_body_length

private final class BundleToken {}


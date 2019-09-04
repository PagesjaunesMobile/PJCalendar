// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  public typealias PJColoriOS11 = NSColor
  public typealias zzz_PJPicto = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  public typealias PJColoriOS11 = UIColor
  public typealias zzz_PJPicto = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "zzz_PJPictoAsset")
public typealias PJAssetForColorType = zzz_PJPictoAsset

public struct zzz_PJPictoAsset {
  public fileprivate(set) var name: String

  public var image: zzz_PJPicto {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = zzz_PJPicto(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = zzz_PJPicto(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

public struct PJColorAssetiOS11 {
  public fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  public var color: PJColoriOS11 {
    return PJColoriOS11(asset: self)
  }
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum PJAssetForColor {
  public static let blue1 = PJColorAssetiOS11(name: "Blue1")
  public static let blue2 = PJColorAssetiOS11(name: "Blue2")
  public static let blue3 = PJColorAssetiOS11(name: "Blue3")
  public static let blue5 = PJColorAssetiOS11(name: "Blue5")
  public static let blue7 = PJColorAssetiOS11(name: "Blue7")
  public static let blue8 = PJColorAssetiOS11(name: "Blue8")
  public static let bluePJ = PJColorAssetiOS11(name: "BluePJ")
  public static let brown1 = PJColorAssetiOS11(name: "Brown1")
  public static let brown2 = PJColorAssetiOS11(name: "Brown2")
  public static let brown3 = PJColorAssetiOS11(name: "Brown3")
  public static let brown4 = PJColorAssetiOS11(name: "Brown4")
  public static let brown5 = PJColorAssetiOS11(name: "Brown5")
  public static let brown6 = PJColorAssetiOS11(name: "Brown6")
  public static let brown7 = PJColorAssetiOS11(name: "Brown7")
  public static let brown8 = PJColorAssetiOS11(name: "Brown8")
  public static let darkBluePJ = PJColorAssetiOS11(name: "DarkBluePJ")
  public static let darkGreenPJ = PJColorAssetiOS11(name: "DarkGreenPJ")
  public static let darkOrangePJ = PJColorAssetiOS11(name: "DarkOrangePJ")
  public static let darkRedPJ = PJColorAssetiOS11(name: "DarkRedPJ")
  public static let darkYellowPJ = PJColorAssetiOS11(name: "DarkYellowPJ")
  public static let green1 = PJColorAssetiOS11(name: "Green1")
  public static let green2 = PJColorAssetiOS11(name: "Green2")
  public static let green3 = PJColorAssetiOS11(name: "Green3")
  public static let green6 = PJColorAssetiOS11(name: "Green6")
  public static let green7 = PJColorAssetiOS11(name: "Green7")
  public static let green8 = PJColorAssetiOS11(name: "Green8")
  public static let greenPJ = PJColorAssetiOS11(name: "GreenPJ")
  public static let grey1 = PJColorAssetiOS11(name: "Grey1")
  public static let grey2 = PJColorAssetiOS11(name: "Grey2")
  public static let grey3 = PJColorAssetiOS11(name: "Grey3")
  public static let grey4 = PJColorAssetiOS11(name: "Grey4")
  public static let grey5 = PJColorAssetiOS11(name: "Grey5")
  public static let grey6 = PJColorAssetiOS11(name: "Grey6")
  public static let orange1 = PJColorAssetiOS11(name: "Orange1")
  public static let orange2 = PJColorAssetiOS11(name: "Orange2")
  public static let orange3 = PJColorAssetiOS11(name: "Orange3")
  public static let orange5 = PJColorAssetiOS11(name: "Orange5")
  public static let orange7 = PJColorAssetiOS11(name: "Orange7")
  public static let orange8 = PJColorAssetiOS11(name: "Orange8")
  public static let orangePJ = PJColorAssetiOS11(name: "OrangePJ")
  public static let pink1 = PJColorAssetiOS11(name: "Pink1")
  public static let pink2 = PJColorAssetiOS11(name: "Pink2")
  public static let pink3 = PJColorAssetiOS11(name: "Pink3")
  public static let pink4 = PJColorAssetiOS11(name: "Pink4")
  public static let pink5 = PJColorAssetiOS11(name: "Pink5")
  public static let pink6 = PJColorAssetiOS11(name: "Pink6")
  public static let pink7 = PJColorAssetiOS11(name: "Pink7")
  public static let pink8 = PJColorAssetiOS11(name: "Pink8")
  public static let purple1 = PJColorAssetiOS11(name: "Purple1")
  public static let purple2 = PJColorAssetiOS11(name: "Purple2")
  public static let purple3 = PJColorAssetiOS11(name: "Purple3")
  public static let purple4 = PJColorAssetiOS11(name: "Purple4")
  public static let purple5 = PJColorAssetiOS11(name: "Purple5")
  public static let purple6 = PJColorAssetiOS11(name: "Purple6")
  public static let purple7 = PJColorAssetiOS11(name: "Purple7")
  public static let purple8 = PJColorAssetiOS11(name: "Purple8")
  public static let red1 = PJColorAssetiOS11(name: "Red1")
  public static let red2 = PJColorAssetiOS11(name: "Red2")
  public static let red3 = PJColorAssetiOS11(name: "Red3")
  public static let red5 = PJColorAssetiOS11(name: "Red5")
  public static let red7 = PJColorAssetiOS11(name: "Red7")
  public static let red8 = PJColorAssetiOS11(name: "Red8")
  public static let redPJ = PJColorAssetiOS11(name: "RedPJ")
  public static let yellow1 = PJColorAssetiOS11(name: "Yellow1")
  public static let yellow2 = PJColorAssetiOS11(name: "Yellow2")
  public static let yellow5 = PJColorAssetiOS11(name: "Yellow5")
  public static let yellow7 = PJColorAssetiOS11(name: "Yellow7")
  public static let yellow8 = PJColorAssetiOS11(name: "Yellow8")
  public static let yellowPJ = PJColorAssetiOS11(name: "YellowPJ")

  // swiftlint:disable trailing_comma
  public static let allColors: [PJColorAssetiOS11] = [
    blue1,
    blue2,
    blue3,
    blue5,
    blue7,
    blue8,
    bluePJ,
    brown1,
    brown2,
    brown3,
    brown4,
    brown5,
    brown6,
    brown7,
    brown8,
    darkBluePJ,
    darkGreenPJ,
    darkOrangePJ,
    darkRedPJ,
    darkYellowPJ,
    green1,
    green2,
    green3,
    green6,
    green7,
    green8,
    greenPJ,
    grey1,
    grey2,
    grey3,
    grey4,
    grey5,
    grey6,
    orange1,
    orange2,
    orange3,
    orange5,
    orange7,
    orange8,
    orangePJ,
    pink1,
    pink2,
    pink3,
    pink4,
    pink5,
    pink6,
    pink7,
    pink8,
    purple1,
    purple2,
    purple3,
    purple4,
    purple5,
    purple6,
    purple7,
    purple8,
    red1,
    red2,
    red3,
    red5,
    red7,
    red8,
    redPJ,
    yellow1,
    yellow2,
    yellow5,
    yellow7,
    yellow8,
    yellowPJ,
  ]
  public static let allImages: [zzz_PJPictoAsset] = [
  ]
  // swiftlint:enable trailing_comma
  @available(*, deprecated, renamed: "allImages")
  public static let allValues: [PJAssetForColorType] = allImages
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

public extension zzz_PJPicto {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the zzz_PJPictoAsset.image property")
  convenience init!(asset: zzz_PJPictoAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

public extension PJColoriOS11 {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: PJColorAssetiOS11) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}

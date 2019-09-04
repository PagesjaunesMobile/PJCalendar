// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  public typealias PJColorAssetiOS10 = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  public typealias PJColorAssetiOS10 = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable operator_usage_whitespace
public extension PJColorAssetiOS10 {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

// swiftlint:disable identifier_name line_length type_body_length
public struct PJColoriOS10 {
  public let rgbaValue: UInt32
  public var color: PJColorAssetiOS10 { return PJColorAssetiOS10(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#c4e6ff"></span>
  /// Alpha: 100% <br/> (0xc4e6ffff)
  public static let blue1 = PJColoriOS10(rgbaValue: 0xc4e6ffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#97c8ff"></span>
  /// Alpha: 100% <br/> (0x97c8ffff)
  public static let blue2 = PJColoriOS10(rgbaValue: 0x97c8ffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4a9fff"></span>
  /// Alpha: 100% <br/> (0x4a9fffff)
  public static let blue3 = PJColoriOS10(rgbaValue: 0x4a9fffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#006ae1"></span>
  /// Alpha: 100% <br/> (0x006ae1ff)
  public static let blue5 = PJColoriOS10(rgbaValue: 0x006ae1ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#0052af"></span>
  /// Alpha: 100% <br/> (0x0052afff)
  public static let blue7 = PJColoriOS10(rgbaValue: 0x0052afff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#00428d"></span>
  /// Alpha: 100% <br/> (0x00428dff)
  public static let blue8 = PJColoriOS10(rgbaValue: 0x00428dff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#0078ff"></span>
  /// Alpha: 100% <br/> (0x0078ffff)
  public static let bluePJ = PJColoriOS10(rgbaValue: 0x0078ffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eed2c1"></span>
  /// Alpha: 100% <br/> (0xeed2c1ff)
  public static let brown1 = PJColoriOS10(rgbaValue: 0xeed2c1ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e0b296"></span>
  /// Alpha: 100% <br/> (0xe0b296ff)
  public static let brown2 = PJColoriOS10(rgbaValue: 0xe0b296ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#cf9775"></span>
  /// Alpha: 100% <br/> (0xcf9775ff)
  public static let brown3 = PJColoriOS10(rgbaValue: 0xcf9775ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bc7c55"></span>
  /// Alpha: 100% <br/> (0xbc7c55ff)
  public static let brown4 = PJColoriOS10(rgbaValue: 0xbc7c55ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a25d34"></span>
  /// Alpha: 100% <br/> (0xa25d34ff)
  public static let brown5 = PJColoriOS10(rgbaValue: 0xa25d34ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#8d4013"></span>
  /// Alpha: 100% <br/> (0x8d4013ff)
  public static let brown6 = PJColoriOS10(rgbaValue: 0x8d4013ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#773610"></span>
  /// Alpha: 100% <br/> (0x773610ff)
  public static let brown7 = PJColoriOS10(rgbaValue: 0x773610ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#612e10"></span>
  /// Alpha: 100% <br/> (0x612e10ff)
  public static let brown8 = PJColoriOS10(rgbaValue: 0x612e10ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#0060cd"></span>
  /// Alpha: 100% <br/> (0x0060cdff)
  public static let darkBluePJ = PJColoriOS10(rgbaValue: 0x0060cdff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3c907b"></span>
  /// Alpha: 100% <br/> (0x3c907bff)
  public static let darkGreenPJ = PJColoriOS10(rgbaValue: 0x3c907bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f9642c"></span>
  /// Alpha: 100% <br/> (0xf9642cff)
  public static let darkOrangePJ = PJColoriOS10(rgbaValue: 0xf9642cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d21919"></span>
  /// Alpha: 100% <br/> (0xd21919ff)
  public static let darkRedPJ = PJColoriOS10(rgbaValue: 0xd21919ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffc700"></span>
  /// Alpha: 100% <br/> (0xffc700ff)
  public static let darkYellowPJ = PJColoriOS10(rgbaValue: 0xffc700ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b6fdec"></span>
  /// Alpha: 100% <br/> (0xb6fdecff)
  public static let green1 = PJColoriOS10(rgbaValue: 0xb6fdecff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#9bedd9"></span>
  /// Alpha: 100% <br/> (0x9bedd9ff)
  public static let green2 = PJColoriOS10(rgbaValue: 0x9bedd9ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#79dcc4"></span>
  /// Alpha: 100% <br/> (0x79dcc4ff)
  public static let green3 = PJColoriOS10(rgbaValue: 0x79dcc4ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#26a385"></span>
  /// Alpha: 100% <br/> (0x26a385ff)
  public static let green6 = PJColoriOS10(rgbaValue: 0x26a385ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#25866f"></span>
  /// Alpha: 100% <br/> (0x25866fff)
  public static let green7 = PJColoriOS10(rgbaValue: 0x25866fff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#176854"></span>
  /// Alpha: 100% <br/> (0x176854ff)
  public static let green8 = PJColoriOS10(rgbaValue: 0x176854ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#5ac8ad"></span>
  /// Alpha: 100% <br/> (0x5ac8adff)
  public static let greenPJ = PJColoriOS10(rgbaValue: 0x5ac8adff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f3f3f3"></span>
  /// Alpha: 100% <br/> (0xf3f3f3ff)
  public static let grey1 = PJColoriOS10(rgbaValue: 0xf3f3f3ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e6e6e6"></span>
  /// Alpha: 100% <br/> (0xe6e6e6ff)
  public static let grey2 = PJColoriOS10(rgbaValue: 0xe6e6e6ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#cccccc"></span>
  /// Alpha: 100% <br/> (0xccccccff)
  public static let grey3 = PJColoriOS10(rgbaValue: 0xccccccff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#999999"></span>
  /// Alpha: 100% <br/> (0x999999ff)
  public static let grey4 = PJColoriOS10(rgbaValue: 0x999999ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#666666"></span>
  /// Alpha: 100% <br/> (0x666666ff)
  public static let grey5 = PJColoriOS10(rgbaValue: 0x666666ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#333333"></span>
  /// Alpha: 100% <br/> (0x333333ff)
  public static let grey6 = PJColoriOS10(rgbaValue: 0x333333ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000000"></span>
  /// Alpha: 100% <br/> (0x000000ff)
  public static let noir = PJColoriOS10(rgbaValue: 0x000000ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fbcdbb"></span>
  /// Alpha: 100% <br/> (0xfbcdbbff)
  public static let orange1 = PJColoriOS10(rgbaValue: 0xfbcdbbff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffb89d"></span>
  /// Alpha: 100% <br/> (0xffb89dff)
  public static let orange2 = PJColoriOS10(rgbaValue: 0xffb89dff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fca685"></span>
  /// Alpha: 100% <br/> (0xfca685ff)
  public static let orange3 = PJColoriOS10(rgbaValue: 0xfca685ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff7440"></span>
  /// Alpha: 100% <br/> (0xff7440ff)
  public static let orange5 = PJColoriOS10(rgbaValue: 0xff7440ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e44a11"></span>
  /// Alpha: 100% <br/> (0xe44a11ff)
  public static let orange7 = PJColoriOS10(rgbaValue: 0xe44a11ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#c13500"></span>
  /// Alpha: 100% <br/> (0xc13500ff)
  public static let orange8 = PJColoriOS10(rgbaValue: 0xc13500ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff8c60"></span>
  /// Alpha: 100% <br/> (0xff8c60ff)
  public static let orangePJ = PJColoriOS10(rgbaValue: 0xff8c60ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffd7ee"></span>
  /// Alpha: 100% <br/> (0xffd7eeff)
  public static let pink1 = PJColoriOS10(rgbaValue: 0xffd7eeff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffc4e6"></span>
  /// Alpha: 100% <br/> (0xffc4e6ff)
  public static let pink2 = PJColoriOS10(rgbaValue: 0xffc4e6ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffa2d8"></span>
  /// Alpha: 100% <br/> (0xffa2d8ff)
  public static let pink3 = PJColoriOS10(rgbaValue: 0xffa2d8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff7bc8"></span>
  /// Alpha: 100% <br/> (0xff7bc8ff)
  public static let pink4 = PJColoriOS10(rgbaValue: 0xff7bc8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e364ae"></span>
  /// Alpha: 100% <br/> (0xe364aeff)
  public static let pink5 = PJColoriOS10(rgbaValue: 0xe364aeff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#c94d96"></span>
  /// Alpha: 100% <br/> (0xc94d96ff)
  public static let pink6 = PJColoriOS10(rgbaValue: 0xc94d96ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a9377a"></span>
  /// Alpha: 100% <br/> (0xa9377aff)
  public static let pink7 = PJColoriOS10(rgbaValue: 0xa9377aff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#84215b"></span>
  /// Alpha: 100% <br/> (0x84215bff)
  public static let pink8 = PJColoriOS10(rgbaValue: 0x84215bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bfb6ff"></span>
  /// Alpha: 100% <br/> (0xbfb6ffff)
  public static let purple1 = PJColoriOS10(rgbaValue: 0xbfb6ffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#9f95ea"></span>
  /// Alpha: 100% <br/> (0x9f95eaff)
  public static let purple2 = PJColoriOS10(rgbaValue: 0x9f95eaff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#8579dc"></span>
  /// Alpha: 100% <br/> (0x8579dcff)
  public static let purple3 = PJColoriOS10(rgbaValue: 0x8579dcff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#776cc8"></span>
  /// Alpha: 100% <br/> (0x776cc8ff)
  public static let purple4 = PJColoriOS10(rgbaValue: 0x776cc8ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#665ab9"></span>
  /// Alpha: 100% <br/> (0x665ab9ff)
  public static let purple5 = PJColoriOS10(rgbaValue: 0x665ab9ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#574e97"></span>
  /// Alpha: 100% <br/> (0x574e97ff)
  public static let purple6 = PJColoriOS10(rgbaValue: 0x574e97ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4e4685"></span>
  /// Alpha: 100% <br/> (0x4e4685ff)
  public static let purple7 = PJColoriOS10(rgbaValue: 0x4e4685ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#38316d"></span>
  /// Alpha: 100% <br/> (0x38316dff)
  public static let purple8 = PJColoriOS10(rgbaValue: 0x38316dff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fcb2b2"></span>
  /// Alpha: 100% <br/> (0xfcb2b2ff)
  public static let red1 = PJColoriOS10(rgbaValue: 0xfcb2b2ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f49494"></span>
  /// Alpha: 100% <br/> (0xf49494ff)
  public static let red2 = PJColoriOS10(rgbaValue: 0xf49494ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f08080"></span>
  /// Alpha: 100% <br/> (0xf08080ff)
  public static let red3 = PJColoriOS10(rgbaValue: 0xf08080ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e53a3a"></span>
  /// Alpha: 100% <br/> (0xe53a3aff)
  public static let red5 = PJColoriOS10(rgbaValue: 0xe53a3aff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b50808"></span>
  /// Alpha: 100% <br/> (0xb50808ff)
  public static let red7 = PJColoriOS10(rgbaValue: 0xb50808ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b50808"></span>
  /// Alpha: 100% <br/> (0xb50808ff)
  public static let red8 = PJColoriOS10(rgbaValue: 0xb50808ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ea5959"></span>
  /// Alpha: 100% <br/> (0xea5959ff)
  public static let redPJ = PJColoriOS10(rgbaValue: 0xea5959ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fdfad1"></span>
  /// Alpha: 100% <br/> (0xfdfad1ff)
  public static let yellow1 = PJColoriOS10(rgbaValue: 0xfdfad1ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fffab4"></span>
  /// Alpha: 100% <br/> (0xfffab4ff)
  public static let yellow2 = PJColoriOS10(rgbaValue: 0xfffab4ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fff56a"></span>
  /// Alpha: 100% <br/> (0xfff56aff)
  public static let yellow3 = PJColoriOS10(rgbaValue: 0xfff56aff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffd200"></span>
  /// Alpha: 100% <br/> (0xffd200ff)
  public static let yellow5 = PJColoriOS10(rgbaValue: 0xffd200ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffb176"></span>
  /// Alpha: 100% <br/> (0xffb176ff)
  public static let yellow7 = PJColoriOS10(rgbaValue: 0xffb176ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffa012"></span>
  /// Alpha: 100% <br/> (0xffa012ff)
  public static let yellow8 = PJColoriOS10(rgbaValue: 0xffa012ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffec00"></span>
  /// Alpha: 100% <br/> (0xffec00ff)
  public static let yellowPJ = PJColoriOS10(rgbaValue: 0xffec00ff)
}
// swiftlint:enable identifier_name line_length type_body_length

public extension PJColorAssetiOS10 {
  convenience init(named color: PJColoriOS10) {
    self.init(rgbaValue: color.rgbaValue)
  }
}

//
//  ButtonKitUI.swift
//  KitUI
//
//  Created by Jeffrey Macko on 05/03/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import UIKit

extension ButtonKitUI {
  static let buttonKitUIRepresentationDefaultConfiguration = ButtonKitUIRepresentation.instanciate()
}

@IBDesignable public class ButtonKitUI: UIButton {

  public var payload : Any? = nil
  var borderForControlState : [ConfigurationMode : Border] = [:]
  var observers : [NSKeyValueObservation] = []

  public var model: ButtonTypeKitUI? {
    get { return ButtonTypeKitUI(rawValue: typeKitUI)  }
  }

  public var layout: ButtonLayoutKitUI? {
    get { return ButtonLayoutKitUI(rawValue: layoutKitUI)  }
  }

  public var sizeValue: ButtonSizeKitUI? {
    get { return ButtonSizeKitUI(rawValue: sizeKitUI)  }
  }


  /// MARK - Variables
  lazy var pjPictoImageView: UIImageView = {
    let v = UIImageView()
    return v
  }()

  /// MARK - IBInspectable
  @IBInspectable open var typeKitUI: Int = 0 {
    didSet {
      updateUI()
    }
  }

  @IBInspectable open var layoutKitUI: Int = 0 {
    didSet {
      updateUI()
    }
  }

  @IBInspectable open var sizeKitUI: Int = 0 {
    didSet {
      updateUI()
    }
  }

  @IBInspectable open var pictoKitUI: UIImage = UIImage() {
    didSet {
      updateUI()
    }
  }

  @IBInspectable open var expendedSpacingValue: Int = 16 {
    didSet {
      updateUI()
    }
  }

  @IBInspectable open var pjAccessibilityIdentifier: String = "" {
    didSet {
      updateUI()
    }
  }

  /// MARK - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    updateUI()
  }

  public init?(type : ButtonTypeKitUI, layout : ButtonLayoutKitUI, size: ButtonSizeKitUI) {
    if ButtonKitUI.isSupported(type: type, layout: layout, size: size) {
      typeKitUI = type.rawValue
      layoutKitUI = layout.rawValue
      sizeKitUI = size.rawValue
      super.init(frame: CGRect.zero)
      setup()
      updateUI()

    } else {
      return nil
    }
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    updateUI()
  }

  override public func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    updateUI()
  }

  override public func awakeFromNib() {
    super.awakeFromNib()
    setup()
    updateUI()
  }

  deinit {
    observers.removeAll()
  }

  override public func setTitle(_ title: String?, for state: UIControl.State) {
    super.setTitle(title, for: state)
    updateUI()
  }

  func setup() {
    self.clipsToBounds = true
    // self.layer.masksToBounds = false

    let obs = self.observe(\.state) { [weak self] (button, val) in
      self?.layer.borderColor = nil
      self?.layer.borderWidth = 0.0

      let mode = ConfigurationMode.mode(controlState: button.state)
      if let borderConfiguration = self?.borderForControlState[mode] {
        self?.updateBorder(borderConfiguration)
      }
    }
    observers.append(obs)
  }

  /// MARK - Features
  func updateBorder(_ borderInfo : Border) {
    let borderColor = UIColor(borderInfo.color)
    self.layer.borderColor = borderColor.cgColor
    self.layer.borderWidth = CGFloat(borderInfo.size)
  }

  private func checkImageSize(_ image: UIImage, size: ButtonSizeKitUI) -> Bool {

    let resolution = (image.scale > 1) ?
      image.size : CGSize(width: image.size.width / UIScreen.main.scale,
                          height: image.size.height / UIScreen.main.scale)
    return resolution == size.imageSize
  }

  public func properlySetImage(img : UIImage, size : ButtonSizeKitUI? = nil) {
    let localSize = (size == nil) ? self.sizeValue ?? .medium : size
    if img.size.width > 0 && img.size.height > 0 {
      self.setImage(img, for: .normal)
      self.imageView?.contentMode = .center
      self.imageView?.clipsToBounds = false
      imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)

      guard let localSize = localSize else {
        #if DEBUG
          fatalError("localSize shouldn't be nil")
        #else
          return
        #endif
      }

      guard self.checkImageSize(img, size: localSize) else {
        #if DEBUG
          fatalError("image size should be \(Int(localSize.imageSize.width))x\(Int(localSize.imageSize.height)) in \(localSize.description) size mode")
        #else
          return
        #endif
      }
    }
  }

  
  var applyButtonInfoConstraint : [NSLayoutConstraint] = []
  public func applyButtonInfo(btnType: ButtonTypeKitUI, layoutType : ButtonLayoutKitUI, sizeType : ButtonSizeKitUI) {
    NSLayoutConstraint.deactivate(applyButtonInfoConstraint)
    applyButtonInfoConstraint.removeAll()

    if ButtonKitUI.isSupported(type: btnType, layout: layoutType, size: sizeType) == false {
      print("Mode incconue")
      return
    }

    let conf = ButtonKitUI.buttonKitUIRepresentationDefaultConfiguration
    let selectedConfiguration = conf?.first(where: { (elem) -> Bool in
      let style = ButtonTypeKitUI.value(element: elem.style)
      let layout = ButtonLayoutKitUI.value(element: elem.layout)
      if style == btnType, layout == layoutType { return true }
      return false
    })
    guard let sizeObject = selectedConfiguration?.sizes.first(where: { (aSize) -> Bool in
      let sizeMode = ButtonSizeKitUI.value(element: aSize.mode)
      return sizeMode == sizeType
    }) else { return }

    self.backgroundColor = .clear

    if let validConf = selectedConfiguration {
      for controlStateConf in validConf.controlStates {
        let controlState = controlStateConf.mode.controlState()

        let backgroundColor = controlStateConf.backgroundColor == "clear" ? UIColor.clear : UIColor(controlStateConf.backgroundColor)
        self.setBackgroundImage(UIImage(color: backgroundColor), for: controlState)

        let titleColor = UIColor(controlStateConf.fontColor)
        self.setTitleColor(titleColor, for: controlState)

        if let shadowOfTheCollosus = controlStateConf.shadow {
          self.layer.masksToBounds = false
          self.layer.shadowRadius = CGFloat(shadowOfTheCollosus.shadowRadius)
          let shadowColor = UIColor(shadowOfTheCollosus.shadowColor)
          self.layer.shadowColor = shadowColor.cgColor
          self.layer.shadowOffset = CGSize(width: CGFloat(shadowOfTheCollosus.shadowOffset.width), height: CGFloat(shadowOfTheCollosus.shadowOffset.height))
          self.layer.shadowOpacity = shadowOfTheCollosus.shadowOpacity
        }

        borderForControlState[controlStateConf.mode] = controlStateConf.border

        if controlStateConf.mode == .normal,
          let border = borderForControlState[.normal] {
          updateBorder(border)
          properlySetImage(img: pictoKitUI, size: ButtonSizeKitUI.value(element: sizeObject.mode))
        }

        if let fontSize = sizeObject.font {
          let finalFont = controlStateConf.font.fontFor(size: CGFloat(fontSize))
          self.titleLabel?.font = finalFont
        }

        applyButtonInfoConstraint.append(heightAnchor.constraint(equalToConstant: CGFloat(sizeObject.height)))
        
        if let expended = sizeObject.expended /* , self.superview?.frame.width != 0, self.superview != nil */ {
          var spacing : CGFloat = 0.0
          switch expended {
          case .full: spacing = 0.0
          case .conserveSpacing: spacing = CGFloat(expendedSpacingValue)
          }

          applyButtonInfoConstraint.append(NSLayoutConstraint(item: self,
                                                              attribute: .width,
                                                              relatedBy: .equal,
                                                              toItem: self.superview,
                                                              attribute: .width,
                                                              multiplier: 1.0,
                                                              constant: -spacing))
        }

        if .fab == ButtonSizeKitUI.value(element: sizeObject.mode) , self.superview?.frame.width != 0, self.superview != nil  {
          if let w = sizeObject.width {
            self.layer.cornerRadius = CGFloat(w / 2)
          }
        } else {
          self.layer.cornerRadius = CGFloat(sizeObject.borderRadius)
        }
        if let contentEdgeInset = sizeObject.contentEdgeInsets {
          let edgeInset = UIEdgeInsets(top: CGFloat(contentEdgeInset.top),
                                       left: CGFloat(contentEdgeInset.left),
                                       bottom: CGFloat(contentEdgeInset.bottom),
                                       right: CGFloat(contentEdgeInset.right))
          self.contentEdgeInsets = edgeInset
        }
        if let contentHorizontalAlignment = sizeObject.contentHorizontalAlignment?.contentHorizontalAlignment() {
          self.contentHorizontalAlignment = contentHorizontalAlignment
        }
        NSLayoutConstraint.activate(applyButtonInfoConstraint)
      }
    }
  }

  static public func isSupported(type : ButtonTypeKitUI, layout : ButtonLayoutKitUI, size: ButtonSizeKitUI) -> Bool {
    switch (type, layout, size) {
    case (.brand, .light, _),
         (.plain, .light, _),
         (.basic, .light, .medium),
         (.basic, .light, .small),
         (.link, .dark, .medium),
         (.link, .dark, .small),
         (.link, .light, .medium),
         (.link, .light, .small),
         (.outline, .dark, .extended),
         (.outline, .dark, .medium),
         (.outline, .dark, .small),
         (.outline, .light, .extended),
         (.outline, .light, .medium),
         (.outline, .light, .small):
      return true
    default:
      return false
    }
  }

  override public var description: String {
    get {
      guard
        let btnType = ButtonTypeKitUI(rawValue: typeKitUI),
        let layoutType = ButtonLayoutKitUI(rawValue: layoutKitUI),
        let sizeType = ButtonSizeKitUI(rawValue: sizeKitUI)
        else {
          return "Configuration incorrect (\(typeKitUI)-\(layoutKitUI)-\(sizeKitUI)"
      }

      return "\(btnType.description.capitalized).\(layoutType.description.capitalized).\(sizeType.description.capitalized)"
    }
  }
  
  public override var debugDescription: String {
    get {
      guard
        let btnType = ButtonTypeKitUI(rawValue: typeKitUI),
        let layoutType = ButtonLayoutKitUI(rawValue: layoutKitUI),
        let sizeType = ButtonSizeKitUI(rawValue: sizeKitUI)
        else {
          return "Configuration incorrect (\(typeKitUI)-\(layoutKitUI)-\(sizeKitUI)"
      }
      
      return "\(btnType.description.capitalized) \(layoutType.description.capitalized) \(sizeType.description.capitalized) - (\(btnType.rawValue), \(layoutType.rawValue), \(sizeType.rawValue))"
    }
  }


  public func updateUI() {
    guard
      let btnType = ButtonTypeKitUI(rawValue: typeKitUI),
      let layoutType = ButtonLayoutKitUI(rawValue: layoutKitUI),
      let sizeType = ButtonSizeKitUI(rawValue: sizeKitUI)
      else {
        print("Mode incconue")
        return
    }

    applyButtonInfo(btnType: btnType, layoutType: layoutType, sizeType: sizeType)
  }

  /// MARK - Types
  public enum ButtonTypeKitUI : Int, CustomStringConvertible, RawRepresentable, CaseIterable, Hashable {
    case brand = 0
    case basic = 1
    case plain = 2
    case outline = 3
    case link = 4

    static public func value(element : StyleElement) -> ButtonTypeKitUI {
      switch element {
      case .basic: return .basic
      case .brand: return .brand
      case .link: return .link
      case .outline: return .outline
      case .plain: return .plain
      }
    }

    public var description: String {
      get {
        switch self {
        case .brand: return "brand"
        case .basic: return "basic"
        case .plain: return "plain"
        case .outline: return "outline"
        case .link: return "link"
        }
      }
    }
  }

  public enum ButtonLayoutKitUI : Int, CustomStringConvertible, RawRepresentable, CaseIterable, Hashable {
    case light = 0
    case dark = 1

    public var description: String {
      get {
        switch self {
        case .dark: return "dark"
        case .light: return "light"
        }
      }
    }

    static public func value(element : LayoutElement) -> ButtonLayoutKitUI {
      switch element {
      case .light: return .light
      case .dark: return .dark
      }
    }
  }

  public enum ButtonSizeKitUI : Int, CustomStringConvertible, RawRepresentable, CaseIterable, Hashable {
    case medium = 0
    case small = 1
    case extended = 2
    case full = 3
    case fab = 4

    public var description: String {
      get {
        switch self {
        case .extended: return "extended"
        case .small: return "small"
        case .full: return "full"
        case .fab: return "fab"
        case .medium: return "medium"
        }
      }
    }


    static public func value(element : SizeMode) -> ButtonSizeKitUI {
      switch element {
      case .medium: return .medium
      case .extended: return .extended
      case .small: return .small
      case .full: return .full
      case .fab: return .fab
      }
    }

    var imageSize: CGSize {
      switch self {
      case .small:
       return CGSize(width: 16, height: 16)
      default:
        return CGSize(width: 24, height: 24)
      }
    }

  }
}



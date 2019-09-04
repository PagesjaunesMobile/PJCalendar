/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */


import UIKit

@IBDesignable public final class LoadingViewContainer: UIView {

  //MARK: Constants

  static private let defaultScale: CGFloat = 0.75
  static private let defaultLoadingViewSize: CGFloat = 200
  static private let defaultLoadingColor : UIColor = .darkGray
  static private let defaultBackgroundContainterColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)

  //MARK: IBInspectable variables

  @IBInspectable public var scale: CGFloat = defaultScale {
    didSet {
      self.updateProperties()
    }
  }

  @IBInspectable public var logoColor: UIColor? = defaultLoadingColor {
    didSet {
      self.updateProperties()
    }
  }

  @IBInspectable public var backgroundContainterColor: UIColor? = defaultBackgroundContainterColor {
    didSet {
      self.updateProperties()
    }
  }

  //MARK: Properties

  private let loadingView = LoadingView(frame: CGRect.zero, logoColor: defaultLoadingColor)

  // MARK: Initialisations

  override public init(frame: CGRect) {
    super.init(frame: frame) // calls designated initializer
    setup()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
  }

  // MARK: Setup / Update

  private func setupView() {
    if loadingView.superview == nil {
      self.addSubview(loadingView)
    }
  }

  private func setupLayout() {
    self.loadingView.translatesAutoresizingMaskIntoConstraints = false

    var constraints = [NSLayoutConstraint]()

    constraints.append(self.loadingView.topAnchor.constraint(equalTo: self.topAnchor))
    constraints.append(self.loadingView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
    constraints.append(self.loadingView.rightAnchor.constraint(equalTo: self.rightAnchor))
    constraints.append(self.loadingView.leftAnchor.constraint(equalTo: self.leftAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  private func updateProperties() {

    if let logoColor = logoColor {
      loadingView.logoColor = logoColor
    }

    // Update the background Color
    if let backgroundContainterColor = backgroundContainterColor {
      self.backgroundColor = backgroundContainterColor
    }

    self.loadingView.transform = CGAffineTransform(scaleX: self.scale, y: self.scale)
  }

  private func setup() {
    self.setupView()
    self.setupLayout()
    self.updateProperties()
  }
}


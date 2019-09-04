//
//  UIButton+KitUI.swift
//  KitUI
//
//  Created by Jeffrey Macko on 25/05/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import UIKit
import CoreGraphics

extension UIButton {


  @objc(resize:colorsForStates:size:)
  public func zzz_resize(imageNamed: String, colorsForStates __beforeTransformation : [UInt:UIColor], size : CGSize) {
    var colorsForStates : [UIControl.State.RawValue:UIColor] = [:]
    for l in __beforeTransformation {
      colorsForStates[l.key] = l.value
    }
    self.resize(imageNamed: imageNamed, size : size, colorsForStates: colorsForStates)
  }

  public func resize(imageNamed: String, size assetSize : CGSize, colorsForStates : [UInt:UIColor] = [UIControl.State.normal.rawValue : PJColor(.bluePJ)]) {
    guard let image = UIImage(named: imageNamed)?.withRenderingMode(.alwaysTemplate) else {
      print("Image [\(imageNamed)] non trouvée ou non vectoriel c'est a dire single scale + preserve vector data + rendering template pour que cela fonctionne")
      return
    }
    self.resize(image, size: assetSize, colorsForStates : colorsForStates)
  }

  public func resize(_ image: UIImage, size assetSize : CGSize, colorsForStates : [UInt:UIColor] = [UIControl.State.normal.rawValue : PJColor(.bluePJ)]) {

    if image.renderingMode != .alwaysTemplate {
      print("🤪🤪🤪🤪🤪\nL'image doit etre vectoriel c'est a dire single scale + preserve vector data + rendering template pour que cela fonctionne.\n🤩🤩🤩🤩🤩")
    }

    let renderedImage = image.render(size: assetSize)

    for colorForState in colorsForStates {
      let state = UIControl.State(rawValue: colorForState.key)
      self.setImage(renderedImage, for: state)
      if (state == .normal) {
        self.tintColor = colorForState.value
      }
    }

    _ = self.observe(\.state) { (button, kvo) in
      if let controlState = kvo.newValue,
        let color = colorsForStates[controlState.rawValue] {
        button.tintColor = color
      }
    }

    self.contentMode = .scaleAspectFit
  }
}


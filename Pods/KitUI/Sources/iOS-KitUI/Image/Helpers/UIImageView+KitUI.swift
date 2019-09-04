//
//  UIImageView+KitUI.swift
//  KitUI
//
//  Created by Jeffrey Macko on 25/05/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import UIKit

extension UIImageView {

  @objc(resizeImageNamed:size:color:useHighligtedImage:)
  public func resize(imageNamed: String, size assetSize : CGSize, color : UIColor = PJColor(.bluePJ), useHighligtedImage : Bool = false) {
    guard let image = UIImage(named: imageNamed)?.withRenderingMode(.alwaysTemplate) else {
      print("Image [\(imageNamed)] non trouvée ou non vectoriel c'est a dire single scale + preserve vector data + rendering template pour que cela fonctionne")
      return
    }
    self.resize(image, size : assetSize, color: color, useHighligtedImage: useHighligtedImage)
  }

  @objc(resize:size:color:useHighligtedImage:)
  public func resize(_ image: UIImage, size assetSize : CGSize, color : UIColor = PJColor(.bluePJ), useHighligtedImage : Bool = false) {

    if image.renderingMode != .alwaysTemplate {
      print("🤪🤪🤪🤪🤪\nL'image doit etre vectoriel c'est a dire single scale + preserve vector data + rendering template pour que cela fonctionne.\n🤩🤩🤩🤩🤩")
    }

    let renderedImage = image.render(size: assetSize, color: color)

    if useHighligtedImage {
      self.highlightedImage = renderedImage
    } else {
      self.image = renderedImage
    }

    self.contentMode = .scaleAspectFit
    self.tintColor = color
  }
}



//
//  UIBarButtonItem+KitUI.swift
//  KitUI
//
//  Created by Jeffrey Macko on 25/05/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import UIKit

extension UIBarButtonItem {

  @objc public func resize(imageNamed: String, color : UIColor = PJColor(.bluePJ)) {
    guard let image = UIImage(named: imageNamed)?.withRenderingMode(.alwaysTemplate) else {
      print("Image [\(imageNamed)] non trouvée ou non vectoriel c'est a dire single scale + preserve vector data + rendering template pour que cela fonctionne")
      return
    }
    self.resize(image, color: color)
  }


  @objc public func resize(_ image: UIImage, color : UIColor = PJColor(.bluePJ)) {

    if image.renderingMode != .alwaysTemplate {
      print("🤪🤪🤪🤪🤪\nL'image doit etre vectoriel c'est a dire single scale + preserve vector data + rendering template pour que cela fonctionne.\n🤩🤩🤩🤩🤩")
    }

    let renderedImage = image.render(size: .barButtonItem)

    self.image = renderedImage
    self.tintColor = color
  }
}


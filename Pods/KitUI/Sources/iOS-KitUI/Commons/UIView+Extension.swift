//
//  UIView+Extension.swift
//  KitUI
//
//  Created by Jeffrey Macko on 20/04/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import Foundation
import UIKit

extension UIView {

  /// Generate an Image from a UIView
  @objc public func asImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image { rendererContext in
      layer.render(in: rendererContext.cgContext)
    }
  }
}


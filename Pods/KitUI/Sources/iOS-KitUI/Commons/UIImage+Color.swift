//
//  UIImage+Color.swift
//  KitUI
//
//  Created by Jeffrey Macko on 05/03/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import Foundation
import UIKit

extension UIImage {
  @objc public convenience init(color inputColor : UIColor? = .clear, size : CGSize = CGSize(width: 1, height: 1)) {
    let v = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    v.backgroundColor = inputColor
    self.init(cgImage: v.asImage().cgImage!)
  }
}


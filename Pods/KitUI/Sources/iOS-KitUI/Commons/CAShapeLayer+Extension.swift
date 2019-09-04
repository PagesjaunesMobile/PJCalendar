//
//  CAShapeLayer+Extension.swift
//  KitUI
//
//  Created by Jeffrey Macko on 24/04/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import Foundation
import UIKit

extension  CAShapeLayer {
  func addBorder(withBorderInfo border : KitUIBorderInfo, frameSize : CGSize, path : CGPath) {
    
    guard border.lineWidth > 0 else { return }
    
    let shapeLayer = CAShapeLayer()
    
    shapeLayer.path            = path
    shapeLayer.fillColor       = UIColor.clear.cgColor
    shapeLayer.strokeColor     = border.color.cgColor
    shapeLayer.lineWidth       = border.lineWidth
    shapeLayer.lineDashPattern = border.lineDashPattern.map({ NSNumber(integerLiteral: $0) })
    shapeLayer.lineJoin        = CAShapeLayerLineJoin.round
    
    self.addSublayer(shapeLayer)
  }
}



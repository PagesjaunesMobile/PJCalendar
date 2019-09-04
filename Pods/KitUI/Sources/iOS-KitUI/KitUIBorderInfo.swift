//
//  KitUIBorderInfo.swift
//  KitUI
//
//  Created by Jeffrey Macko on 25/05/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import UIKit

public struct KitUIBorderInfo {
  let lineWidth : CGFloat
  let color : UIColor
  let lineDashPattern : [Int]

  public init(lineWidth : CGFloat, color : UIColor, lineDashPattern : [Int]) {
    self.lineWidth = lineWidth
    self.color = color
    self.lineDashPattern = lineDashPattern
  }
}


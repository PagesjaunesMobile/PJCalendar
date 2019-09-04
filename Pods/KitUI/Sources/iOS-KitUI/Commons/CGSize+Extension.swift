//
//  CGSize+Extension.swift
//  KitUI
//
//  Created by Jeffrey Macko on 24/04/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import UIKit
import Foundation

extension CGSize {
  static public func * (lhs : CGSize, rhs : CGFloat) -> CGSize {
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
  }
}



//
//  ValueLabelType.swift
//  KitUI
//
//  Created by Xavier De Koninck on 07/11/2017.
//  Copyright © 2017 PagesJaunes. All rights reserved.
//


import UIKit

public enum ValueLabelType: Int {
  
  case basic
  case light
  case bold
  
  var textColor: UIColor {
    switch self {
    case .basic:
      return .black
    case .light:
      return .darkGray
    case .bold:
      return .black
    }
  }
  
  var font: UIFont {
    switch self {
    case .basic:
      return UIFont.diloRoman(size: 14)
    case .light:
      return UIFont.diloRoman(size: 14)
    case .bold:
      return UIFont.diloBold(size: 16)
    }
  }
}


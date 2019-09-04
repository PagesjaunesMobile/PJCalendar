//
//  BasicHeaderType.swift
//  KitUI
//
//  Created by Xavier De Koninck on 07/11/2017.
//


import UIKit

public enum ViewType: Int {
  
  case white
  case lightGray
  case lightBlue
  
  var backgroundColor: UIColor {
    
    switch self {
    case .white:
      return .white
    case .lightGray:
      return .lightGray
    case .lightBlue:
      return PJColor(.bluePJ)
    }
  }
}


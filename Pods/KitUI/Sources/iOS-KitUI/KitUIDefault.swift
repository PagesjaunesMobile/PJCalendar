//
//  KitUIDefault.swift
//  KitUI
//
//  Created by Jeffrey Macko on 25/05/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import UIKit
import Foundation

public struct KitUIDefault {

  public enum Color {
    case lightGreyDefault
    case darkGreyDefault
    case normalStateColor
    case selectedStateColor
    case highlightStateColor

    public var uicolor : UIColor {
      get {
        switch self {
        case .darkGreyDefault:     return PJColor(.grey6)
        case .lightGreyDefault:    return PJColor(.grey4)
        case .normalStateColor:    return .white
        case .selectedStateColor:  return PJColor(.grey4)
        case .highlightStateColor: return PJColor(.grey4)
        }
      }
    }
  }
}


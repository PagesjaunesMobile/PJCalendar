//
//  KitUIAssetSize.swift
//  KitUI
//
//  Created by Jeffrey Macko on 25/05/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import Foundation
import UIKit


public enum KitUIAssetSize {

  case barButtonItem
  case _8pt
  case _16pt
  case _24pt
  case _32pt
  case _40pt
  case _48pt
  case _56pt
  case _64pt
  case _72pt
  case _80pt
  case _88pt
  case _96pt
  case _120pt
  case custom(width : Int) // doit etre extrement bien motivé on ne devrait JAMAIS l'utiliser normalement

  public var size : CGSize {
    get {
      switch self {
      case .barButtonItem:      return KitUIAssetSize._24pt.size
      case ._8pt:               return CGSize(width: 8, height: 8)
      case ._16pt:              return CGSize(width: 16, height: 16)
      case ._24pt:              return CGSize(width: 24, height: 24)
      case ._32pt:              return CGSize(width: 32, height: 32)
      case ._40pt:              return CGSize(width: 40, height: 40)
      case ._48pt:              return CGSize(width: 48, height: 48)
      case ._56pt:              return CGSize(width: 56, height: 56)
      case ._64pt:              return CGSize(width: 64, height: 64)
      case ._72pt:              return CGSize(width: 72, height: 72)
      case ._80pt:              return CGSize(width: 80, height: 80)
      case ._88pt:              return CGSize(width: 88, height: 88)
      case ._96pt:              return CGSize(width: 96, height: 96)
      case ._120pt:             return CGSize(width: 120, height: 120)
      case let .custom(width):  return CGSize(width: width, height: width)
      }
    }
  }
}


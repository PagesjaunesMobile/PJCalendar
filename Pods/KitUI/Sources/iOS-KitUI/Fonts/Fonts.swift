//
//  Fonts.swift
//  KitUI
//
//  Created by Xavier De Koninck on 19/09/2017.
//  Copyright © 2017 PagesJaunes. All rights reserved.
//


import UIKit

public extension UIFont {

  static func registerDilo() {
    _ = diloLight(size: 10)
    _ = diloRoman(size: 10)
    _ = diloBold(size: 10)
  }

  @objc(diloLight:)
  static func diloLight(size: CGFloat) -> UIFont {
    return PJFont.DiLoIOS._45Light.font(size: size)
  }
  
  @objc(diloRoman:)
  static func diloRoman(size: CGFloat) -> UIFont {
    return PJFont.DiLoIOS._55Roman.font(size: size)
  }
  
  @objc(diloBold:)
  static func diloBold(size: CGFloat) -> UIFont {
    return PJFont.DiLoIOS._65Bold.font(size: size)
  }

  static func hasFont(_ filenameString: String) -> Bool {
    return UIFont.familyNames.contains(where: { $0 == filenameString })
  }
}


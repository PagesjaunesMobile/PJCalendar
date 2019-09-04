//
//  ColorsShims.swift
//  KitUI
//
//  Created by Jeffrey Macko on 18/04/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import Foundation
import UIKit

/*
/// Cette fonction sert a extraire les couleurs du fichier Colors.xcasset et d'y accéder partout dans le code
///
/// - Parameter iOS11Color: represente les couleurs du fichier `Colors.xcasset` en enum
/// - Returns: renvoi une couleur normaliser au format `UIColor`
@available(iOS, introduced: 11.0)
public func PJColor(_ iOS11Color : PJAssetForColor) -> UIColor {
  return iOS11Color.color
}
*/

/// Cette fonction sert a extraire les couleurs du fichier Colors.txt et d'y accéder partout dans le code
///
/// - Parameter iOS10Color: represente les couleurs du fichier `Colors.txt` en enum
/// - Returns: renvoi une couleur normaliser au format `UIColor`
//@available(iOS, deprecated: 11.0, obsoleted: 10.3, message: "A similar function should work for iOS 11+")
public func PJColor(_ iOS10Color : PJColoriOS10) -> UIColor {
  return iOS10Color.color
}


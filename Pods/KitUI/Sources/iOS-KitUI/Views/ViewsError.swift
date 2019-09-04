//
//  ViewsError.swift
//  KitUI
//
//  Created by Xavier De Koninck on 07/11/2017.
//  Copyright © 2017 PagesJaunes. All rights reserved.
//

import Foundation

enum ViewsError: Error, CustomStringConvertible {
  
  case unknownType
  
  var description: String {
    
    switch self {
    case .unknownType:
      return "This type of view does not exist!"
    }
  }
}

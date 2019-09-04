//
//  ValueLabel.swift
//  KitUI
//
//  Created by Xavier De Koninck on 07/11/2017.
//  Copyright © 2017 PagesJaunes. All rights reserved.
//


import UIKit

@IBDesignable public class ValueLabel: UILabel {
  
  @IBInspectable open var type: Int = 0 {
    didSet {
      guard let _ = ValueLabelType(rawValue: type) else { fatalError(LabelsError.unknownType.description) }
      setup()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override public func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }
  
  override public func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  func setup() {
    
    let type = ValueLabelType(rawValue: self.type)
    
    if let type = type {
      font = type.font
      textColor = type.textColor
    }
  }
}


//
//  BasicHeader.swift
//  KitUI
//
//  Created by Xavier De Koninck on 07/11/2017.
//


import UIKit

@IBDesignable public class View: UIView {
  
  @IBInspectable open var type: Int = 0 {
    didSet {
      guard let _ = ViewType(rawValue: type) else { fatalError(ViewsError.unknownType.description) }
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
    
    let type = ViewType(rawValue: self.type)
    
    if let type = type {
      backgroundColor = type.backgroundColor
    }
  }
}


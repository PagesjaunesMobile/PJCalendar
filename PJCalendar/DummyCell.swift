//
//  DummyCell.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 25/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class DummyCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.contentView.backgroundColor = .green
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

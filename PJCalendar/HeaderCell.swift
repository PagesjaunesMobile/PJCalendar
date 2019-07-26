//
//  MonthCell.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 25/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit
class HeaderCell: UICollectionReusableView {

  let label: UILabel = {
    let dest = UILabel(frame: .zero)
    dest.translatesAutoresizingMaskIntoConstraints = false
    dest.numberOfLines = 1
    return dest
  }()

  var oldFrame: CGRect = .zero

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.addSubview(label)
    label.text = "HEADER"
    label.font = UIFont.systemFont(ofSize: 48)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    label.adjustsFontForContentSizeCategory = true
    label.textColor = .red
    label.backgroundColor = UIColor.yellow
    label.lineBreakMode = .byClipping

    var constraints = [NSLayoutConstraint]()

    constraints.append(self.label.topAnchor.constraint(equalTo: self.topAnchor))
    constraints.append(self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor))
    constraints.append(self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor))


    NSLayoutConstraint.activate(constraints)

    self.backgroundColor = .blue

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}

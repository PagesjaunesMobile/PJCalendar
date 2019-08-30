//
//  SlotHeader.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 29/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class SlotHeaderCell: UICollectionViewCell {

  static let reusueIdentifier = String(describing:self)

  let segmentedControll: UISegmentedControl = {
    let dest = UISegmentedControl()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.segmentedControll.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 26))
    constraints.append(self.segmentedControll.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24))
    constraints.append(self.segmentedControll.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24))
    constraints.append(self.segmentedControll.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -32))

    NSLayoutConstraint.activate(constraints)
  }

  func setupView() {
    self.contentView.addSubview(self.segmentedControll)
    self.segmentedControll.insertSegment(withTitle: "Matin", at: 0, animated: false)
    self.segmentedControll.insertSegment(withTitle: "Apres midi", at: 1, animated: false)
  }

  func setup() {
    self.setupView()
    self.setupLayout()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}

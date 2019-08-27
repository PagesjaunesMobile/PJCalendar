//
//  MonthCell.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 26/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class MonthCell: UICollectionViewCell {

  static let reuseCellIdentifier: String = String(describing: self)

  let titleLabel: UILabel = {
    let dest = UILabel()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.titleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor))
    constraints.append(self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor))
    constraints.append(self.titleLabel.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor))
    constraints.append(self.titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.contentView.leadingAnchor))
    constraints.append(self.titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor))
    constraints.append(self.titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  func setupView() {
    self.contentView.addSubview(self.titleLabel)
  }

  func setupStyle() {
    self.titleLabel.textColor = UIColor.red
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupStyle()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(model: MonthViewModel) {
    self.titleLabel.text = model.monthText
  }

}

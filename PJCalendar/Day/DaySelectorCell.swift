//
//  DaySelectorCell.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 07/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class DaySelectorCell: UICollectionViewCell {

  static let reeuseIdentier = String(describing: self)

  static let cellSize = CGSize(width: 72, height: 56)

  let dayTextLabel: UILabel = {
    let dest = UILabel()
    dest.textColor = UIColor.red
    dest.textAlignment = NSTextAlignment.center
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let dayNumberLabel: UILabel = {
    let dest = UILabel()
    dest.textColor = UIColor.red
    dest.textAlignment = NSTextAlignment.center
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    // dayTextLabel
    constraints.append(self.dayTextLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor))
    constraints.append(self.dayTextLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor))
    constraints.append(self.dayTextLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor))

    // dayNumberLabel
    constraints.append(self.dayNumberLabel.topAnchor.constraint(equalTo: self.dayTextLabel.bottomAnchor))
    constraints.append(self.dayNumberLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor))
    constraints.append(self.dayNumberLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor))
    constraints.append(self.dayNumberLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  func setupView() {
    self.contentView.addSubview(self.dayTextLabel)
    self.contentView.addSubview(self.dayNumberLabel)

    self.dayTextLabel.font = UIFont.systemFont(ofSize: 17)
    self.dayNumberLabel.font = UIFont.systemFont(ofSize: 32)
  }

  func configure(_ model: DayViewModel) {
    self.dayTextLabel.text = model.dayOfTheWeek
    self.dayNumberLabel.text = model.dayNumber
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
    self.setupLayout()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

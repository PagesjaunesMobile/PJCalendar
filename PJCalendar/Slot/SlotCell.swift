//
//  SlotCell.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 25/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class SlotCell: UICollectionViewCell {

  static let cellSize =  CGSize(width: 88, height: 40)
  static let iPadCellSize =  CGSize(width: 120, height: 40)

  let titleLabel: UILabel = {
    let dest = UILabel(frame: .zero)
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.titleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor))
    constraints.append(self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor))

    constraints.append(self.titleLabel.leftAnchor.constraint(greaterThanOrEqualTo: self.contentView.leftAnchor, constant: 5))
    constraints.append(self.titleLabel.rightAnchor.constraint(lessThanOrEqualTo: self.contentView.rightAnchor, constant: -5))
    constraints.append(self.titleLabel.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 5))
    constraints.append(self.titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -5))

    NSLayoutConstraint.activate(constraints)
  }

  func setupView() {
    self.contentView.addSubview(self.titleLabel)
  }
  
  func enableSelectedStyle() {
    self.contentView.backgroundColor = UIColor.bluePJ()
    self.titleLabel.textColor = UIColor.white
  }
  
  func enableDeselectedStyle() {
    self.contentView.backgroundColor = UIColor.white
    self.titleLabel.textColor = UIColor.bluePJ()
  }

  func setupStyle() {
    self.contentView.layer.borderWidth = 1
    self.contentView.layer.cornerRadius = 4.0
    self.contentView.clipsToBounds = true
    self.contentView.layer.borderColor = UIColor.bluePJ().cgColor
    self.titleLabel.font = UIFont.diloRoman(size: 16)
    self.titleLabel.textColor = UIColor.bluePJ()
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupStyle()
    self.enableDeselectedStyle()
  }

  override var isSelected: Bool {
    didSet {
      if self.isSelected == true {
        self.enableSelectedStyle()
      } else {
        self.enableDeselectedStyle()
      }
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  func configure(model: TimeSlotViewModel) {
    self.titleLabel.text = model.displayText
    self.isSelected = model.isSelected.value
  }

  static let reusueCellIdentifier = String(describing:SlotCell.self)

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

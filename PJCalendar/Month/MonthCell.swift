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

  static let reuseCellIdentifier: String = String(describing: MonthCell.self)

  let containerView: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let monthTitle: UILabel = {
    let dest = UILabel()
    dest.translatesAutoresizingMaskIntoConstraints = false
    dest.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.vertical)
    dest.lineBreakMode = NSLineBreakMode.byClipping
    dest.numberOfLines = 0
    dest.adjustsFontSizeToFitWidth = true
    dest.minimumScaleFactor = 0.6
    return dest
  }()

  let yearTitle: UILabel = {
    let dest = UILabel()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()


    constraints.append(self.contentView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor))
    constraints.append(self.contentView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor))

    constraints.append(self.containerView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6))

    constraints.append(self.monthTitle.topAnchor.constraint(equalTo: self.containerView.topAnchor))
    constraints.append(self.monthTitle.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor))
    constraints.append(self.monthTitle.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor))

    constraints.append(self.yearTitle.topAnchor.constraint(equalTo: self.monthTitle.bottomAnchor))
    constraints.append(self.yearTitle.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor))
    constraints.append(self.yearTitle.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor))
    constraints.append(self.yearTitle.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor))
    
    NSLayoutConstraint.activate(constraints)
  }

  func setupView() {
    self.contentView.addSubview(self.containerView)
    self.containerView.addSubview(self.monthTitle)
    self.containerView.addSubview(self.yearTitle)
  }

  func setupStyle() {
    self.monthTitle.textColor = UIColor.black
    self.yearTitle.textColor = UIColor.black
    self.monthTitle.font = UIFont.diloRoman(size: 32)
    self.yearTitle.font = UIFont.diloBold(size: 20)
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
    self.monthTitle.text = model.monthText
    self.yearTitle.text = model.yearText
  }

}

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

  override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    super.apply(layoutAttributes)
  }

  let label: UILabel = {
    let dest = UILabel(frame: .zero)
    dest.translatesAutoresizingMaskIntoConstraints = false
    dest.numberOfLines = 0
    return dest
  }()

  let firstView: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let secondView: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let dayView: DaySelectorView = {
    let dest = DaySelectorView(frame: .zero)
    dest.backgroundColor = .yellow
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()



  static let hearderheight: CGFloat = 237

  var oldFrame: CGRect = .zero

  func setupView() {

    self.addSubview(self.firstView)
    self.firstView.addSubview(self.label)
    self.addSubview(self.secondView)
    self.secondView.addSubview(self.dayView)


    // Label

    label.text = "Septembre\n2019"
    label.font = UIFont.systemFont(ofSize: 48)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.1
    label.textColor = .red
    label.lineBreakMode = .byClipping
    label.backgroundColor = UIColor.orange
    label.clipsToBounds = true
    label.textAlignment = .left
    label.textColor = UIColor.red

    self.backgroundColor = .blue
    self.firstView.backgroundColor = .orange
    self.secondView.backgroundColor = UIColor.purple

  }

  func setupLayout() {

    var constraints = [NSLayoutConstraint]()

    // FirstView
    constraints.append(self.topAnchor.constraint(equalTo: self.firstView.topAnchor))
    constraints.append(self.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor))
    constraints.append(self.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor))

    // Label
    constraints.append(self.label.topAnchor.constraint(equalTo: self.firstView.topAnchor))
    constraints.append(self.label.bottomAnchor.constraint(equalTo: self.firstView.bottomAnchor))
    constraints.append(self.label.centerXAnchor.constraint(equalTo: self.firstView.centerXAnchor))

    // SecoundView
    constraints.append(self.secondView.topAnchor.constraint(equalTo: self.firstView.bottomAnchor))
    constraints.append(self.secondView.leadingAnchor.constraint(equalTo: self.leadingAnchor))
    constraints.append(self.secondView.trailingAnchor.constraint(equalTo: self.trailingAnchor))
    constraints.append(self.secondView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
    constraints.append(self.secondView.heightAnchor.constraint(equalToConstant: HeaderCell.hearderheight / 2))

    // DayView
    constraints.append(self.dayView.topAnchor.constraint(equalTo: self.secondView.topAnchor))
    constraints.append(self.dayView.bottomAnchor.constraint(equalTo: self.secondView.bottomAnchor))
    constraints.append(self.dayView.leadingAnchor.constraint(equalTo: self.secondView.leadingAnchor))
    constraints.append(self.dayView.trailingAnchor.constraint(equalTo: self.secondView.trailingAnchor))

    NSLayoutConstraint.activate(constraints)
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

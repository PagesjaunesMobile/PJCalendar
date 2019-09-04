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

  static let reusueCellIdentifier = String(describing: HeaderCell.self)

  static let hearderheight: CGFloat = 214
  static let minHeaderSize: CGFloat = 161

  let effectView: UIVisualEffectView = {
    let dest = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let firstViewContainer: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let firstSeparatorView: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let secondSeparatorView: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let secondViewContainer: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  var dayView: DaySelectorView? = nil
  var monthView: MonthSelectorView? = nil

  func setupView() {
    self.addSubview(self.effectView)
    self.effectView.contentView.addSubview(self.firstSeparatorView)
    self.effectView.contentView.addSubview(self.secondSeparatorView)
    self.effectView.contentView.addSubview(self.firstViewContainer)
    self.effectView.contentView.addSubview(self.secondViewContainer)
  }

  func setupLayout() {

    var constraints = [NSLayoutConstraint]()

    // EffectView
    constraints.append(self.effectView.topAnchor.constraint(equalTo: self.topAnchor))
    constraints.append(self.effectView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
    constraints.append(self.effectView.trailingAnchor.constraint(equalTo: self.trailingAnchor))
    constraints.append(self.effectView.leadingAnchor.constraint(equalTo: self.leadingAnchor))

    // FirstView
    constraints.append(self.effectView.topAnchor.constraint(equalTo: self.firstViewContainer.topAnchor))
    constraints.append(self.effectView.leadingAnchor.constraint(equalTo: self.firstViewContainer.leadingAnchor))
    constraints.append(self.effectView.trailingAnchor.constraint(equalTo: self.firstViewContainer.trailingAnchor))

    // FirstSeparatorView
    constraints.append(self.firstSeparatorView.topAnchor.constraint(equalTo: self.firstViewContainer.bottomAnchor))
    constraints.append(self.firstSeparatorView.leadingAnchor.constraint(equalTo: self.effectView.leadingAnchor, constant: 24))
    constraints.append(self.firstSeparatorView.trailingAnchor.constraint(equalTo: self.effectView.trailingAnchor, constant: -24))
    constraints.append(self.firstSeparatorView.heightAnchor.constraint(equalToConstant: 1.0))

    // SecoundView
    constraints.append(self.secondViewContainer.topAnchor.constraint(equalTo: self.firstSeparatorView.bottomAnchor))
    constraints.append(self.secondViewContainer.leadingAnchor.constraint(equalTo: self.effectView.leadingAnchor))
    constraints.append(self.secondViewContainer.trailingAnchor.constraint(equalTo: self.effectView.trailingAnchor))
    constraints.append(self.secondViewContainer.heightAnchor.constraint(equalToConstant: 88))

    // SecounSeparatorView
    constraints.append(self.secondSeparatorView.heightAnchor.constraint(equalToConstant: 1.0))
    constraints.append(self.secondSeparatorView.topAnchor.constraint(equalTo: self.secondViewContainer.bottomAnchor))
    constraints.append(self.secondSeparatorView.leadingAnchor.constraint(equalTo: self.effectView.leadingAnchor))
    constraints.append(self.secondSeparatorView.trailingAnchor.constraint(equalTo: self.effectView.trailingAnchor))
    constraints.append(self.secondSeparatorView.bottomAnchor.constraint(equalTo: self.effectView.bottomAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  func setupMonthView(monthListViewModel: MonthListViewModel) {
    guard self.monthView == nil else { return }
    let monthView = MonthSelectorView(viewModel: monthListViewModel)
    monthView.translatesAutoresizingMaskIntoConstraints = false
    self.firstViewContainer.addSubview(monthView)

    var constraints = [NSLayoutConstraint]()

    // MonthView
    constraints.append(monthView.topAnchor.constraint(equalTo: self.firstViewContainer.topAnchor))
    constraints.append(monthView.leadingAnchor.constraint(equalTo: self.firstViewContainer.leadingAnchor))
    constraints.append(monthView.trailingAnchor.constraint(equalTo: self.firstViewContainer.trailingAnchor))
    constraints.append(monthView.bottomAnchor.constraint(equalTo: self.firstViewContainer.bottomAnchor))

    NSLayoutConstraint.activate(constraints)
    self.monthView = monthView
  }

  func setupDayView(dayListViewModel: DayListViewModel) {
    guard self.dayView == nil else { return }
    let dayView = DaySelectorView(viewModel: dayListViewModel)
    dayView.translatesAutoresizingMaskIntoConstraints = false
    self.secondViewContainer.addSubview(dayView)

    var constraints = [NSLayoutConstraint]()

    // DayView
    constraints.append(dayView.topAnchor.constraint(equalTo: self.secondViewContainer.topAnchor))
    constraints.append(dayView.bottomAnchor.constraint(equalTo: self.secondViewContainer.bottomAnchor))
    constraints.append(dayView.leadingAnchor.constraint(equalTo: self.secondViewContainer.leadingAnchor))
    constraints.append(dayView.trailingAnchor.constraint(equalTo: self.secondViewContainer.trailingAnchor))

    NSLayoutConstraint.activate(constraints)
    self.dayView = dayView
  }

  func configure(monthListViewModel: MonthListViewModel, dayListViewModel: DayListViewModel) {
    self.setupMonthView(monthListViewModel: monthListViewModel)
    self.setupDayView(dayListViewModel: dayListViewModel)
  }

  func setupStyle() {
    self.secondSeparatorView.backgroundColor = UIColor.grey4()
    self.firstSeparatorView.backgroundColor = UIColor.grey4()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
    self.setupLayout()
    self.setupStyle()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}

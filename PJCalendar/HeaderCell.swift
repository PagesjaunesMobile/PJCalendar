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

  static let reusueIdentifier = String(describing:self)

  static let hearderheight: CGFloat = 237
  static let minHeaderSize: CGFloat = 167


  let firstViewContainer: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let secondViewContainer: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let dayView: DaySelectorView? = nil
  let monthView: MonthSelectorView? = nil

  func setupView() {

    self.addSubview(self.firstViewContainer)
    self.addSubview(self.secondViewContainer)

    self.backgroundColor = .blue
    self.firstViewContainer.backgroundColor = .orange
    self.secondViewContainer.backgroundColor = UIColor.purple
  }

  func setupLayout() {

    var constraints = [NSLayoutConstraint]()

    // FirstView
    constraints.append(self.topAnchor.constraint(equalTo: self.firstViewContainer.topAnchor))
    constraints.append(self.leadingAnchor.constraint(equalTo: self.firstViewContainer.leadingAnchor))
    constraints.append(self.trailingAnchor.constraint(equalTo: self.firstViewContainer.trailingAnchor))

    // SecoundView
    constraints.append(self.secondViewContainer.topAnchor.constraint(equalTo: self.firstViewContainer.bottomAnchor))
    constraints.append(self.secondViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor))
    constraints.append(self.secondViewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor))
    constraints.append(self.secondViewContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor))
    constraints.append(self.secondViewContainer.heightAnchor.constraint(equalToConstant: HeaderCell.hearderheight / 2))

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
    constraints.append(monthView.bottomAnchor.constraint(equalTo: self.firstViewContainer.bottomAnchor))
    constraints.append(monthView.centerXAnchor.constraint(equalTo: self.firstViewContainer.centerXAnchor))

    NSLayoutConstraint.activate(constraints)

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
  }

  func configure(monthListViewModel: MonthListViewModel, dayListViewModel: DayListViewModel) {
    self.setupMonthView(monthListViewModel: monthListViewModel)
    self.setupDayView(dayListViewModel: dayListViewModel)
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

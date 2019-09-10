//
//  NoSlotView.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 09/09/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit
import KitUI

class AlviableView: UIButton {

  enum Mode {
    case previous(date: DayViewModel)
    case next(date: DayViewModel)

    var image: UIImage {
      switch self {
      case .next:
        return UIImage.resize(UIImage(named: "chevronDroit")!, size: KitUIAssetSize._16pt, color: UIColor.bluePJ())
      case .previous:
        return UIImage.resize(UIImage(named: "chevronGauche")!, size: KitUIAssetSize._16pt, color: UIColor.bluePJ())
      }
    }

    var dayOfWeeekText: String {
      switch self {
      case .previous(date: let previous):
        return previous.dayOfTheWeek
      case .next(date: let next):
        return next.dayOfTheWeek
      }
    }

    var dayNumberText: String {
      switch self {
      case .previous(date: let previous):
        return previous.dayNumber
      case .next(date: let next):
        return next.dayNumber
      }
    }

    var hourText: String? {
      switch self {
      case .next(date: let nextDay):
        return nextDay.slotsViewModel.first?.displayText
      case .previous(date: let previousDay):
        return previousDay.slotsViewModel.first?.displayText
      }
    }

  }

  let dayOfWeekLabel: UILabel = {
    let dest = UILabel()
    dest.textAlignment = NSTextAlignment.center
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let numberOfMonthLabel: UILabel = {
    let dest = UILabel()
    dest.textAlignment = NSTextAlignment.center
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let slotHourLabel: UILabel = {
    let dest = UILabel()
    dest.textAlignment = NSTextAlignment.center
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let arrowImageView: UIImageView = {
    let dest = UIImageView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  override var isHighlighted: Bool {
    didSet {
      if self.isHighlighted == true {
        self.backgroundColor = UIColor.bluePJ().withAlphaComponent(0.2)
      } else {
        self.backgroundColor = UIColor.white
      }
    }
  }


  let mode: Mode

  func setupLayoutNextMode() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.dayOfWeekLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16))
    constraints.append(self.dayOfWeekLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16))
    constraints.append(self.dayOfWeekLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32))

    constraints.append(self.numberOfMonthLabel.topAnchor.constraint(equalTo: self.dayOfWeekLabel.bottomAnchor, constant: 4))
    constraints.append(self.numberOfMonthLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16))
    constraints.append(self.numberOfMonthLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32))

    constraints.append(self.arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8))
    constraints.append(self.arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor))
    constraints.append(self.slotHourLabel.topAnchor.constraint(equalTo: self.numberOfMonthLabel.bottomAnchor, constant: 4))
    constraints.append(self.slotHourLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16))
    constraints.append(self.slotHourLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32))

    constraints.append(self.slotHourLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16))

    NSLayoutConstraint.activate(constraints)
  }

  func setupLayoutPreviousMode() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.dayOfWeekLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16))
    constraints.append(self.dayOfWeekLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16))
    constraints.append(self.dayOfWeekLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32))

    constraints.append(self.numberOfMonthLabel.topAnchor.constraint(equalTo: self.dayOfWeekLabel.bottomAnchor, constant: 4))
    constraints.append(self.numberOfMonthLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16))
    constraints.append(self.numberOfMonthLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32))

    constraints.append(self.arrowImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8))
    constraints.append(self.arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor))

    constraints.append(self.slotHourLabel.topAnchor.constraint(equalTo: self.numberOfMonthLabel.bottomAnchor, constant: 4))
    constraints.append(self.slotHourLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16))
    constraints.append(self.slotHourLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32))

    constraints.append(self.slotHourLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16))

    NSLayoutConstraint.activate(constraints)
  }


  func setupLayout() {
    switch self.mode {
    case .next:
      self.setupLayoutNextMode()
    case .previous:
      self.setupLayoutPreviousMode()
    }

    var constraints = [NSLayoutConstraint]()

    constraints.append(self.widthAnchor.constraint(equalToConstant: 104))
    constraints.append(self.heightAnchor.constraint(equalToConstant: 112))

    NSLayoutConstraint.activate(constraints)
  }

  func setupStyle() {
    self.dayOfWeekLabel.font = UIFont.diloRoman(size: 17)
    self.dayOfWeekLabel.textColor = UIColor.bluePJ()

    self.numberOfMonthLabel.font = UIFont.diloRoman(size: 32)
    self.numberOfMonthLabel.textColor = UIColor.bluePJ()

    self.slotHourLabel.font = UIFont.diloRoman(size: 17)
    self.slotHourLabel.textColor = UIColor.bluePJ()

    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.bluePJ().cgColor
    self.layer.cornerRadius = 3
  }

  func setupView() {
    self.addSubview(self.dayOfWeekLabel)
    self.addSubview(self.numberOfMonthLabel)
    self.addSubview(self.slotHourLabel)
    self.addSubview(self.arrowImageView)
  }

  func setupMode() {
    self.arrowImageView.image = self.mode.image
    self.dayOfWeekLabel.text = self.mode.dayOfWeeekText
    self.numberOfMonthLabel.text = self.mode.dayNumberText
    self.slotHourLabel.text = self.mode.hourText
  }

  func setup() {
    self.setupView()
    self.setupStyle()
    self.setupLayout()
    self.setupMode()
  }

  init(mode: Mode) {
    self.mode = mode
    super.init(frame: .zero)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


class NoSlotCellViewModel {

  enum DisplaySate {
    case oneSlotPrevious(day: DayViewModel)
    case oneSlotNext(day: DayViewModel)
    case twoSlot(previous: DayViewModel, next: DayViewModel)

    init?(previousDay: DayViewModel?, nextDay: DayViewModel?) {
      if let previousDay = previousDay, nextDay == nil {
        self = .oneSlotPrevious(day: previousDay)
      } else if let nextDay = nextDay, previousDay == nil {
        self = .oneSlotNext(day: nextDay)
      } else if let previousDay = previousDay, let nextDay = nextDay {
        self = .twoSlot(previous: previousDay, next: nextDay)
      } else {
        return nil
      }
    }
  }

  let displayState: DisplaySate

  init?(previousDay: DayViewModel?, nextDay: DayViewModel?, dataController: CalendarDataController) {
    guard let displayState = DisplaySate(previousDay: previousDay, nextDay: nextDay) else { return nil }
    self.displayState = displayState
  }

  var shouldPresentOnePreviousDay: Bool {
    switch  self.displayState {
    case .oneSlotPrevious:
      return true
    case .oneSlotNext:
      return false
    case .twoSlot:
      return false
    }
  }

    var shouldPresentOneNextDay: Bool {
      switch  self.displayState {
      case .oneSlotPrevious:
        return false
      case .oneSlotNext:
        return true
      case .twoSlot:
        return false
      }
    }

    var shouldPresentPreviousAndNextDay: Bool {
      switch  self.displayState {
      case .oneSlotPrevious:
        return false
      case .oneSlotNext:
        return false
      case .twoSlot:
        return true
      }
    }

    var previousDay: DayViewModel? {
      switch self.displayState {
      case .oneSlotNext:
        return nil
      case .oneSlotPrevious(day: let previousDay):
        return previousDay
      case .twoSlot(previous: let previousDay, next: _):
        return previousDay
      }
    }

    var nextDay: DayViewModel? {
      switch self.displayState {
      case .oneSlotNext(day: let next):
        return next
      case .oneSlotPrevious:
        return nil
      case .twoSlot(previous: _, next: let next):
        return next
      }
    }

  func userDidTapOnPreviousDay() {
    guard let previousDay = self.previousDay else { return }
    previousDay.userWantToShowSlotOfThisDay()

  }

  func userDidTapOnNextDay() {
    guard let nextDay = self.nextDay else { return }
    nextDay.userWantToShowSlotOfThisDay()
  }

}


class NoSlotCell: UICollectionViewCell {

  static let reusueCellIdentifier = String(describing:NoSlotCell.self)

  var viewModel: NoSlotCellViewModel?

  let titleLabel: UILabel = {
    let dest = UILabel()
    dest.numberOfLines = 0
    dest.textAlignment = .center
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let separatorView: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let alviableDayTitleLabel: UILabel = {
    let dest = UILabel()
    dest.setContentHuggingPriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.vertical)
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let dispoStackView: UIStackView = {
    let dest = UIStackView(frame: .zero)
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupLayout() {
    var constrains = [NSLayoutConstraint]()

    constrains.append(self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 48))
    constrains.append(self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 56))
    constrains.append(self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -56))
    constrains.append(self.separatorView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 24))

    constrains.append(self.separatorView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 56))
    constrains.append(self.separatorView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -56))
    constrains.append(self.separatorView.heightAnchor.constraint(equalToConstant: 1))

    constrains.append(self.alviableDayTitleLabel.topAnchor.constraint(equalTo: self.separatorView.bottomAnchor, constant: 24))
    constrains.append(self.alviableDayTitleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor))

    constrains.append(self.dispoStackView.topAnchor.constraint(equalTo: self.alviableDayTitleLabel.bottomAnchor, constant: 24))

    let toto = self.dispoStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 40)
    toto.priority = .defaultLow
    let toto2 = self.dispoStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -40)
    toto2.priority = .defaultLow

    constrains.append(self.dispoStackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor))

    constrains.append(toto)
    constrains.append(toto2)

    NSLayoutConstraint.activate(constrains)
  }

  func setupView() {
    self.contentView.addSubview(self.titleLabel)
    self.contentView.addSubview(self.separatorView)
    self.contentView.addSubview(self.alviableDayTitleLabel)
    self.contentView.addSubview(self.dispoStackView)
  }

  func setupStyle() {
    self.titleLabel.textColor = UIColor.grey5()
    self.titleLabel.font = UIFont.diloLight(size: 24)
    self.separatorView.backgroundColor = UIColor.grey3()
    self.alviableDayTitleLabel.textColor = UIColor.grey6()
    self.alviableDayTitleLabel.font = UIFont.diloBold(size: 17)
  }

  func setupStackView() {
    self.dispoStackView.alignment = .center
    self.dispoStackView.distribution = .equalSpacing
    self.dispoStackView.axis = .horizontal
  }

  func setupText() {
    self.titleLabel.text = "Pas de disponibilté pour ce jour."
    self.alviableDayTitleLabel.text = "Disponibilités les plus proches."
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupStyle()
    self.setupStackView()
    self.setupText()
  }

  func cleanStackView() {
    self.dispoStackView.subviews.forEach {
      self.dispoStackView.removeArrangedSubview($0)
      $0.removeFromSuperview()
    }
  }

  override func prepareForReuse() {
    self.cleanStackView()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  @objc func userDidTapOnNextSlot() {
    guard let viewModel = self.viewModel else { return }
    viewModel.userDidTapOnNextDay()
  }

  @objc func userDidTapOnPreviousSlot() {
    guard let viewModel = self.viewModel else { return }
    viewModel.userDidTapOnPreviousDay()
  }

  func configureOnePreviousSlot(day: DayViewModel) {
    let dayView = AlviableView(mode: .previous(date: day))
    dayView.addTarget(self, action: #selector(userDidTapOnPreviousSlot), for: .touchUpInside)
    self.dispoStackView.addArrangedSubview(dayView)

  }

  func configureOneNextSlot(day: DayViewModel) {
    let dayView = AlviableView(mode: .next(date: day))
    dayView.addTarget(self, action: #selector(userDidTapOnNextSlot), for: .touchUpInside)
    self.dispoStackView.addArrangedSubview(dayView)
  }

  func configureSlot(previous: DayViewModel, next: DayViewModel) {
    self.configureOnePreviousSlot(day: previous)
    self.configureOneNextSlot(day: next)
  }

  func configure(viewModel: NoSlotCellViewModel) {
    self.viewModel = viewModel

    if let previous = viewModel.previousDay, viewModel.shouldPresentOnePreviousDay {
      self.configureOnePreviousSlot(day: previous)
    }

    if let nexDay = viewModel.nextDay, viewModel.shouldPresentOneNextDay {
      self.configureOneNextSlot(day: nexDay)
    }

    if let previousDay = viewModel.previousDay, let nextDay = viewModel.nextDay, viewModel.shouldPresentPreviousAndNextDay {
      self.configureSlot(previous: previousDay, next: nextDay)
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}

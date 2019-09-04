//
//  SlotHeader.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 29/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class SlotHeaderCell: UICollectionReusableView {

  static let reusueCellIdentifier = String(describing:SlotHeaderCell.self)

  let segmentedControll: UISegmentedControl = {
    let dest = UISegmentedControl()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()
  
  var viewModel: TimeSlotListViewModel? = nil

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.segmentedControll.topAnchor.constraint(equalTo: self.topAnchor, constant: 26))
    constraints.append(self.segmentedControll.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24))
    constraints.append(self.segmentedControll.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24))
    constraints.append(self.segmentedControll.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32))

    NSLayoutConstraint.activate(constraints)
  }
  
  @objc func segmentedControllDidChange() {
    if self.segmentedControll.selectedSegmentIndex == 0 {
      self.viewModel?.userDidSelectMoringPeriod()
    } else {
      self.viewModel?.userDidSelectAfternoonPeriod()
    }
  }

  func setupView() {
    self.addSubview(self.segmentedControll)
  }
  
  override func prepareForReuse() {
    guard let viewModel = self.viewModel else { return }
    viewModel.segmentedControlIndexToDisplay.removeAllObserver()
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupStyle()
  }
  
  func setupModel() {
    guard let viewModel = self.viewModel else { return }
    
    self.segmentedControll.insertSegment(withTitle: viewModel.dataController.morningName, at: 0, animated: false)
    self.segmentedControll.insertSegment(withTitle: viewModel.dataController.afterNoonName, at: 1, animated: false)
    self.segmentedControll.addTarget(self, action: #selector(segmentedControllDidChange), for: UIControl.Event.valueChanged)
    
    viewModel.segmentedControlIndexToDisplay.bind { [weak self] _, indexToDisplay in
      guard let `self` = self else { return }
      guard indexToDisplay >= 0, indexToDisplay < self.segmentedControll.numberOfSegments else { return }
      self.segmentedControll.selectedSegmentIndex = indexToDisplay
    }

    self.segmentedControll.selectedSegmentIndex = viewModel.segmentedControlIndexToDisplay.value
  }

  func configure(viewModel: TimeSlotListViewModel) {
    guard self.viewModel == nil else {
      self.segmentedControll.selectedSegmentIndex = viewModel.segmentedControlIndexToDisplay.value
      return
    }
    self.viewModel = viewModel
    self.setupModel()
  }

  func setupStyle() {

    var selected = [NSAttributedString.Key : Any]()
    selected[NSAttributedString.Key.font] = UIFont.diloBold(size: 13)
    selected[NSAttributedString.Key.foregroundColor] = UIColor.black

    var normal = [NSAttributedString.Key : Any]()
    normal[NSAttributedString.Key.foregroundColor] = UIColor.black
    normal[NSAttributedString.Key.font] = UIFont.diloRoman(size: 13)

    self.segmentedControll.setTitleTextAttributes(normal, for: UIControl.State.normal)
    self.segmentedControll.setTitleTextAttributes(selected, for: UIControl.State.selected)
    self.segmentedControll.layer.cornerRadius = 9

    self.segmentedControll.backgroundColor = UIColor.grey2()
    self.segmentedControll.tintColor = UIColor.white

    self.segmentedControll.layer.borderWidth = 2.0
    self.segmentedControll.layer.borderColor = UIColor.grey2().cgColor
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

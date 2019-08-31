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

  static let reusueCellIdentifier = String(describing:SlotHeaderCell.self)

  let segmentedControll: UISegmentedControl = {
    let dest = UISegmentedControl()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()
  
  var viewModel: TimeSlotListViewModel? = nil

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.segmentedControll.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 26))
    constraints.append(self.segmentedControll.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24))
    constraints.append(self.segmentedControll.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24))
    constraints.append(self.segmentedControll.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -32))

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
    self.contentView.addSubview(self.segmentedControll)
  }
  
  override func prepareForReuse() {
    guard let viewModel = self.viewModel else { return }
    viewModel.segmentedControlIndexToDisplay.removeAllObserver()
  }

  func setup() {
    self.setupView()
    self.setupLayout()
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

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

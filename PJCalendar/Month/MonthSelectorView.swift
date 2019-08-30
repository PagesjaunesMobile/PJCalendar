//
//  MonthSelectorView.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 21/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class MonthSelectorView: UIView {

  let viewModel: MonthListViewModel

  var selectedIndexPath = IndexPath(item: 0, section: 0) {
    didSet {
      self.viewModel.userWantToDisplayMonthDay(indexPath: selectedIndexPath)
    }
  }

  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    let dest = UICollectionView(frame: .zero, collectionViewLayout: layout)
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let leftButton: UIButton = {
    let dest = UIButton(type: .custom)
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let rightButton: UIButton = {
    let dest = UIButton(type: .custom)
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.leftButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5))
    constraints.append(self.leftButton.centerYAnchor.constraint(equalTo: self.centerYAnchor))

    constraints.append(self.rightButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5))
    constraints.append(self.rightButton.centerYAnchor.constraint(equalTo: self.centerYAnchor))

    constraints.append(self.collectionView.topAnchor.constraint(equalTo: self.topAnchor))
    constraints.append(self.collectionView.leftAnchor.constraint(equalTo: self.leftButton.rightAnchor, constant: 5))
    constraints.append(self.collectionView.rightAnchor.constraint(equalTo: self.rightButton.leftAnchor, constant: -5))
    constraints.append(self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor))

    self.collectionView.backgroundColor = UIColor.yellow

    NSLayoutConstraint.activate(constraints)
  }

  func setupCollectionView() {
    self.collectionView.isPagingEnabled = true
    self.collectionView.register(MonthCell.self, forCellWithReuseIdentifier: MonthCell.reuseCellIdentifier)
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
  }

  @objc func handleButtonAction(button: UIButton) {
    if button == self.leftButton {
        self.viewModel.userWantToDisplayPreviousMonth()
    } else if button == self.rightButton {
        self.viewModel.userWantToDisplayNextMont()
    }
  }

  func setupButtons() {
    self.leftButton.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
    self.rightButton.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
  }

  func setupView() {
    self.addSubview(self.leftButton)
    self.addSubview(self.rightButton)
    self.addSubview(self.collectionView)
    self.backgroundColor = UIColor.blue
  }

  func setupViewModel() {
    self.viewModel.shouldShowMonth.bind { [weak self] _, result in
      guard let `self` = self else { return }
      UIView.animate(withDuration: 0.35, animations: { [weak self] in
        guard let `self` = self else { return }
        self.collectionView.alpha = result ? 1.0 : 0.0
        if result == true {
          self.collectionView.reloadData()
        }
      })
    }

    self.viewModel.selectedIndexPath.bind { [weak self] _, indexPath in
      guard let `self` = self else { return }
      self.collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupCollectionView()
    self.setupViewModel()
    self.setupButtons()
  }

  init(viewModel: MonthListViewModel) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}


extension MonthSelectorView: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {

  }

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let center = self.convert(self.collectionView.center, to: self.collectionView)
    if let index = collectionView.indexPathForItem(at: center)/*, self.selectedIndexPath != index*/ {
      self.selectedIndexPath = index
    }
  }

}

extension MonthSelectorView: UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.viewModel.monthsCount
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthCell.reuseCellIdentifier, for: indexPath)
    guard let castedCell = cell as? MonthCell, let monthModel = self.viewModel[indexPath] else { return cell }
    castedCell.configure(model: monthModel)
    return castedCell
  }
}

extension MonthSelectorView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return collectionView.frame.size
  }
}



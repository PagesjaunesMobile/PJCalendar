//
//  MonthSelectorView.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 21/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit
import KitUI

class MonthSelectorViewCollectionViewLayout: UICollectionViewLayout {

  var attributes = [UICollectionViewLayoutAttributes]()

  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }

  override var collectionViewContentSize: CGSize {
    guard let collectionView = self.collectionView else { return .zero }

    return CGSize(width: CGFloat(collectionView.frame.size.width) * CGFloat(collectionView.numberOfItems(inSection: 0)), height: collectionView.frame.size.height)
  }

  override func invalidateLayout() {
    super.invalidateLayout()
    self.attributes.removeAll()
  }

  override func prepare() {

    guard let collectionView = self.collectionView else { return }
    self.attributes.removeAll()

    for i in 0..<collectionView.numberOfItems(inSection: 0) {
      let attr = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
      attr.frame = CGRect(x: CGFloat(i) * collectionView.frame.size.width, y: 0, width: collectionView.frame.size.width, height: collectionView.frame.size.height)
      self.attributes.append(attr)
    }
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let dest =  self.attributes.filter { $0.frame.intersects(rect) }
    return dest
  }

  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return self.attributes.first { $0.indexPath == indexPath }
  }

}

class MonthSelectorView: UIView {

  let viewModel: MonthListViewModel

  var savedSize: CGSize = .zero

  var selectedIndexPath = IndexPath(item: 0, section: 0) {
    didSet {
      self.viewModel.userWantToDisplayMonthDay(indexPath: selectedIndexPath)
    }
  }

  let collectionView: UICollectionView = {
    let layout = MonthSelectorViewCollectionViewLayout()
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

    constraints.append(self.leftButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16))
    constraints.append(self.leftButton.centerYAnchor.constraint(equalTo: self.centerYAnchor))

    constraints.append(self.rightButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16))
    constraints.append(self.rightButton.centerYAnchor.constraint(equalTo: self.centerYAnchor))

    constraints.append(self.collectionView.topAnchor.constraint(equalTo: self.topAnchor))
    constraints.append(self.collectionView.leftAnchor.constraint(equalTo: self.leftButton.rightAnchor, constant: 16))
    constraints.append(self.collectionView.rightAnchor.constraint(equalTo: self.rightButton.leftAnchor, constant: -16))
    constraints.append(self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  func setupCollectionView() {
    self.collectionView.contentInsetAdjustmentBehavior = .never
    self.collectionView.isPagingEnabled = true
    self.collectionView.register(MonthCell.self, forCellWithReuseIdentifier: MonthCell.reuseCellIdentifier)
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
    self.collectionView.backgroundColor = UIColor.clear
    self.collectionView.showsVerticalScrollIndicator = false
    self.collectionView.showsHorizontalScrollIndicator = false
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
  }

  func update(button: UIButton, displayState : MonthListViewModel.ArrowButtonDisplayState) {
    switch displayState {
    case .enable:
      button.isEnabled = true
    case .disabled:
      button.isEnabled = false
    case .loading:
      break
    }
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

    self.viewModel.leftButtonDisplayState.bind  { [weak self] _, displayState in
      guard let `self` = self else { return }
      self.update(button: self.leftButton, displayState: displayState)
    }

    self.viewModel.rightButtonDisplayState.bind  { [weak self] _, displayState in
      guard let `self` = self else { return }
      self.update(button: self.rightButton, displayState: displayState)
    }

    self.viewModel.selectedIndexPath.bind { [weak self] _, indexPath in
      guard let `self` = self else { return }
      self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    self.update(button: self.leftButton, displayState: self.viewModel.leftButtonDisplayState.value)
    self.update(button: self.rightButton, displayState: self.viewModel.rightButtonDisplayState.value)
  }

  func setupStyle() {
    self.leftButton.setImage(UIImage.resize(UIImage(named: "chevronGauche")!, size: KitUIAssetSize._16pt, color: .black), for: .normal)
    self.leftButton.setImage(UIImage.resize(UIImage(named: "chevronGauche")!, size: KitUIAssetSize._16pt, color: .grey3()), for: .disabled)

    self.rightButton.setImage(UIImage.resize(UIImage(named: "chevronDroit")!, size: KitUIAssetSize._16pt, color: .black), for: .normal)
    self.rightButton.setImage(UIImage.resize(UIImage(named: "chevronDroit")!, size: KitUIAssetSize._16pt, color: UIColor.grey3()), for: .disabled)
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupStyle()
    self.setupCollectionView()
    self.setupViewModel()
    self.setupButtons()
    self.setupLayout()

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

extension MonthSelectorView: UICollectionViewDelegate {

}


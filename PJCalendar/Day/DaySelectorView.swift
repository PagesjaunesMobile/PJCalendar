//
//  DaySelectorCollectionView.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 30/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class PaginableView: UIView, UIScrollViewDelegate {

  func getCenteredOffsetFromOffset(contentOffset: CGPoint, scrollView: UIScrollView) -> CGPoint {
    guard let collectionView = scrollView as? UICollectionView else { return contentOffset }

    guard let attribute0 = collectionView.collectionViewLayout.layoutAttributesForItem(at: IndexPath(item: 0, section: 0)) else { return contentOffset }
    guard let attribute1 = collectionView.collectionViewLayout.layoutAttributesForItem(at: IndexPath(item: 1, section: 0)) else { return contentOffset }

    let itemSpace: CGFloat = attribute1.frame.origin.x - attribute0.frame.origin.x

    let precisePage = contentOffset.x / itemSpace
    let page: Int

    if precisePage.truncatingRemainder(dividingBy: 1.0) < 0.5 {
      page = Int(floor(contentOffset.x / itemSpace))
    } else {
      page = Int(ceil(contentOffset.x / itemSpace))
    }

    return CGPoint(x: (CGFloat(page) * itemSpace), y: contentOffset.y)
  }

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    targetContentOffset.pointee = self.getCenteredOffsetFromOffset(contentOffset: targetContentOffset.pointee, scrollView: scrollView)
  }

}

class DaySelectorView: PaginableView {

  var index: CGFloat = 0

  var isScrollAnimated = false

  let spinner = UIActivityIndicatorView(style: .gray)

  var shouldReloadWhenAnimationStop = false

  var selectedIndexPath = IndexPath(item: 0, section: 0) {
    didSet {
      self.viewModel.userSelectNewDay(indexPath: selectedIndexPath)
    }
  }

  let viewModel: DayListViewModel

  let glassView: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumInteritemSpacing = 8

    let dest = UICollectionView(frame: .zero, collectionViewLayout: layout)
    dest.backgroundColor = UIColor.clear
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupCollectionView() {
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    self.collectionView.isPagingEnabled = false
    self.collectionView.showsHorizontalScrollIndicator = false
    self.collectionView.showsVerticalScrollIndicator = false
    self.collectionView.register(DaySelectorCell.self, forCellWithReuseIdentifier: DaySelectorCell.reeuseIdentier)
  }

  func restoreOffset(contentOffset: CGPoint) {
    let offset = self.getCenteredOffsetFromOffset(contentOffset: contentOffset, scrollView: self.collectionView)
    self.collectionView.setContentOffset(offset, animated: false)
  }

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.glassView.centerXAnchor.constraint(equalTo: self.collectionView.centerXAnchor))
    constraints.append(self.glassView.centerYAnchor.constraint(equalTo: self.collectionView.centerYAnchor))


    constraints.append(self.glassView.widthAnchor.constraint(equalToConstant: 72))
    constraints.append(self.glassView.heightAnchor.constraint(equalToConstant: 56))

    constraints.append(self.collectionView.topAnchor.constraint(equalTo: self.topAnchor))
    constraints.append(self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
    constraints.append(self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor))
    constraints.append(self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  func setupView() {
    self.addSubview(self.glassView)
    self.addSubview(self.collectionView)
    self.collectionView.addSubview(self.spinner)
    self.spinner.hidesWhenStopped = true
  }

  func setupViewModel() {

    self.viewModel.selectedIndexPath.bind { [weak self] _, indexPath in
      guard let `self` = self, indexPath != self.selectedIndexPath  else { return }
      self.isScrollAnimated = true
      guard self.shouldReloadWhenAnimationStop == false else { return }
      self.collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }

    self.viewModel.delegate = self
  }

  init(viewModel: DayListViewModel) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupStyle() {
    self.glassView.backgroundColor = UIColor.grey2()
    self.glassView.layer.cornerRadius = 7.0
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupCollectionView()
    self.setupViewModel()
    self.setupStyle()
  }

  func updateSelectedIndexPath() {
    let center = self.convert(self.collectionView.center, to: self.collectionView)
    if let index = collectionView.indexPathForItem(at: center)/*, self.selectedIndexPath != index*/ {
      self.selectedIndexPath = index
    }
  }

}

extension DaySelectorView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return self.viewModel.daysCount
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DaySelectorCell.reeuseIdentier, for: indexPath)
    guard let viewModel = self.viewModel[indexPath], let castedCell = cell as? DaySelectorCell else { return cell }
    castedCell.configure(viewModel)
    return castedCell
  }
}

extension DaySelectorView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let offset = ((collectionView.frame.size.width / 2.0) - (DaySelectorCell.cellSize.width / 2.0))
    return UIEdgeInsets(top: 0, left: offset, bottom: 0, right: offset)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return DaySelectorCell.cellSize
  }
}

extension DaySelectorView {

  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    self.isScrollAnimated = false
  }

  func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    self.isScrollAnimated = false
    if self.shouldReloadWhenAnimationStop == true {
      self.shouldReloadWhenAnimationStop = false
      self.spinner.stopAnimating()
      let oldContentOffset = self.collectionView.contentOffset
      self.collectionView.reloadData()
      self.collectionView.setContentOffset(oldContentOffset, animated: false)
    } else {
      self.updateSelectedIndexPath()
    }
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard self.isScrollAnimated == false else {
      return
    }
    self.updateSelectedIndexPath()
  }

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

    if self.shouldReloadWhenAnimationStop == true {
      self.shouldReloadWhenAnimationStop = false
      self.spinner.stopAnimating()
      let offset = self.collectionView.contentOffset
      self.collectionView.reloadData()
      self.collectionView.setContentOffset(offset, animated: false)
    }
  }
}


extension DaySelectorView: DayListViewModelDelegate {

  func updateSpinnerFrame() {
    let offset = ((collectionView.frame.size.width / 2.0) - (DaySelectorCell.cellSize.width / 2.0))
    let centerY = (self.collectionView.frame.size.height / 2.0) - (spinner.frame.size.height / 2.0)
    let x = (self.collectionView.contentSize.width - offset) + (DaySelectorCell.cellSize.width / 2.0)
    self.spinner.frame = CGRect(x: x, y: centerY, width: spinner.frame.size.width, height: spinner.frame.size.height)
  }

  func shouldReloadDays() {

    guard
        self.collectionView.isDragging == true ||
        self.collectionView.isDecelerating  == true ||
          self.collectionView.isTracking == true || self.isScrollAnimated == true
      else {
        self.spinner.stopAnimating()
        let oldContentOffset = self.collectionView.contentOffset
        self.collectionView.reloadData()
        self.collectionView.setContentOffset(oldContentOffset, animated: false)
        self.shouldReloadWhenAnimationStop = false
        return
    }

    self.shouldReloadWhenAnimationStop = true
    self.updateSpinnerFrame()
    self.spinner.startAnimating()
  }
}

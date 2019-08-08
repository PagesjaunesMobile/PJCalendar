//
//  DaySelectorCollectionView.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 30/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

struct DayModel {
  let dayText: String
  let dayNumber: String
}


class PaginableView: UIView, UIScrollViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

    guard let collectionView = scrollView as? UICollectionView else { return }

    guard let attribute0 = collectionView.collectionViewLayout.layoutAttributesForItem(at: IndexPath(item: 0, section: 0)) else { return }
    guard let attribute1 = collectionView.collectionViewLayout.layoutAttributesForItem(at: IndexPath(item: 1, section: 0)) else { return }

    let itemSpace: CGFloat = attribute1.frame.origin.x - attribute0.frame.origin.x

    let offset: CGFloat

    let precisePage = targetContentOffset.pointee.x / itemSpace
    let page: Int
    if precisePage.truncatingRemainder(dividingBy: 1.0) < 0.5 {
      page = Int(floor(targetContentOffset.pointee.x / itemSpace))
    } else {
      page = Int(ceil(targetContentOffset.pointee.x / itemSpace))
    }
    offset = (CGFloat(page) * itemSpace)

    targetContentOffset.pointee = CGPoint(x: offset , y:  targetContentOffset.pointee.y)
  }
}

class DaySelectorView: PaginableView {

  var index: CGFloat = 0

  let glassView: UIView = {
    let dest = UIView()
    dest.translatesAutoresizingMaskIntoConstraints = false
    dest.backgroundColor = UIColor.blue
    dest.layer.cornerRadius = 7.0

    return dest
  }()

  let days: [DayModel] = {
    return [
      DayModel(dayText: "ven.", dayNumber: "23"),
      DayModel(dayText: "sam.", dayNumber: "24"),
      DayModel(dayText: "dim.", dayNumber: "25"),
      DayModel(dayText: "lun.", dayNumber: "26"),
      DayModel(dayText: "mar.", dayNumber: "27"),
      DayModel(dayText: "ven.", dayNumber: "23"),
      DayModel(dayText: "sam.", dayNumber: "24"),
      DayModel(dayText: "dim.", dayNumber: "25"),
      DayModel(dayText: "lun.", dayNumber: "26"),
      DayModel(dayText: "mar.", dayNumber: "27"),
      DayModel(dayText: "ven.", dayNumber: "23"),
      DayModel(dayText: "sam.", dayNumber: "24"),
      DayModel(dayText: "dim.", dayNumber: "25"),
      DayModel(dayText: "lun.", dayNumber: "26"),
      DayModel(dayText: "mar.", dayNumber: "27"),
      DayModel(dayText: "ven.", dayNumber: "23"),
      DayModel(dayText: "sam.", dayNumber: "24"),
      DayModel(dayText: "dim.", dayNumber: "25"),
      DayModel(dayText: "lun.", dayNumber: "26"),
      DayModel(dayText: "mar.", dayNumber: "27"),
    ]
  }()

  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumInteritemSpacing = 8

    let dest = UICollectionView(frame: .zero, collectionViewLayout: layout)
    dest.backgroundColor = UIColor.clear
    dest.translatesAutoresizingMaskIntoConstraints = false

    dest.isPagingEnabled = false
    return dest
  }()

  func setupCollectionView() {
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    self.collectionView.register(DaySelectorCell.self, forCellWithReuseIdentifier: DaySelectorCell.reeuseIdentier)
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
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupCollectionView()
  }
}

extension DaySelectorView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.days.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DaySelectorCell.reeuseIdentier, for: indexPath)
    guard let castedCell = cell as? DaySelectorCell else { return cell }
    castedCell.configure(self.days[indexPath.item])
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


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

class DaySelectorCell: UICollectionViewCell {

  let dayTextLabel: UILabel = {
    let dest = UILabel()
    dest.textColor = UIColor.red
    dest.textAlignment = NSTextAlignment.center
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let dayNumberLabel: UILabel = {
    let dest = UILabel()
    dest.textColor = UIColor.red
    dest.textAlignment = NSTextAlignment.center
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    // dayTextLabel
    constraints.append(self.dayTextLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor))
    constraints.append(self.dayTextLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor))
    constraints.append(self.dayTextLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor))

    // dayNumberLabel
    constraints.append(self.dayNumberLabel.topAnchor.constraint(equalTo: self.dayTextLabel.bottomAnchor))
    constraints.append(self.dayNumberLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor))
    constraints.append(self.dayNumberLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor))
    constraints.append(self.dayNumberLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  func setupView() {
    self.contentView.addSubview(self.dayTextLabel)
    self.contentView.addSubview(self.dayNumberLabel)

    self.dayTextLabel.font = UIFont.systemFont(ofSize: 17)
    self.dayNumberLabel.font = UIFont.systemFont(ofSize: 32)
  }

  func configure(_ model: DayModel) {
    self.dayTextLabel.text = model.dayText
    self.dayNumberLabel.text = model.dayNumber
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

class DaySelectorView: UIView {

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
    self.collectionView.register(DaySelectorCell.self, forCellWithReuseIdentifier: "DaySelectorCell")
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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaySelectorCell", for: indexPath) as! DaySelectorCell
    cell.configure(self.days[indexPath.item])
    return cell
  }

}

extension DaySelectorView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

  }
}

extension DaySelectorView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

    let size = ((collectionView.frame.size.width / 2.0) - 36)

    return UIEdgeInsets(top: 0, left: size, bottom: 0, right: size)


  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: 72, height: 56)
  }
}

extension DaySelectorView: UIScrollViewDelegate {

  func snapToCenter() {
    let centerPoint = self.convert(self.center, to: collectionView)
    guard let centerIndexPath = collectionView.indexPathForItem(at: centerPoint) else
    {
      print("pas d'index")

      var distance: CGFloat = CGFloat.greatestFiniteMagnitude
      var destCell: UICollectionViewCell? = nil

      for aCell in collectionView.visibleCells {
        if abs(aCell.center.x - centerPoint.x) < distance {
          distance = abs(aCell.center.x - centerPoint.x)
          destCell = aCell
        }
      }

      if let destCell = destCell, let indexPath = collectionView.indexPath(for: destCell) {
        print("sauvé :)")
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
      }
      return
    }
    collectionView.scrollToItem(at: centerIndexPath, at: .centeredHorizontally, animated: true)
  }


  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    snapToCenter()
  }


  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    self.snapToCenter()
    }


//  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//    if velocity.x > 0.5 {
//      self.index += 1
//      targetContentOffset.pointee =  CGPoint(x: 82.0 * self.index, y: targetContentOffset.pointee.y)
//    } else if velocity.x < -0.5 {
//      self.index -= 1
//      targetContentOffset.pointee =  CGPoint(x: 82.0 * self.index, y: targetContentOffset.pointee.y)
//    }
//    print("Will End")
//  }

}

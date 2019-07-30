//
//  CalendarViewController.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 25/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class CalendarFlowLayout: UICollectionViewFlowLayout {

  var headerHeight: CGFloat = HeaderCell.hearderheight

  var header: UICollectionReusableView? = nil

  override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    let dest = super.layoutAttributesForSupplementaryView(ofKind: elementKind, at: indexPath)

    if let myFrame = self.collectionView?.frame, let contentOffset = self.collectionView?.contentOffset {

      if contentOffset.y > 0 {

        let avancement = contentOffset.y / (myFrame.size.height / 3.0)

        if HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight) > 167 {
          dest?.frame = CGRect(x: 0, y: contentOffset.y, width: myFrame.size.width, height: HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight))
          self.headerHeight = (HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight))
        } else {
          dest?.frame = CGRect(x: 0, y: contentOffset.y, width: myFrame.size.width, height: 167)
        }
        print("Content Offset -> \(contentOffset.y)")
        print("Avancement -> \(avancement)")
        print("size -> \(HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight))")
      }
    }

    return dest
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let dest = super.layoutAttributesForElements(in: rect)

    if let myFrame = self.collectionView?.frame, let contentOffset = self.collectionView?.contentOffset {
      dest?.filter { $0.representedElementKind == UICollectionView.elementKindSectionHeader }.forEach {

        let avancement = contentOffset.y / (myFrame.size.height / 3.0)

        print("avancement -> \(avancement)")

        if contentOffset.y > 0 {
          if HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight) > 167 {
          $0.frame = CGRect(x: 0, y: contentOffset.y, width: myFrame.size.width, height: HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight))
            self.headerHeight = (HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight))
          } else {
            $0.frame = CGRect(x: 0, y: contentOffset.y, width: myFrame.size.width, height: 167)
          }
        }
      }
    }
    return dest
  }
}

class CalendarViewController: UIViewController {

  let collectionView: UICollectionView = {

    let layout = CalendarFlowLayout()

    layout.headerReferenceSize = CGSize(width: HeaderCell.hearderheight, height: HeaderCell.hearderheight)

    layout.sectionHeadersPinToVisibleBounds = true


    let dest = UICollectionView(frame: .zero, collectionViewLayout: layout)
    dest.translatesAutoresizingMaskIntoConstraints = false

    dest.clipsToBounds = true

    return dest
  }()

  func setupCollectionView() {

    self.collectionView.backgroundColor = UIColor.black
    self.collectionView.isOpaque = true
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
    self.collectionView.register(DummyCell.self, forCellWithReuseIdentifier: "DummyCell")
    self.collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.collectionView)

    //self.collectionView.contentInsetAdjustmentBehavior = .never

    self.setupCollectionView()

    var constraints = [NSLayoutConstraint]()

    constraints.append(self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor))

    constraints.append(self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor))

    constraints.append(self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor))

    constraints.append(self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor))

    NSLayoutConstraint.activate(constraints)
  }

}


extension CalendarViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

  }
}

extension CalendarViewController: UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2000
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let dest = collectionView.dequeueReusableCell(withReuseIdentifier: "DummyCell", for: indexPath)

    return dest
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

    let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell", for: indexPath)

    return header

  }

}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
  //  func collectionView(_ collectionView: UICollectionView,
  //                      layout collectionViewLayout: UICollectionViewLayout,
  //                      referenceSizeForHeaderInSection section: Int) -> CGSize {
  //    print("referenceSizeForHeaderInSection")
  //    return CGSize(width: 80, height: 80)
  //  }


  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 50, height: 50)
  }


}


//
//  CalendarViewController.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 25/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit


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
    self.collectionView.register(DummyCell.self,
                                 forCellWithReuseIdentifier: DummyCell.reusueIdentifier)
    self.collectionView.register(HeaderCell.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: HeaderCell.reusueIdentifier)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.collectionView)

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
    let dest = collectionView.dequeueReusableCell(withReuseIdentifier: DummyCell.reusueIdentifier, for: indexPath)

    return dest
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                           withReuseIdentifier: HeaderCell.reusueIdentifier, for: indexPath)
  }
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return DummyCell.cellSize
  }


}


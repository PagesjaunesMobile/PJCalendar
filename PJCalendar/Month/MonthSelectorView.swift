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

  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
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

    constraints.append(self.rightButton.rightAnchor.constraint(equalTo: self.rightButton.rightAnchor, constant: -5))
    constraints.append(self.rightButton.centerYAnchor.constraint(equalTo: self.centerYAnchor))

    constraints.append(self.collectionView.topAnchor.constraint(equalTo: self.topAnchor))
    constraints.append(self.collectionView.leftAnchor.constraint(equalTo: self.leftButton.rightAnchor, constant: 5))
    constraints.append(self.collectionView.rightAnchor.constraint(equalTo: self.rightButton.leftAnchor, constant: 5))
    constraints.append(self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  func setupCollectionView() {
    self.collectionView.register(MonthCell.self, forCellWithReuseIdentifier: MonthCell.reuseCellIdentifier)
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
  }

  func setupView() {
    self.addSubview(self.leftButton)
    self.addSubview(self.rightButton)
    self.addSubview(self.collectionView)
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupCollectionView()
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


extension MonthSelectorView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

  }
}

extension MonthSelectorView: UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.viewModel.monthsCount
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }

}

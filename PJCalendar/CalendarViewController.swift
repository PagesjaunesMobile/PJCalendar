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

  init(dataController: CalendarDataController) {
    self.dataController = dataController
    self.dayListViewModel = DayListViewModel(dataController: dataController)
    self.monthListViewModel = MonthListViewModel(dataController: dataController)
    self.slotListViewModel = TimeSlotListViewModel(dataController: dataController)

    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let dataController: CalendarDataController

  let dayListViewModel: DayListViewModel
  let monthListViewModel: MonthListViewModel
  let slotListViewModel: TimeSlotListViewModel

  let collectionView: UICollectionView = {

    let layout = NewCalendarFlowLayout()

    let dest = UICollectionView(frame: .zero, collectionViewLayout: layout)
    dest.translatesAutoresizingMaskIntoConstraints = false

    dest.clipsToBounds = true
    return dest
  }()

  func setupCollectionView() {
    self.collectionView.isOpaque = true
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
    self.collectionView.contentInsetAdjustmentBehavior = .never
    
    self.collectionView.register(SlotCell.self,
                                 forCellWithReuseIdentifier: SlotCell.reusueCellIdentifier)
    
    self.collectionView.register(HeaderCell.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: HeaderCell.reusueCellIdentifier)

    self.collectionView.register(SlotHeaderCell.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: SlotHeaderCell.reusueCellIdentifier)
  }

  func setupDataController() {
    self.dataController.loadData()
  }

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor))
    constraints.append(self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor))
    constraints.append(self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor))
    constraints.append(self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  func setupView() {
    self.view.addSubview(self.collectionView)
  }

  func setupViewModel() {
    self.slotListViewModel.shouldDisplaySLots.bind { [weak self] _, result in
      guard let `self` = self else { return }
      if result == true {
        self.collectionView.reloadData()
      }
    }
    self.slotListViewModel.delegate = self
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupCollectionView()
    self.setupViewModel()
    self.setupDataController()
    self.setupStyle()
  }

  func setupStyle() {
    self.view.backgroundColor = UIColor.white
    self.collectionView.backgroundColor = UIColor.white
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.setup()
  }
}

extension CalendarViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

  }
}

extension CalendarViewController: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return self.slotListViewModel.sectionCount
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return 0
    } else {
      return self.slotListViewModel.itemCount
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let dequeueCell = collectionView.dequeueReusableCell(withReuseIdentifier: SlotCell.reusueCellIdentifier, for: indexPath)

    guard indexPath.section == 1 else {
      return dequeueCell
    }

    guard let dest = dequeueCell as? SlotCell else {
        return dequeueCell
    }
    
    guard let model = self.slotListViewModel[indexPath.item] else { return dequeueCell }
    dest.configure(model: model)

    return dest
  }


  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

    if indexPath.section == 0 {
        let hederView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                               withReuseIdentifier: HeaderCell.reusueCellIdentifier, for: indexPath)
      guard let castedHeaderView = hederView as? HeaderCell else { return hederView }
      castedHeaderView.configure(monthListViewModel: self.monthListViewModel, dayListViewModel: self.dayListViewModel)
      return castedHeaderView
    } else {
      let headerCellView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SlotHeaderCell.reusueCellIdentifier, for: indexPath)
      guard let castedHeaderCellView = headerCellView as? SlotHeaderCell else { return headerCellView }
      castedHeaderCellView.configure(viewModel: self.slotListViewModel)
      return castedHeaderCellView
    }
  }
}

extension CalendarViewController: TimeSlotListViewModelDelegate {
  func reloadSlots() {
    let oldContentOffset = self.collectionView.contentOffset
    self.collectionView.reloadData()
    self.collectionView.setCollectionViewLayout(NewCalendarFlowLayout(), animated: false) { _ in
      if oldContentOffset.y + self.collectionView.frame.size.height > self.collectionView.contentSize.height {
        self.collectionView.contentOffset = CGPoint(x: 0, y: self.collectionView.contentSize.height - self.collectionView.frame.size.height)
      } else {
        self.collectionView.contentOffset = oldContentOffset
      }
    }
  }
}

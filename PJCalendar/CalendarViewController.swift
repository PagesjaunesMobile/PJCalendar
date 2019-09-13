//
//  CalendarViewController.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 25/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

protocol CalendarViewControllerDelegate: class {
  func calendar(_ calendar: CalendarViewController, didTapOnCancelButton button: UIButton)
  func calendar(_ calendar: CalendarViewController, didSelectDate selectedDate: Date, andCode code: String)
}

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

  weak var delegate: CalendarViewControllerDelegate? = nil

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

  let spinner: UIActivityIndicatorView = {
    let dest = UIActivityIndicatorView(style: .gray)
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let cancelButton: UIButton = {
    let dest = UIButton(frame: .zero)
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  let okButton: UIButton = {
    let dest = UIButton(frame: .zero)
    dest.translatesAutoresizingMaskIntoConstraints = false
    return dest
  }()

  func setupCollectionView() {
    self.collectionView.isOpaque = true
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
    self.collectionView.contentInsetAdjustmentBehavior = .never
    self.collectionView.showsHorizontalScrollIndicator = false
    self.collectionView.showsVerticalScrollIndicator = false
    
    self.collectionView.register(SlotCell.self,
                                 forCellWithReuseIdentifier: SlotCell.reusueCellIdentifier)
    
    self.collectionView.register(HeaderCell.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: HeaderCell.reusueCellIdentifier)

    self.collectionView.register(SlotHeaderCell.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: SlotHeaderCell.reusueCellIdentifier)

    self.collectionView.register(NoSlotCell.self, forCellWithReuseIdentifier: NoSlotCell.reusueCellIdentifier)
  }

  func displayErrorMessage() {
    let alert = UIAlertController(title: "Oups !",
                                  message: "Une erreur technique est survenue.\nVeuillez réessayer.",
                                  preferredStyle: UIAlertController.Style.alert)

    let retry = UIAlertAction(title: "Réessayer", style: .default) { _ in
      self.dataController.loadData()
    }

    let cancel = UIAlertAction(title: "Fermer", style: .cancel, handler: nil)

    alert.addAction(retry)
    alert.addAction(cancel)

    self.present(alert, animated: true, completion: nil)

  }

  func displayNoSlotMessage() {
    let alert = UIAlertController(title: "Oups !",
                                  message: "Aucun créneau disponible.",
                                  preferredStyle: UIAlertController.Style.alert)


    let cancel = UIAlertAction(title: "Fermer", style: .cancel, handler: nil)

    alert.addAction(cancel)

    self.present(alert, animated: true, completion: nil)
  }

  func setupDataController() {
    self.dataController.loadData()

    self.collectionView.alpha = 0.0
    self.spinner.startAnimating()

    self.dataController.initialLoadingState.bind { [weak self] (_, newValue) in
      guard let `self` = self else { return }
      switch newValue {
      case .error:
        self.displayErrorMessage()
      case .loading:
        break
      case .noResult:
        self.displayNoSlotMessage()
      case .ready:
        self.spinner.stopAnimating()
        UIView.animate(withDuration: 0.35, animations: { self.collectionView.alpha = 1.0 } )
      }
    }

  }

  func setupLayout() {
    var constraints = [NSLayoutConstraint]()

    constraints.append(self.spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
    constraints.append(self.spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor))

    constraints.append(self.cancelButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16))
    constraints.append(self.cancelButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0))

    constraints.append(self.okButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16))
    constraints.append(self.okButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0))

    constraints.append(self.collectionView.topAnchor.constraint(equalTo: okButton.bottomAnchor))
    constraints.append(self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor))
    constraints.append(self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor))
    constraints.append(self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor))

    NSLayoutConstraint.activate(constraints)
  }

  func setupView() {
    self.view.addSubview(self.collectionView)
    self.view.addSubview(self.spinner)
    self.view.addSubview(self.okButton)
    self.view.addSubview(self.cancelButton)
  }

  func setupViewModel() {
    self.slotListViewModel.delegate = self
  }

  func setupSpinner() {
    self.spinner.hidesWhenStopped = true
  }

  @objc func userDidTouchCancelButton() {
    self.delegate?.calendar(self, didTapOnCancelButton: self.okButton)
  }

  @objc func userDidTouchOkButton() {
    guard let slot = self.dataController.selectedSlotModel else { return }
    self.delegate?.calendar(self, didSelectDate: slot.originalDate, andCode: slot.hcode)
  }

  func setupButtons() {
    self.cancelButton.setTitleColor(UIColor.bluePJ(), for: UIControl.State.normal)
    self.okButton.setTitleColor(UIColor.bluePJ(), for: UIControl.State.normal)
    self.cancelButton.setTitle("Annuler", for: UIControl.State.normal)
    self.okButton.setTitle("OK", for: UIControl.State.normal)
    self.okButton.addTarget(self, action: #selector(userDidTouchOkButton), for: .touchUpInside)
    self.cancelButton.addTarget(self, action: #selector(userDidTouchCancelButton), for: .touchUpInside)
  }

  func setup() {
    self.setupView()
    self.setupLayout()
    self.setupSpinner()
    self.setupCollectionView()
    self.setupViewModel()
    self.setupDataController()
    self.setupStyle()
    self.setupButtons()
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
    self.slotListViewModel.userDidSelectSlot(slotIndexPath: indexPath)
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

    guard self.slotListViewModel.shouldDisplayNoSlotCell == false  else {
      let dequeueCell = collectionView.dequeueReusableCell(withReuseIdentifier: NoSlotCell.reusueCellIdentifier, for: indexPath)
      guard let castedCell = dequeueCell as? NoSlotCell else { return dequeueCell }
      guard let model = self.slotListViewModel.noSlotModel else { return dequeueCell }

      castedCell.configure(viewModel: model)
      return castedCell
    }

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

extension CalendarViewController: NewCalendarFlowLayoutDelegate {
  var shouldDisplayNoSlot: Bool {
    return self.slotListViewModel.shouldDisplayNoSlotCell
  }
}

//
//  ViewController.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 25/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


  var calendar: CalendarViewController?


  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
//  }
//
//  override func viewDidLoad() {
//    super.viewDidLoad()

    let apiService = RdvApiService()
    let dataController = CalendarDataController(apiService: apiService)
    let calendar = CalendarViewController(dataController: dataController)

    calendar.modalPresentationStyle = .pageSheet

    self.calendar = calendar

//    self.addChild(calendar)
//    self.view.addSubview(calendar.view)
//
//    calendar.view.translatesAutoresizingMaskIntoConstraints = false
//
//    var constraints = [NSLayoutConstraint]()
//
//    constraints.append(calendar.view.topAnchor.constraint(equalTo: self.view.topAnchor))
//    constraints.append(calendar.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor))
//    constraints.append(calendar.view.leftAnchor.constraint(equalTo: self.view.leftAnchor))
//    constraints.append(calendar.view.rightAnchor.constraint(equalTo: self.view.rightAnchor))
//
//    NSLayoutConstraint.activate(constraints)
//
//    calendar.didMove(toParent: self)

//    self.show(calendar, sender: self)
    self.present(calendar, animated: true, completion: nil)
  }




}


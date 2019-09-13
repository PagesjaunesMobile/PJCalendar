//
//  ViewController.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 25/07/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import UIKit

extension ViewController: CalendarViewControllerDelegate {
  func calendar(_ calendar: CalendarViewController, didTapOnCancelButton button: UIButton) {
    calendar.dismiss(animated: true, completion: nil)
  }

  func calendar(_ calendar: CalendarViewController, didSelectDate selectedDate: Date, andCode code: String) {
    print("SELECTED DATE -> \(selectedDate) code -> \(code)")
  }

}

class ViewController: UIViewController {


  var calendar: CalendarViewController?


  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    let apiService = RdvApiService()
    let dataController = CalendarDataController(apiService: apiService)
    let calendar = CalendarViewController(dataController: dataController)
    calendar.delegate = self

   
    self.calendar = calendar
    calendar.presentCalendarOn(viewController: self)
  }




}


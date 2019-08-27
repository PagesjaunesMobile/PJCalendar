//
//  RdvApiModel.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 19/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

struct SlotApiModel {
  let htext: String
  let hcode: String
}

struct RdvApiModel {
  let dtext: String
  let dcode: String?
  let slots: [SlotApiModel]

  let monthText: String
  let dayText: String
  let yearText: String
  let shortDayText: String
  let dayNumberText: String



  init?(dtext: String, dcode: String? = nil, slots: [SlotApiModel]? = nil) {
    self.dtext = dtext
    self.dcode = dcode

    let dateFormater = DateFormatter()

    dateFormater.dateFormat = "EEEE d MMMM yyyy"
    dateFormater.locale = Locale(identifier: "fr_FR")

    guard let date = dateFormater.date(from: dtext) else { return nil }

    dateFormater.dateFormat = "MMMM"
    self.monthText = dateFormater.string(from: date)

    dateFormater.dateFormat = "EEEE"
    self.dayText = dateFormater.string(from: date)

    dateFormater.dateFormat = "yyyy"
    self.yearText = dateFormater.string(from: date)

    dateFormater.dateFormat = "d"
    self.dayNumberText = dateFormater.string(from: date)

    dateFormater.dateFormat = "E"
    self.shortDayText = dateFormater.string(from: date)

    self.slots = slots ?? []

    guard
      self.yearText.isEmpty == false,
      self.dayText.isEmpty == false,
      self.monthText.isEmpty == false,
      self.dayNumberText.isEmpty == false, self.shortDayText.isEmpty else { return nil }

  }

}

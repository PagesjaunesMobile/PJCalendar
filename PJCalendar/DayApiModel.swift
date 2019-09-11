//
//  DayApiModel.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 19/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation

extension SlotApiModel {
  static func ==(lhrs: SlotApiModel, rhs: SlotApiModel) -> Bool {
    return lhrs.hcode == rhs.hcode
  }
}

struct SlotApiModel: Equatable {
  let htext: String
  let hcode: String
  let isAfterNoon: Bool

  init(htext: String, hcode: String) {
    self.hcode = hcode
    self.htext = htext

    if let dest = self.htext.lowercased().split(separator: "h").first, let intValue = Int(String(dest).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)), intValue >= 15 {
      self.isAfterNoon = true
    } else {
      self.isAfterNoon = false
    }
  }
}

extension DayApiModel: Equatable {
  static func == (lhs: DayApiModel, rhs: DayApiModel) -> Bool {
    if lhs.realDate == rhs.realDate { return true }
    return false
  }
}

extension DayApiModel: Comparable {
  static func < (lhs: DayApiModel, rhs: DayApiModel) -> Bool {
    return lhs.realDate < rhs.realDate
  }
}

extension DayApiModel: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.realDate)
  }
}

struct DayApiModel {
  let dtext: String
  let dcode: String?
  var slots: [SlotApiModel]

  let monthText: String
  let dayText: String
  let yearText: String
  let shortDayText: String
  let dayNumberText: String

  let realDate: Date

  init?(dtext: String, dcode: String? = nil, slots: [SlotApiModel]? = nil) {
    self.dtext = dtext
    self.dcode = dcode

    let dateFormater = DateFormatter()

    dateFormater.dateFormat = "EEEE d MMMM yyyy"
    dateFormater.locale = Locale(identifier: "fr_FR")

    guard let date = dateFormater.date(from: dtext) else { return nil }

    self.realDate = date

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
      self.dayNumberText.isEmpty == false,
      self.shortDayText.isEmpty == false else { return nil }
  }

}

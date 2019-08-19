/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

@available(iOS 10.0, *)
extension StargateClient {
  struct CIMobKit {
    static let token = "LastToken" // use legacyToken
    static let appUUID = "PJ_APP_UUID" // use legacyAppUUID
    static let sessionID = "LastSessionId" // use legacySessionID
  }
}


@available(iOS 10.0, *)
extension UserDefaults {
  public var stargateToken : String {
    get {
      if oldTokenDate > stargateTokenDate {
        if let val = string(forKey: StargateClient.CIMobKit.token) {
          return val
        }
      } else if stargateTokenDate > oldTokenDate {
        if let val = string(forKey: #function) {
          return val
        }
      }
      return StargateClient.Constant.invalidToken
    }
    set {
      stargateTokenDate = Date()
      set(newValue, forKey: #function)
      set(newValue, forKey: StargateClient.CIMobKit.token)
      self.synchronize()
    }
  }
  static var oldDate : Date = Calendar.current.date(byAdding: .month, value: -3, to: Date())!
  
  public var stargateTokenDate : Date {
    get {
      guard let date = object(forKey: #function) as? NSDate else { return UserDefaults.oldDate }
      return date as Date
    }
    set {
      set(newValue as NSDate, forKey: #function)
      self.synchronize()
    }
  }
  
  public var oldTokenDate : Date {
    get {
      guard let date = object(forKey: #function) as? NSDate else { return UserDefaults.oldDate }
      return date as Date
    }
    set {
      set(newValue as NSDate, forKey: #function)
      self.synchronize()
    }
  }
  
  
  var stargateUUID : String {
    get {
      if let val = string(forKey: #function) { return val }
      if let val = string(forKey: StargateClient.CIMobKit.appUUID) { return val }
      return UUID().uuidString
    }
    set {
      set(newValue, forKey: #function)
      set(newValue, forKey: StargateClient.CIMobKit.appUUID)
      self.synchronize()
    }
  }
  
  var stargateSessionID : String? {
    get {
      if let val = string(forKey: #function) { return val }
      if let val = string(forKey: StargateClient.CIMobKit.sessionID) { return val }
      return nil
    }
    set {
      set(newValue, forKey: #function)
      set(newValue, forKey: StargateClient.CIMobKit.sessionID)
      self.synchronize()
    }
  }
}

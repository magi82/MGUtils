//
//  Date+extension.swift
//  MGUtils
//
//  Created by 황병국 on 12/06/2017.
//  Copyright © 2017 magi. All rights reserved.
//

import Foundation

// MARK: - Date

extension Date {
  // MARK: D-Day
  public func dateConversionDay(_ dateString: String) -> Int? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let serverDate = formatter.date(from: dateString) else { return nil }
    guard let currentDate = formatter.date(from: formatter.string(from: self)) else { return nil }
    
    let components = Calendar.current.dateComponents([.day], from: serverDate, to: currentDate)
    
    return components.day
  }
  
  // MARK: sec to time
  public static func secToHour(_ sec: Int) -> Int {
    return sec / 3600
  }
  
  public static func secToMin(_ sec: Int) -> Int {
    return (sec % 3600) / 60
  }
  
  public static func secToSec(_ sec: Int) -> Int {
    return sec % 60
  }
  
  public static func subSecFromDate(_ endDate: String) -> Int {
    var value: Int = 0
    var date: Date? = nil
    let df: DateFormatter = DateFormatter()
    
    df.dateFormat = "yyyy-MM-dd"
    date = df.date(from: endDate)
    if date == nil {
      df.dateFormat = "yyyy-MM-dd HH:mm:ss"
      date = df.date(from: endDate)
    }
    
    if let date = date {
      let currentSec = Date().timeIntervalSince1970
      let lastSec = date.timeIntervalSince1970
      
      value = Int(lastSec - currentSec)
    }
    
    return value
  }
}

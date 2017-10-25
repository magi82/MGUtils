//
//  LocationUtils.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 9. 12..
//  Copyright © 2017년 apptube. All rights reserved.
//

import Foundation
import CoreLocation

typealias CoordClosure = (CLLocationCoordinate2D) -> Void

final class LocationUtils: NSObject, CLLocationManagerDelegate {
  
  static let sharedInstance = LocationUtils()
  
  static var shared: LocationUtils {
    return sharedInstance
  }
  
  private var locationManager: CLLocationManager? = nil
  private var coordinate: (CoordClosure)? = nil
  
  private var repeatFlag: Bool = false
  private var onceCoord: CLLocationCoordinate2D? = nil
  
  func update(isRepeat: Bool = false, coordinate: @escaping CoordClosure) {
    if locationManager == nil {
      locationManager = CLLocationManager()
      
      locationManager?.delegate = self
      locationManager?.requestWhenInUseAuthorization()
      locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    self.repeatFlag = isRepeat
    self.coordinate = coordinate
    self.onceCoord = nil
    locationManager?.startUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    let coord: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    self.coordinate!(coord)
    manager.stopUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if repeatFlag == false {
      if onceCoord == nil {
        if let coordinate = locations.first?.coordinate {
          onceCoord = coordinate
          self.coordinate!(coordinate)
          manager.stopUpdatingLocation()
        }
      }
    }
    else {
      if self.coordinate != nil, let coordinate = locations.first?.coordinate {
        self.coordinate!(coordinate)
      }
    }
  }
}

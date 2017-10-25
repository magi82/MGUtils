//
//  SwitchingViewContainer.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 29..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

public protocol Switchable {
  func swtiched(_ view: UIView?)
}

public class SwitchingViewContainer: NSObject {
  var views: [UIView]
  public var delegate: Switchable? = nil
  var index: Int
  
  public init(_ views: [UIView]) {
    self.views = views
    index = views.count - 1
  }
  
  public func next() {
    index = index + 1
    
    if index >= views.count {
      index = 0
    }
    
    delegate?.swtiched(views[index])
  }
}

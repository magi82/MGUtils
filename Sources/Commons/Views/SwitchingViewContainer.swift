//
//  SwitchingViewContainer.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 29..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

protocol Switchable {
  func swtiched(_ view: UIView?)
}

final class SwitchingViewContainer: NSObject {
  var views: [UIView]
  var delegate: Switchable? = nil
  var index: Int
  
  init(_ views: [UIView]) {
    self.views = views
    index = views.count - 1
  }
  
  func next() {
    index = index + 1
    
    if index >= views.count {
      index = 0
    }
    
    delegate?.swtiched(views[index])
  }
}
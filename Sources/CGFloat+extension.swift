//
//  CGFloat+extension.swift
//  MGUtils
//
//  Created by 황병국 on 12/06/2017.
//  Copyright © 2017 magi. All rights reserved.
//

import Foundation

extension CGFloat {
  public func DegToRad() -> CGFloat {
    return  self * .pi / 180
  }
  
  public func RadToDeg() -> CGFloat {
    return self * 180 / .pi
  }
}

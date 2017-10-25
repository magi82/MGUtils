//
//  MathUtils.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 28..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

/// Ceil to snap pixel
public func snap(_ x: CGFloat) -> CGFloat {
  let scale = UIScreen.main.scale
  return ceil(x * scale) / scale
}

public func snap(_ point: CGPoint) -> CGPoint {
  return CGPoint(x: snap(point.x), y: snap(point.y))
}

public func snap(_ size: CGSize) -> CGSize {
  return CGSize(width: snap(size.width), height: snap(size.height))
}

public func snap(_ rect: CGRect) -> CGRect {
  return CGRect(origin: snap(rect.origin), size: snap(rect.size))
}

public enum DecimalDigitType {
  case ceil(Int)
  case floor(Int)
  case round(Int)
}

protocol DecimalDigitCalculatable {
  associatedtype ReturnType
  func decimalDigit(type: DecimalDigitType) -> ReturnType
}

extension Double: DecimalDigitCalculatable {
  public typealias ReturnType = Double
  
  public func decimalDigit(type: DecimalDigitType) -> ReturnType {
    switch type {
    case let .ceil(digit):
      let divisor = pow(10.0, ReturnType(digit))
      return Darwin.ceil(self * divisor) / divisor
      
    case let .floor(digit):
      let divisor = pow(10.0, ReturnType(digit))
      return Darwin.floor(self * divisor) / divisor
      
      
    case let .round(digit):
      let divisor = pow(10.0, ReturnType(digit))
      return Darwin.round(self * divisor) / divisor
    }
  }
}

extension Float: DecimalDigitCalculatable {
  public typealias ReturnType = Float
  
  public func decimalDigit(type: DecimalDigitType) -> ReturnType {
    switch type {
    case let .ceil(digit):
      let divisor = pow(10.0, ReturnType(digit))
      return Darwin.ceil(self * divisor) / divisor
      
    case let .floor(digit):
      let divisor = pow(10.0, ReturnType(digit))
      return Darwin.floor(self * divisor) / divisor
      
      
    case let .round(digit):
      let divisor = pow(10.0, ReturnType(digit))
      return Darwin.round(self * divisor) / divisor
    }
  }
}


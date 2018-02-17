//
//  ViewBindableEx.swift
//  MGUtils
//
//  Created by ByungKook Hwang on 2018. 2. 17..
//  Copyright © 2018년 magi. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

public protocol ViewBindableEx {
  associatedtype Command
  associatedtype State
  
  var command: Command { get }
  var state: State { get }
}

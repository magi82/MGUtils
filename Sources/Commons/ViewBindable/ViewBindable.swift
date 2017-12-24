//
//  ViewBindable.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 22..
//  Copyright © 2017년 apptube. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

public protocol ViewBindable {
  associatedtype Command
  associatedtype Action
  associatedtype State
  
  var disposeBag: DisposeBag { get }
  var command: PublishSubject<Command> { get }
  var action: Action { get }
  var state: State { get }
  
  func commandBind()
}

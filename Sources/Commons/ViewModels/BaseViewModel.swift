//
//  BaseViewModel.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 22..
//  Copyright © 2017년 apptube. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

class BaseViewModel<T> {
  private(set) var state: PublishSubject<T> = PublishSubject<T>()
  
  func stateChanged(_ value: T) {
    self.state.onNext(value)
  }
}

protocol ViewBindable {
  associatedtype Command
  associatedtype Action
  associatedtype State
  
  var disposeBag: DisposeBag { get }
  var command: PublishSubject<Command> { get }
  var action: Action { get }
  var state: State { get }
  
  func commandBind()
}

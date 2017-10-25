//
//  CommonReactive.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 9. 21..
//  Copyright © 2017년 apptube. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

extension Reactive where Base: UIImageView {
  public var isHighlight: UIBindingObserver<Base, Bool> {
    return UIBindingObserver(UIElement: self.base) { view, highlight in
      view.isHighlighted = highlight
    }
  }
}

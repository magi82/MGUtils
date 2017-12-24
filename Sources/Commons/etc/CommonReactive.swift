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
  public var isHighlight: Binder<Bool> {
    return Binder(self.base) { view, highlight in
      view.isHighlighted = highlight
    }
  }
}

extension Reactive where Base: UIControl {
  public var tap: ControlEvent<Void> {
    return controlEvent(.touchUpInside)
  }
}

extension Reactive where Base: UICollectionViewFlowLayout {
  public var footerSize: Binder<CGSize> {
    return Binder(self.base) { view, size in
      view.footerReferenceSize = size
    }
  }
}

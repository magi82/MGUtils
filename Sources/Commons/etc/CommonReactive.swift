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

extension Reactive where Base: UIButton {
  public var selectedTitle: Binder<(title: String, selectedText: String)> {
    return Binder(self.base) { view, value in
      view.setTitle(value.title, for: .normal)
      view.isSelected = (value.title != value.selectedText)
      
    }
  }
}

extension Reactive where Base: UIViewController {
  
  public func popVC(animated: Bool = true) -> Binder<Void> {
    return Binder(self.base) { (view, _) -> () in
      view.navigationController?.popViewController(animated: animated)
    }
  }
  
  public func pushVC(animated: Bool = true) -> Binder<ProvideObjectProtocol> {
    return Binder(self.base) { (view, object) -> () in
      view.navigationController?.pushViewController(object.viewController, animated: animated)
    }
  }
  
  public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) -> Binder<Void> {
    return Binder(self.base) { (view, _) -> () in
      view.dismiss(animated: animated, completion: completion)
    }
  }
  
  public func present(animated: Bool = true, completion: (() -> Void)? = nil) -> Binder<ProvideObjectProtocol> {
    return Binder(self.base) { (view, object) -> () in
      view.present(object.viewController, animated: animated, completion: completion)
    }
  }
}

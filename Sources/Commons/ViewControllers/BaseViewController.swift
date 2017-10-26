//
//  BaseViewController.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 22..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

import RxSwift

open class BaseViewController: UIViewController {
  
  // MARK: Properties
  
  lazy private(set) var className: String = {
    return type(of: self).description().components(separatedBy: ".").last ?? ""
  }()
  public var disposeBag = DisposeBag()
  private(set) var didSetupConstraints = false
  private(set) var didSetupSubViews = false
  
  // MARK: Initializing
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    Log("DEINIT: \(self.className)")
  }
  
  open override func loadView() {
    super.loadView()
    
    #if true
      self.rx.methodInvoked(#selector(UIViewController.viewDidLoad))
        .subscribe(onNext: { [weak self] _ in
          // 상태 구독을 먼저 하고나서 액션을 해야 한다.
          self?.state()
          self?.command()
        })
        .disposed(by: self.disposeBag)
    #endif
  }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.setNeedsUpdateConstraints()
  }
  
  open override func updateViewConstraints() {
    if self.didSetupConstraints == false {
      self.setupConstraints()
      self.didSetupConstraints = true
    }
    super.updateViewConstraints()
  }
  
  open func setupConstraints() {}
  
  open override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    if self.didSetupSubViews == false {
      self.setupSubViews()
      self.didSetupSubViews = true
    }
  }
  
  open func setupSubViews() {}
}

// MARK: - mvvm method
#if true
  extension BaseViewController {
    open func command() {
      fatalError("command method has not been implemented => [\(self.className)]")
    }
    
    open func state() {
      fatalError("state method has not been implemented => [\(self.className)]")
    }
  }
#endif

// MARK: - Orientation

extension BaseViewController {
  open override var shouldAutorotate: Bool {
    return false
  }
  
  open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
}

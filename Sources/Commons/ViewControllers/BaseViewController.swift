//
//  BaseViewController.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 22..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

import RxSwift

class BaseViewController: UIViewController {
  
  // MARK: Properties
  
  lazy private(set) var className: String = {
    return type(of: self).description().components(separatedBy: ".").last ?? ""
  }()
  var disposeBag = DisposeBag()
  private(set) var didSetupConstraints = false
  private(set) var didSetupSubViews = false
  
  // MARK: Initializing
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    Log("DEINIT: \(self.className)")
  }
  
  override func loadView() {
    super.loadView()
    
#if false
    self.rx.methodInvoked(#selector(UIViewController.viewDidLoad))
      .subscribe(onNext: { [weak self] _ in
        // 상태 구독을 먼저 하고나서 액션을 해야 한다.
        self?.state()
        self?.action()
      })
      .disposed(by: self.disposeBag)
#endif
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.setNeedsUpdateConstraints()
  }
  
  override func updateViewConstraints() {
    if self.didSetupConstraints == false {
      self.setupConstraints()
      self.didSetupConstraints = true
    }
    super.updateViewConstraints()
  }
  
  func setupConstraints() {}
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    if self.didSetupSubViews == false {
      self.setupSubViews()
      self.didSetupSubViews = true
    }
  }
  
  func setupSubViews() {}
}

// MARK: - mvvm method
#if false
extension BaseViewController {
  func action() {
    fatalError("action method has not been implemented => [\(self.className)]")
  }
  
  func state() {
    fatalError("state method has not been implemented => [\(self.className)]")
  }
}
#endif

// MARK: - Orientation

extension BaseViewController {
  override var shouldAutorotate: Bool {
    return false
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
}

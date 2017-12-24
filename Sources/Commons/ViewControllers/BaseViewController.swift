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
  
  // MARK: UI Properties
  
  public var backBarButtonImage: UIImage? = nil {
    didSet {
      self.customBackBarButtonItem(image: backBarButtonImage)
    }
  }
  
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
    
    // state subscribe 먼저 하고 나서 command를 해야 한다.
    // viewDidLoad가 되기전에 먼저 state와 command를 해야
    // viewDidLoad를 observable 할수 있다.
    self.state()
    self.command()
    
    //    self.rx.methodInvoked(#selector(UIViewController.viewDidLoad))
    //      .subscribe(onNext: { [weak self] _ in
    //
    //      })
    //      .disposed(by: self.disposeBag)
  }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.setNeedsUpdateConstraints()
    
    self.navigationController?.interactivePopGestureRecognizer?.delegate = self
  }
  
  open override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if let _ = backBarButtonImage {
      self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    else {
      self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
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
  
  open func command() {
    fatalError("command method has not been implemented => [\(self.className)]")
  }
  
  open func state() {
    fatalError("state method has not been implemented => [\(self.className)]")
  }
  
  private func customBackBarButtonItem(image: UIImage?) {
    let item = UIBarButtonItem(image: image?.withRenderingMode(.alwaysOriginal), style: .plain)
    
    self.navigationItem.leftBarButtonItem = item
    
    item.rx.tap
      .bind(onNext: { [weak self] in self?.navigationController?.popViewController(animated: true) })
      .disposed(by: self.disposeBag)
  }
}

// MARK: - Orientation

extension BaseViewController {
  open override var shouldAutorotate: Bool {
    return false
  }
  
  open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
}

// MARK: - UIGestureRecognizerDelegate

extension BaseViewController: UIGestureRecognizerDelegate {
  
}

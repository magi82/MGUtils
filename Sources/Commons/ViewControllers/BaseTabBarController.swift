//
//  BaseTabBarController.swift
//  Common
//
//  Created by Byung Kook Hwang on 07/10/2017.
//  Copyright © 2017 magi82. All rights reserved.
//

import UIKit

open class BaseTabBarController: UITabBarController {
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    configure()
  }
  
  open func configure() {
    // 탭바 투명도와 컬러
    tabBar.isTranslucent = false
    tabBar.barTintColor = UIColor(r: 239, g: 238, b: 238)
  }
}

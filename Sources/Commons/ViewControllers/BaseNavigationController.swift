//
//  BaseNavigationController.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 29..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

open class BaseNavigationController: UINavigationController {
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    configure()
  }
  
  open func configure() {
    // 네비게이션바 컬러
//    navigationBar.barTintColor = nil
//    navigationBar.isTranslucent = false
    
    // 탭바 이미지 위치를 수정 (타이틀을 사용하지 않고 이미지로 하면 세로 간격이 맞지 않아서 수정해야함)
//    tabBarItem.title = nil
//    tabBarItem.imageInsets.top = 5
//    tabBarItem.imageInsets.bottom = -5
  }
}

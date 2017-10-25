//
//  CommonEnum.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 23..
//  Copyright © 2017년 apptube. All rights reserved.
//

import Foundation

enum StringAsset: CustomStringConvertible {
  case loginSuccess
}

extension StringAsset {
  var description: String {
    switch self {
    case .loginSuccess:
      return "로그인 성공"
    }
  }
}

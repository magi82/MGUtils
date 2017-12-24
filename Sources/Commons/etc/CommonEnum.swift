//
//  CommonEnum.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 23..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

public enum StringAsset: CustomStringConvertible {
  case loginSuccess
}

extension StringAsset {
  public var description: String {
    switch self {
    case .loginSuccess:
      return "로그인 성공"
    }
  }
}

public enum FontName {
  case regular(CGFloat)
  case bold(CGFloat)
  case alphabet(CGFloat)
  case appleBold(CGFloat)
}

extension FontName {
  public var font: UIFont {
    switch self {
    case let .regular(size):
      return UIFont.systemFont(ofSize: size) // UIFont(name: "NanumGothicOTF", size: size)!
    case let .bold(size):
      return UIFont.boldSystemFont(ofSize: size) // UIFont(name: "NanumGothic", size: size)!
    case let .alphabet(size):
      return UIFont.systemFont(ofSize: size) // UIFont(name: "Helvetica Neue", size: size)!
    case let .appleBold(size):
      return UIFont.boldSystemFont(ofSize: size) // UIFont(name: "AppleSDGothicNeo-Bold", size: size)!
    }
  }
}

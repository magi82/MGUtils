//
//  CommonFunc.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 9. 21..
//  Copyright © 2017년 apptube. All rights reserved.
//

import Foundation

import ObjectMapper

public func ynTransform() -> TransformOf<Bool, String> {
  return TransformOf(fromJSON: { value -> Bool? in
    return value == "Y"
  }, toJSON: { value -> String? in
    return (value ?? false) ? "Y" : "N"
  })
}

public func Log(_ log: Any) {
#if DEBUG
  print(log)
#endif
}

public func isiPhoneXScreen() -> Bool {
  guard #available(iOS 11.0, *) else { return false }
  return UIApplication.shared.windows[0].safeAreaInsets != UIEdgeInsets.zero
}

public func openURL(url: URL) {
  if #available(iOS 10.0, *) {
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
  else {
    UIApplication.shared.openURL(url)
  }
}

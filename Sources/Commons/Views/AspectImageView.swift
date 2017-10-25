//
//  AspectImageView.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 9. 22..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

final class AspectImageView: UIImageView {

  override var intrinsicContentSize: CGSize {
    if let image = self.image {
      return CGSize(width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.width / image.size.width * image.size.height)
    }
    
    return .zero
  }
}

//
//  BaseCollectionViewCell.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 9. 21..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

open class BaseCollectionViewCell: UICollectionViewCell {
  
  open func configure() {
    self.setNeedsLayout()
  }
}

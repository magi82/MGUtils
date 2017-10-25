//
//  BaseTableViewCell.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 9. 20..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

open class BaseTableViewCell: UITableViewCell {
  
  open func configure() {
    self.setNeedsLayout()
  }
}

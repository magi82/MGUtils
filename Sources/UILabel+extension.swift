//
//  Date+extension.swift
//  MGUtils
//
//  Created by 황병국 on 12/06/2017.
//  Copyright © 2017 magi. All rights reserved.
//

import Foundation

// MARK: - Label 크기에 따른 폰트 크기 자동 변경

extension UILabel {
  public func autoResizeCalculator(lines: Int, minScale: CGFloat, align: NSTextAlignment) {
    self.adjustsFontSizeToFitWidth = true
    self.numberOfLines = lines
    self.minimumScaleFactor = minScale
    self.textAlignment = align
  }
}

//
//  String+extension.swift
//  MGUtils
//
//  Created by 황병국 on 12/06/2017.
//  Copyright © 2017 magi. All rights reserved.
//

import Foundation

// MARK: - 스트링 로컬라이제이션 적용

extension String {
  func localize() -> String {
    return NSLocalizedString(self, comment: self)
  }
}

// MARK: - 날짜 스트링 포멧 바꾸기

extension String {
  func changeDateFormat(input: String, output: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = input
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = output
    
    let date = inputFormatter.date(from: self)
    guard let value = date else { return self }
    
    return outputFormatter.string(from: value)
  }
}

// MARK: - 스트링 사이즈

extension String {
  func rect(font: UIFont) -> CGSize {
    let size = CGSize(width: CGFloat.greatestFiniteMagnitude,
                      height: CGFloat.greatestFiniteMagnitude)
    
    let attributes = [NSFontAttributeName: font]
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let rect = self.boundingRect(with: size,
                                 options: options,
                                 attributes: attributes,
                                 context: nil).size
    
    return snap(rect)
  }
  
  func width(font: UIFont) -> CGFloat {
    let size = CGSize(width: CGFloat.greatestFiniteMagnitude,
                      height: CGFloat.greatestFiniteMagnitude)
    
    let attributes = [NSFontAttributeName: font]
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let width = self.boundingRect(with: size,
                                  options: options,
                                  attributes: attributes,
                                  context: nil).size.width
    
    return snap(width)
  }
  
  func height(fitWidth width: CGFloat, font: UIFont) -> CGFloat {
    let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
    
    let attributes = [NSFontAttributeName: font]
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let height = self.boundingRect(with: size,
                                   options: options,
                                   attributes: attributes,
                                   context: nil).size.height
    
    return snap(height)
  }
}

// MARK: - 속성스트링 사이즈

extension String {
  private func makeAttrStringForSize(font: UIFont, iSpacingValue: CGFloat) -> NSMutableAttributedString {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = iSpacingValue
    let attr = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle]
    let attrString = NSMutableAttributedString(string: self, attributes: attr)
    
    return attrString
  }
  
  func rectAttr(font: UIFont, iSpacingValue: CGFloat = 0) -> CGSize {
    let size = CGSize(width: CGFloat.greatestFiniteMagnitude,
                      height: CGFloat.greatestFiniteMagnitude)
    
    let attrString = makeAttrStringForSize(font: font, iSpacingValue: iSpacingValue)
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let rect = attrString.boundingRect(with: size,
                                       options: options,
                                       context: nil).size
    
    return snap(rect)
  }
  
  func widthAttr(font: UIFont, iSpacingValue: CGFloat = 0) -> CGFloat {
    let size = CGSize(width: CGFloat.greatestFiniteMagnitude,
                      height: CGFloat.greatestFiniteMagnitude)
    
    let attrString = makeAttrStringForSize(font: font, iSpacingValue: iSpacingValue)
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let width = attrString.boundingRect(with: size,
                                        options: options,
                                        context: nil).size.width
    
    return snap(width)
  }
  
  func heightAttr(fitWidth width: CGFloat, font: UIFont, iSpacingValue: CGFloat = 0) -> CGFloat {
    let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
    
    let attrString = makeAttrStringForSize(font: font, iSpacingValue: iSpacingValue)
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let height = attrString.boundingRect(with: size,
                                         options: options,
                                         context: nil).size.height
    
    return snap(height)
  }
}

// MARK: - 속성스트링 라인 간격

extension String {
  func getLineSpacingString(_ iSpacingValue: CGFloat,
                            alignment: NSTextAlignment = .left) -> NSMutableAttributedString {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = iSpacingValue
    paragraphStyle.alignment = alignment
    let attrString = NSMutableAttributedString(string: self)
    attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
    
    return attrString
  }
}

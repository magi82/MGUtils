//
//  UIImage+extension.swift
//  MGUtils
//
//  Created by 황병국 on 12/06/2017.
//  Copyright © 2017 magi. All rights reserved.
//

import Foundation

// MARK: - UIImage 확장

extension UIImage {
  
  // MARK: UIColor로 UIImage 생성
  
  public class func imageWithColor(color: UIColor, size: CGSize) -> UIImage? {
    let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
      UIGraphicsEndImageContext()
      return nil
    }
    
    UIGraphicsEndImageContext()
    
    return image
  }
  
  // MARK: 이미지를 원으로
  
  public var circle: UIImage? {
    let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
    let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
    imageView.contentMode = .scaleAspectFill
    imageView.image = self
    imageView.layer.cornerRadius = square.width/2
    imageView.layer.masksToBounds = true
    UIGraphicsBeginImageContext(imageView.bounds.size)
    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    imageView.layer.render(in: context)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
  }
  
  // MARK: 이미지 스케일 줄이기
  public class func scaleImage(image: UIImage?, scale: CGFloat) -> UIImage? {
    guard let image = image else { return nil }
    let scaleSize: CGSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
    UIGraphicsBeginImageContextWithOptions(scaleSize, false, 0)
    image.draw(in: CGRect(origin: .zero, size: scaleSize))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
  }
}

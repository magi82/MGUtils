//
//  CommonExtension.swift
//  Common
//
//  Created by Byung Kook Hwang on 2017. 8. 23..
//  Copyright © 2017년 apptube. All rights reserved.
//

import UIKit

// MARK: - UIStoryboard

extension UIStoryboard {
  public class func create<T: UIViewController>(_: T.Type,
                                                name: String = "Main",
                                                bundle: Bundle? = nil,
                                                identifier: String? = nil) -> T {
    let storyboard = self.init(name: name, bundle: bundle)
    
    let withIdentifier = identifier ?? T.description().components(separatedBy: ".").last!
    return storyboard.instantiateViewController(withIdentifier: withIdentifier) as! T
  }
}

// MARK: - UIAlertController

extension UIAlertController {
  static func make(title: String? = nil,
                   message: String? = nil,
                   style: UIAlertControllerStyle,
                   ok: String? = nil,
                   okClosure: ((UIAlertAction) -> Void)? = nil,
                   cancel: String? = nil,
                   cancelClosure: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
    
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: style)
    
    if ok != nil {
      alert.addAction(UIAlertAction(title: ok, style: .default, handler: okClosure))
    }
    
    if cancel != nil {
      alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: cancelClosure))
    }
    
    return alert
  }
  
  func alertShow(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
    viewController.present(self, animated: animated, completion: completion)
  }
}

// MARK: - UIActivityIndicatorView

extension UIActivityIndicatorView {
  
  convenience init(activityIndicatorStyle style: UIActivityIndicatorViewStyle, scale: CGFloat) {
    self.init(activityIndicatorStyle: style)
    self.scale(scale)
  }
  
  func scale(_ value: CGFloat) {
    self.transform = CGAffineTransform(scaleX: value, y: value)
  }
}

// MARK: - UIBarButtonItem

extension UIBarButtonItem {
  convenience init(image: UIImage?, style: UIBarButtonItemStyle) {
    self.init(image: image, style: style, target: nil, action: nil)
  }
}

// MARK: - UISearchBar {

extension UISearchBar {
  var textField: UITextField? {
    return self.value(forKey: "searchField") as? UITextField
  }
  
  var textColor: UIColor {
    set {
      self.textField?.textColor = newValue
    }
    
    get {
      return self.textField?.textColor ?? .black
    }
  }
}

// MARK: - 스트링 로컬라이제이션 적용

extension String {
  var localize: String {
    return NSLocalizedString(self, comment: self)
  }
}

// MARK: - Dictionary

extension Dictionary {
  mutating func merge(dict: [Key: Value]) {
    for (key, value) in dict {
      updateValue(value, forKey: key)
    }
  }
}

// MARK: - UIColor 를 Hex String 변환

extension UIColor {
  convenience init(hex: String) {
    let hexStr:NSString = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased() as NSString
    let scan = Scanner(string: hexStr as String)
    
    if (hexStr.hasPrefix("#")) {
      scan.scanLocation = 1
    }
    
    var color:UInt32 = 0
    scan.scanHexInt32(&color)
    
    let mask = 0x000000FF
    let r = Int(color >> 16) & mask
    let g = Int(color >> 8) & mask
    let b = Int(color) & mask
    
    let red   = CGFloat(r) / 255.0
    let green = CGFloat(g) / 255.0
    let blue  = CGFloat(b) / 255.0
    
    self.init(red:red, green:green, blue:blue, alpha:1)
  }
  
  func toHexStr() -> String {
    var r:CGFloat = 0
    var g:CGFloat = 0
    var b:CGFloat = 0
    var a:CGFloat = 0
    
    getRed(&r, green: &g, blue: &b, alpha: &a)
    
    let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
    
    return NSString(format:"#%06x", rgb) as String
  }
  
  convenience init(r: Int, g: Int, b: Int, a: Int? = nil) {
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a ?? 1))
  }
}

// MARK: - UIImage 확장

extension UIImage {
  
  // MARK: UIColor로 UIImage 생성
  
  class func imageWithColor(color: UIColor, size: CGSize) -> UIImage? {
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
  
  var circle: UIImage? {
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
}

// MARK: - Label 크기에 따른 폰트 크기 자동 변경

extension UILabel {
  func autoResizeCalculator(lines: Int, minScale: CGFloat, align: NSTextAlignment) {
    self.adjustsFontSizeToFitWidth = true
    self.numberOfLines = lines
    self.minimumScaleFactor = minScale
    self.textAlignment = align
  }
}

// MARK: - D-Day

extension Date {
  func dateConversionDay(_ dateString: String) -> Int? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let serverDate = formatter.date(from: dateString) else { return nil }
    guard let currentDate = formatter.date(from: formatter.string(from: self)) else { return nil }
    
    let components = Calendar.current.dateComponents([.day], from: serverDate, to: currentDate)
    
    return components.day
  }
  
  static var currentMonth: Int {
    // 값이 nil 이면 1월 리턴
    let components = Calendar.current.dateComponents([.month], from: Date())
    return components.month ?? 1
  }
}

// MARK: - 스트링 사이즈

extension String {
  func Rect(font: UIFont) -> CGSize {
    let size = CGSize(width: CGFloat.greatestFiniteMagnitude,
                      height: CGFloat.greatestFiniteMagnitude)
    
    let attributes = [NSAttributedStringKey.font: font]
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
    
    let attributes = [NSAttributedStringKey.font: font]
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let width = self.boundingRect(with: size,
                                  options: options,
                                  attributes: attributes,
                                  context: nil).size.width
    
    return snap(width)
  }
  
  func height(fitWidth width: CGFloat, font: UIFont) -> CGFloat {
    let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
    
    let attributes = [NSAttributedStringKey.font: font]
    let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
    let height = self.boundingRect(with: size,
                                   options: options,
                                   attributes: attributes,
                                   context: nil).size.height
    
    return snap(height)
  }
}

extension CGFloat {
  func DegToRad() -> CGFloat {
    return  self * .pi / 180
  }
  
  func RadToDeg() -> CGFloat {
    return self * 180 / .pi
  }
}

// MARK: - UITabBarController

extension UITabBarController {
  open override var shouldAutorotate: Bool {
    if let vc = self.selectedViewController {
      return vc.shouldAutorotate
    }
    return false
  }
  
  open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if let vc = self.selectedViewController {
      return vc.supportedInterfaceOrientations
    }
    return .portrait
  }
}

// MARK: - UINavigationController

extension UINavigationController {
  open override var shouldAutorotate: Bool {
    if let vc = self.topViewController {
      return vc.shouldAutorotate
    }
    return false
  }
  
  open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if let vc = self.topViewController {
      return vc.supportedInterfaceOrientations
    }
    return .portrait
  }
}
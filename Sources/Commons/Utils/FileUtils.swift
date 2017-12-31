//
//  FileUtils.swift
//  wordbook
//
//  Created by ByungKook Hwang on 2017. 12. 31..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

public class FileUtils {
  
  // 문서 폴더에 파일이 있는지 체크 하는 함수
  public static func existFileAtDocumentPath(fileName: String,
                                      fullPath: inout String) -> Bool {
    
    if let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                              .userDomainMask, true).first {
      fullPath = (documentPath as NSString).appendingPathComponent(fileName)
      return FileManager.default.fileExists(atPath: fullPath)
    }
    
    return false
  }
  
  // 번들 폴더에 파일이 있는지 체크 하는 함수
  public static func existFileAtBundlePath(fileName: String,
                                    fullPath: inout String) -> Bool {
    
    fullPath = (Bundle.main.resourcePath! as NSString).appendingPathComponent(fileName)
    return FileManager.default.fileExists(atPath: fullPath)
  }
  
  // 파일 복사
  public static func copyFile(atPath: String, toPath: String) throws {
    try FileManager.default.copyItem(atPath: atPath, toPath: toPath)
  }
  
  // 파일 이동
  public static func moveFile(atPath: String, toPath: String) throws {
    try FileManager.default.moveItem(atPath: atPath, toPath: toPath)
  }
  
  // 파일 삭제
  public static func removeFile(atPath: String) throws {
    try FileManager.default.removeItem(atPath: atPath)
  }
}

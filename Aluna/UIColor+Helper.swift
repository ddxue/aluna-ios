//
//  UIColor+Helper.swift
//  Aluna
//
//  Created by David Xue on 4/10/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

extension UIColor {
  
  convenience init(hexString: String, alpha: CGFloat = 1) {
    assert(hexString[hexString.startIndex] == "#", "Expected hex string of format #RRGGBB")
    
    let scanner = Scanner(string: hexString)
    scanner.scanLocation = 1  // skip #
    
    var rgb: UInt32 = 0
    scanner.scanHexInt32(&rgb)
    
    self.init(
      red:   CGFloat((rgb & 0xFF0000) >> 16)/255.0,
      green: CGFloat((rgb &   0xFF00) >>  8)/255.0,
      blue:  CGFloat((rgb &     0xFF)      )/255.0,
      alpha: alpha)
  }
  
  public class func alunaGray() -> UIColor {
    return UIColor(hexString: "#aaaaaa")
  }

  public class func alunaLightGray() -> UIColor {
    return UIColor(hexString: "#f2f2f2")
  }
  
  public class func alunaLightGreen() -> UIColor {
    return UIColor(hexString: "#50D2C2")
  }
  
  public class func alunaGreen() -> UIColor {
    return UIColor(hexString: "#58b570")
  }
  
  public class func alunaYellow() -> UIColor {
    return UIColor(hexString: "#f9a70c")
  }
  
  public class func alunaDarkBlue() -> UIColor {
    return UIColor(hexString: "#1565c0")
  }
  
  public class func alunaBlue() -> UIColor {
    return UIColor(hexString: "#123456")
  }
  
  public class func alunaRed() -> UIColor {
    return UIColor(hexString: "#ff1744")
  }
  
  public class func alunaSilver() -> UIColor {
    return UIColor(hexString: "#c0c0c0")
  }
  
  public class func alunaGold() -> UIColor {
    return UIColor(hexString: "#d4af37")
  }
  
  public class func alunaBlack() -> UIColor {
    return UIColor(hexString: "#000000")
  }
}

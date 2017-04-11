//
//  UIFont+Helper.swift
//  Aluna
//
//  Created by David Xue on 4/10/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

extension UIFont {
  
  public class func alunaFontWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name: "OpenSans", size:size)!
  }
  
  public class func alunaSemiboldFontWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name: "OpenSans-Semibold", size:size)!
  }
  
  public class func alunaBoldFontWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name: "OpenSans-Bold", size:size)!
  }
  
  public class func alunaLightFontWithSize(_ size:CGFloat) -> UIFont {
    return UIFont(name: "OpenSans-Light", size:size)!
  }
  
}

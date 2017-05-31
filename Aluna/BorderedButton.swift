//
//  BorderedButton.swift
//  NewDesign
//
//  Created by David Xue on 05/06/16.
//  Copyright © 2016 Swapcard. All rights reserved.
//

import UIKit
import Foundation

func BorderColor() -> UIColor {
  return UIColor.lightGray
}

func HighlightedBorderColor() -> UIColor {
  return UIColor.alunaBlue()
}

class BorderedButton : UIButton {
  
  var isFilled: Bool = false {
    didSet {
      self.layer.borderColor = (isFilled) ? HighlightedBorderColor().cgColor : BorderColor().cgColor
      self.layer.borderWidth = (isFilled) ? 3.0 : 1.0
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.cornerRadius = 5.0
    self.layer.masksToBounds = true
    self.setTitleColor(BorderColor(), for: .normal)
    self.addTarget(self, action: #selector(didClick), for: .touchUpInside)

    self.layer.borderColor = BorderColor().cgColor
    self.layer.borderWidth = 1.0
    self.isFilled = false
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func didClick() {
    self.isFilled = !self.isFilled
  }
  
}

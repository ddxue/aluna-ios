//
//  ScalableButton.swift
//  Aluna
//
//  Created by David Xue on 4/10/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

private extension TimeInterval {
  static let releaseAnimationDuration: TimeInterval = 0.8
  static let pressAnimationDuration: TimeInterval = 0.3
}

private extension CGFloat {
  static let defaultTransformScale: CGFloat = 0.8
  static let defaultDampingOnPress: CGFloat = 0.7
  static let defaultDampingOnRelease: CGFloat = 0.2
}

class ScalableButton: UIButton {
  
  var transformScale: CGFloat = .defaultTransformScale
  var dampingOnPress: CGFloat = .defaultDampingOnPress
  var dampingOnRelease: CGFloat = .defaultDampingOnRelease
  var pressAnimation: TimeInterval = .pressAnimationDuration
  var releaseAnimation: TimeInterval = .releaseAnimationDuration
  
  var highlightColor: UIColor?
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    UIView.animate(withDuration: pressAnimation, delay: 0, usingSpringWithDamping: dampingOnPress, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { () -> Void in
      self.transform = CGAffineTransform(scaleX: self.transformScale, y: self.transformScale)
      
      if let color = self.highlightColor {
        self.backgroundColor = color.withAlphaComponent(0.3)
      }
    }, completion: nil)
    
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    UIView.animate(withDuration: releaseAnimation, delay: 0, usingSpringWithDamping: dampingOnRelease, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { () -> Void in
      self.transform = CGAffineTransform.identity
      
      if self.highlightColor != nil {
        self.backgroundColor = UIColor.clear
      }
    }, completion: nil)
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    UIView.animate(withDuration: releaseAnimation, delay: 0, usingSpringWithDamping: dampingOnRelease, initialSpringVelocity: 0, options: [], animations: { () -> Void in
      self.transform = CGAffineTransform.identity
      
      if self.highlightColor != nil {
        self.backgroundColor = UIColor.clear
      }
    }, completion: nil)
  }
}

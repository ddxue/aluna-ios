//
//  PresentMenuAnimationController.swift
//  Aluna
//
//  https://www.raywenderlich.com/110536/custom-uiviewcontroller-transitions
//
//  Created by David Xue on 4/15/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

class PresentMenuAnimationController : NSObject, UIViewControllerAnimatedTransitioning {
  
  fileprivate let duration  = 0.2
  fileprivate let menuWidth = UIScreen.main.bounds.width * MenuHelper.menuWidth
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard
      let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
      let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
        return
    }
    let containerView = transitionContext.containerView
    
    // insert menu view over the (existing) main view and add shadow
    toVC.view.frame = CGRect(origin: CGPoint(x: -self.menuWidth, y: 0),   //shift to the left
      size: toVC.view.frame.size)
    toVC.view.layer.shadowColor = UIColor.black.cgColor
    toVC.view.layer.shadowOpacity = 0.9
    toVC.view.layer.shadowRadius = 8.0
    toVC.view.layer.masksToBounds = false
    containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
    
    // replace main view with snapshot
    let snapshot = fromVC.view.snapshotView(afterScreenUpdates: false)
    snapshot?.tag = MenuHelper.snapshotNumber
    snapshot?.isUserInteractionEnabled = false
    
    // darken snapshot view
    let darkBackgroundView = UIView(frame: (snapshot?.frame)!)
    darkBackgroundView.layer.backgroundColor = UIColor.black.cgColor
    darkBackgroundView.layer.opacity = 0.0
    darkBackgroundView.tag = MenuHelper.snapshotDarkBackNumber
    snapshot?.addSubview(darkBackgroundView)
    
    containerView.insertSubview(snapshot!, belowSubview: toVC.view)
    
    // Perform animation
    UIView.animate(
      withDuration: transitionDuration(using: transitionContext),
      animations: {
        toVC.view.center.x += self.menuWidth            // slide out menu to the right
        darkBackgroundView.center.x += self.menuWidth   // slide out dark to the right
        darkBackgroundView.layer.opacity = 0.7          // increase the opacity
    },
      completion: { _ in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    )
  }
}

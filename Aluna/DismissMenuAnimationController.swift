//
//  DismissMenuAnimationController.swift
//  Aluna
//
//  Created by David Xue on 4/15/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

class DismissMenuAnimationController : NSObject, UIViewControllerAnimatedTransitioning {
  
  fileprivate let duration  = 0.4
  fileprivate let menuWidth = UIScreen.main.bounds.width * MenuHelper.menuWidth
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
      let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
        return
    }
    let containerView = transitionContext.containerView
    
    let snapshot = containerView.viewWithTag(MenuHelper.snapshotNumber)
    let darkBackgroundView:UIView = containerView.viewWithTag(MenuHelper.snapshotDarkBackNumber)!
    
    // Perform animation
    UIView.animate(
      withDuration: transitionDuration(using: transitionContext),
      animations: {
        fromVC.view.center.x -= self.menuWidth
        darkBackgroundView.center.x -= self.menuWidth
        darkBackgroundView.layer.opacity = 0.0      // decrease the opacity
    },
      completion: { _ in
        let didTransitionComplete = !transitionContext.transitionWasCancelled
        if didTransitionComplete {
          containerView.insertSubview(fromVC.view, aboveSubview: toVC.view)
          snapshot?.removeFromSuperview()
        }
        
        transitionContext.completeTransition(didTransitionComplete)
    }
    )
  }
}

//
//  MenuHelper.swift
//  Aluna
//
//  Created by David Xue on 4/15/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

enum Direction {
  case up
  case down
  case left
  case right
}

struct MenuHelper {
  static let menuWidth:CGFloat = 0.75             // defines the width of the slide-out menu
  static let percentThreshold:CGFloat = 0.35      // how far the user must pan before the menu changes state
  static let snapshotNumber = 12345               // constant used to tag a snapshot view for later retrieval
  static let snapshotDarkBackNumber = 12346
  
  static func calculateProgress(_ translationInView:CGPoint,            // user’s touch coordinates
    viewBounds:CGRect,                    // screen’s dimensions
    direction:Direction) -> CGFloat {     // direction that the slide-out menu is moving
    let pointOnAxis:CGFloat
    let axisLength:CGFloat
    switch direction {
    case .up, .down:
      pointOnAxis = translationInView.y
      axisLength = viewBounds.height
    case .left, .right:
      pointOnAxis = translationInView.x
      axisLength = viewBounds.width
    }
    
    let movementOnAxis = pointOnAxis / axisLength
    let positiveMovementOnAxis:Float
    let positiveMovementOnAxisPercent:Float
    switch direction {
    case .right, .down: // positive
      positiveMovementOnAxis = fmaxf(Float(movementOnAxis), 0.0)
      positiveMovementOnAxisPercent = fminf(positiveMovementOnAxis, 1.0)
      return CGFloat(positiveMovementOnAxisPercent)
    case .up, .left:    // negative
      positiveMovementOnAxis = fminf(Float(movementOnAxis), 0.0)
      positiveMovementOnAxisPercent = fmaxf(positiveMovementOnAxis, -1.0)
      return CGFloat(-positiveMovementOnAxisPercent)
    }
  }
  
  static func mapGestureStateToInteractor(_ gestureState:UIGestureRecognizerState,      // state of the pan gesture
    progress:CGFloat,                           // how far across the screen user has panned
    interactor: Interactor?,
    triggerAction: () -> ()){
    guard let interactor = interactor else { return }
    switch gestureState {
    case .began:
      interactor.hasStarted = true        // hasStarted flag indicates that the interactive transition is in progress
      triggerAction()                     // triggerAction() is called to initiate the transition
    case .changed:
      interactor.shouldFinish = progress > percentThreshold
      interactor.update(progress)
    case .cancelled:
      interactor.hasStarted = false
      interactor.cancel()
    case .ended:
      interactor.hasStarted = false
      interactor.shouldFinish ? interactor.finish() : interactor.cancel()
    default:
      break
    }
  }
  
}

//
//  Interactor.swift
//  Aluna
//
//  Created by David Xue on 4/15/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

class Interactor: UIPercentDrivenInteractiveTransition {
  var hasStarted = false              // indicates whether an interaction is underway
  var shouldFinish = false            // determines whether the interaction should complete or roll back
  var shouldHideStatusBar = false     // whether the status bar should be hidden during transition
}

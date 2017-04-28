//
//  MenuViewController.swift
//  Aluna
//
//  Created by David Xue on 4/15/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

private extension CGFloat {
  static let marginPadding: CGFloat                        = 15.0
  static let closeButtonTopConstraint: CGFloat             = 40.0
  static let closeButtonWidthConstraint: CGFloat           = 25.0
  static let menuOptionsTableTopConstraint: CGFloat        = 40.0
}

private let menuWidth = UIScreen.main.bounds.width * MenuHelper.menuWidth

class MenuViewController : UIViewController {
  
  // MARK: - Data
  
  var interactor:Interactor? = nil
  
  var mainNavVC:UINavigationController? = nil
  
  // MARK: - Views

  private lazy var menuView: UIView = { [unowned self] in
    let menuView = UIView(frame: CGRect(x: 0, y: 0, width: menuWidth, height: UIScreen.main.bounds.height))
    menuView.backgroundColor = UIColor.white

    menuView.translatesAutoresizingMaskIntoConstraints = false
    return menuView
    }()
  
  private lazy var tappableView: UIView = { [unowned self] in
    let tappableView = UIView(frame: CGRect(x: menuWidth, y: 0, width: UIScreen.main.bounds.width - menuWidth, height: UIScreen.main.bounds.height))
    tappableView.backgroundColor = UIColor.clear
    
    tappableView.translatesAutoresizingMaskIntoConstraints = false
    return tappableView
    }()
  
  private lazy var closeButton: ScalableButton = { [unowned self] in
    let closeButton = ScalableButton(type: .custom)
    closeButton.setImage(UIImage(named:"close.png"),for: UIControlState())
    closeButton.addTarget(self, action: #selector(dismissMenu), for: .touchUpInside)
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    return closeButton
    }()
  
  private lazy var menuOptionsTable: UITableView = { [unowned self ] in
    let menuOptionsTable = UITableView(frame: CGRect.null, style: .grouped)
    menuOptionsTable.backgroundColor = UIColor.clear
    menuOptionsTable.sectionIndexColor = UIColor.gray
    menuOptionsTable.sectionIndexBackgroundColor = UIColor.groupTableViewBackground
    menuOptionsTable.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
    menuOptionsTable.isScrollEnabled = false
    menuOptionsTable.allowsSelection = true
    menuOptionsTable.bounces = false
    menuOptionsTable.delegate = self
    menuOptionsTable.dataSource = self
    
    menuOptionsTable.translatesAutoresizingMaskIntoConstraints = false
    return menuOptionsTable
    }()

  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpNavBar()
    setUpGestures()
    
    addSubviews()
    addConstraints()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    interactor!.shouldHideStatusBar = true
    presentingViewController?.setNeedsStatusBarAppearanceUpdate()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    interactor!.shouldHideStatusBar = false
    super.viewDidDisappear(animated)
  }
  
  override var prefersStatusBarHidden : Bool {
    return interactor!.shouldHideStatusBar
  }
  
  // MARK: - Layout
  
  func addSubviews() {
    view.addSubview(menuView)
    view.addSubview(tappableView)
    
    addBlurEffect(menuView)
    menuView.addSubview(closeButton)
    menuView.addSubview(menuOptionsTable)
  }
  
  func addConstraints() {
    
    //menu on the left
    
    //top
    view.addConstraint(NSLayoutConstraint(item:menuView, attribute:.top, relatedBy:.equal, toItem: view, attribute:.top, multiplier: 1, constant: 0))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:menuView, attribute:.bottom, relatedBy:.equal, toItem: view, attribute:.bottom, multiplier: 1, constant: 0))
    //left
    view.addConstraint(NSLayoutConstraint(item:menuView, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //width
    view.addConstraint(NSLayoutConstraint(item:menuView, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: menuWidth))
    
    
    //transparent tappable on the right
    
    //top
    view.addConstraint(NSLayoutConstraint(item:tappableView, attribute:.top, relatedBy:.equal, toItem:view, attribute:.top, multiplier: 1, constant: 0))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:tappableView, attribute:.bottom, relatedBy:.equal, toItem:view, attribute:.bottom, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:tappableView, attribute:.right, relatedBy:.equal, toItem:view, attribute:.right, multiplier: 1, constant: 0))
    //left
    view.addConstraint(NSLayoutConstraint(item:tappableView, attribute:.left, relatedBy:.equal, toItem:menuView, attribute:.right, multiplier: 1, constant: 0))
    
    
    //closeButton
    
    //top
    menuView.addConstraint(NSLayoutConstraint(item:closeButton, attribute:.top, relatedBy:.equal, toItem:menuView, attribute:.top, multiplier: 1, constant: .closeButtonTopConstraint))
    //left
    menuView.addConstraint(NSLayoutConstraint(item:closeButton, attribute:.left, relatedBy:.equal,toItem:menuView, attribute:.left, multiplier: 1, constant: .marginPadding))
    //width
    menuView.addConstraint(NSLayoutConstraint(item:closeButton, attribute:.width, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier: 1, constant:.closeButtonWidthConstraint))
    //height = width
    menuView.addConstraint(NSLayoutConstraint(item:closeButton, attribute:.height, relatedBy:.equal, toItem:closeButton, attribute:.width, multiplier: 1, constant:0))
    
    //menuOptionsTable
    
    //top
    menuView.addConstraint(NSLayoutConstraint(item:menuOptionsTable, attribute:.top, relatedBy:.equal, toItem: closeButton, attribute:.bottom, multiplier: 1, constant: .menuOptionsTableTopConstraint))
    //bottom
    menuView.addConstraint(NSLayoutConstraint(item:menuOptionsTable, attribute:.bottom, relatedBy:.equal, toItem: menuView, attribute:.bottom, multiplier: 1, constant: 0))
    //left
    menuView.addConstraint(NSLayoutConstraint(item:menuOptionsTable, attribute:.left, relatedBy:.equal, toItem: menuView, attribute:.left, multiplier: 1, constant: 0))
    //right
    menuView.addConstraint(NSLayoutConstraint(item:menuOptionsTable, attribute:.right, relatedBy:.equal, toItem: menuView, attribute:.right, multiplier: 1, constant: 0))
  }
  
  // MARK: - View Setup
  
  func setUpNavBar() {
    self.navigationController?.navigationBar.isHidden = true
  }
  
  func setUpGestures() {
    let tappableDismiss = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
    tappableView.addGestureRecognizer(tappableDismiss)
    
    let dragToDismiss = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
    view.addGestureRecognizer(dragToDismiss)
  }
  
  func addBlurEffect(_ targetView:UIView) {
    if !UIAccessibilityIsReduceTransparencyEnabled() {
      let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.frame = targetView.bounds
      blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      targetView.addSubview(blurEffectView)
    }
  }

  
  // MARK: - Actions
  
  func dismissMenu() {
    presentingViewController?.dismiss(animated: true, completion: nil)
  }
}

extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      switch indexPath.row {
      default:
        return 70.0
      }
    }
    return 70.0
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0.000001
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0.000001
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let menuCell = MenuTableViewCell(style: .default, reuseIdentifier: "menuCell")

    if indexPath.section == 0 {
      switch indexPath.row {
      case 0:
        menuCell.optionText = "My Meetings"
        return menuCell
      case 1:
        menuCell.optionText = "Daily Dose"
        return menuCell
      case 2:
        menuCell.optionText = "Settings"
        return menuCell
      case 3:
        menuCell.optionText = "Log Out"
        return menuCell
      default:
        break
      }
    }
    return menuCell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if indexPath.section == 0 {
      switch indexPath.row {
      case 0:
        myMeetings()
      case 1:
        dailyDose()
      case 2:
        settings()
      case 3:
        logout()
      default:
        break
      }
    }
  }
  
  // MARK: - Actions
  
  func myMeetings() {
    //TODO:
  }
  
  func dailyDose() {
    self.dismiss(animated: false, completion: nil)
    //TODO: present dailyDoseVC
    
    let dailyDoseVC = DailyDoseViewController()
    self.mainNavVC?.present(dailyDoseVC, animated: true, completion: nil)
  }
  
  func settings() {
    //TODO: present settings
  }
  
  func logout() {
    self.dismiss(animated: false, completion: nil)
    self.mainNavVC?.popViewController(animated: true)
  }
}

// MARK: - UIGestureRecognizer Delegates

extension MenuViewController: UIGestureRecognizerDelegate {
  
  func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: view)
    let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .left)
    
    MenuHelper.mapGestureStateToInteractor(
      recognizer.state,
      progress: progress,
      interactor: interactor) {
        self.dismissMenu()
    }
  }
}

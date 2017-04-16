//
//  MainViewController.swift
//  Aluna
//
//  Created by David Xue on 4/10/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit
import Segmentio

private extension CGFloat {
  static let titleLabelHeightConstraint:CGFloat = 160.0
  static let segmentedControlHeightConstraint:CGFloat = 80.0
}

class MainViewController: UIViewController {
  
  // MARK: - Data
  
  let interactor = Interactor()
  
  fileprivate let presentMenuAnimationController = PresentMenuAnimationController()

  fileprivate let dismissMenuAnimationController = DismissMenuAnimationController()
  
  // MARK: - Views
  
  private lazy var menuButton: UIBarButtonItem = { [unowned self] in
    let menuButton = ScalableButton(type: .custom)
    menuButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    menuButton.setImage(self.defaultMenuImage(), for: UIControlState())
    menuButton.addTarget(self, action: #selector(openSlidingMenu), for: .touchUpInside)
    
    let barButtonItem:UIBarButtonItem = UIBarButtonItem(customView: menuButton)
    return barButtonItem
    }()
  
  private lazy var titleLabel: UILabel = { [unowned self] in
    let titleLabel = UILabel()
    titleLabel.text = "My Meetings"
    titleLabel.textColor = UIColor.white
    titleLabel.textAlignment = .left
    titleLabel.numberOfLines = 1
    titleLabel.font = UIFont.alunaFontWithSize(24.0)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    return titleLabel
    }()
  
  private lazy var meetingSegmentedControl: Segmentio = { [unowned self] in
    let meetingSegmentedControl = Segmentio(frame: CGRect(x: 0, y: .titleLabelHeightConstraint, width: UIScreen.main.bounds.width, height: .segmentedControlHeightConstraint))
    
    var segmentContent = [SegmentioItem]()
    let upNextSegment = SegmentioItem(title: "Up Next", image: nil)
    segmentContent.append(upNextSegment)
    let nameSegement = SegmentioItem(title: "Name", image: nil)
    segmentContent.append(nameSegement)
    let completedSegment = SegmentioItem(title: "Completed", image: nil)
    segmentContent.append(completedSegment)
    
    meetingSegmentedControl.setup(
      content: segmentContent,
      style: SegmentioStyle.onlyLabel,
      options: SegmentioOptions(
        backgroundColor: .white,
        maxVisibleItems: 3,
        scrollEnabled: true,
        indicatorOptions: SegmentioIndicatorOptions(
          type: .bottom,
          ratio: 1,
          height: 5,
          color: .orange
        ),
        horizontalSeparatorOptions: SegmentioHorizontalSeparatorOptions(
          type: SegmentioHorizontalSeparatorType.topAndBottom, // Top, Bottom, TopAndBottom
          height: 1,
          color: .gray
        ),
        verticalSeparatorOptions: SegmentioVerticalSeparatorOptions(
          ratio: 0.6, // from 0.1 to 1
          color: .gray
        ),
        imageContentMode: .center,
        labelTextAlignment: .center,
        labelTextNumberOfLines: 1,
        segmentStates: SegmentioStates(
          defaultState: SegmentioState(
            backgroundColor: .clear,
            titleFont: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize),
            titleTextColor: .black
          ),
          selectedState: SegmentioState(
            backgroundColor: .orange,
            titleFont: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize),
            titleTextColor: .white
          ),
          highlightedState: SegmentioState(
            backgroundColor: UIColor.lightGray.withAlphaComponent(0.6),
            titleFont: UIFont.boldSystemFont(ofSize: UIFont.smallSystemFontSize),
            titleTextColor: .black
          )
        ),
        animationDuration: 0.5
      )
    )
  
    meetingSegmentedControl.valueDidChange = { segmentio, segmentIndex in
      print("Selected item: ", segmentIndex)
      self.meetingsTable.reloadData()
    }
    
    meetingSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    return meetingSegmentedControl
    }()
  
  private lazy var meetingsTable: UITableView = { [unowned self ] in
    let meetingsTable = UITableView(frame: CGRect.null, style: .grouped)
    meetingsTable.backgroundColor = UIColor.clear
    meetingsTable.sectionIndexColor = UIColor.gray
    meetingsTable.sectionIndexBackgroundColor = UIColor.groupTableViewBackground
    meetingsTable.register(UITableViewCell.self, forCellReuseIdentifier: "headerCell")
    meetingsTable.isScrollEnabled = true
    meetingsTable.bounces = false
    meetingsTable.delegate = self
    meetingsTable.dataSource = self
    
    meetingsTable.translatesAutoresizingMaskIntoConstraints = false
    return meetingsTable
    }()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.lightGray
    
    setUpNavBar()
    
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
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  
  // MARK: - Layout
  
  func addSubviews() {
    view.addSubview(titleLabel)
    view.addSubview(meetingSegmentedControl)
    view.addSubview(meetingsTable)
  }
  
  func addConstraints() {
    //titleLabel
    
    //height
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .titleLabelHeightConstraint))
    //top
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.top, relatedBy:.equal, toItem: view, attribute:.top, multiplier: 1, constant: 0))
    //left
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
    
    //meetingSegmentedControl
    
    //height
    view.addConstraint(NSLayoutConstraint(item:meetingSegmentedControl, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .segmentedControlHeightConstraint))
    //top
    view.addConstraint(NSLayoutConstraint(item:meetingSegmentedControl, attribute:.top, relatedBy:.equal, toItem: titleLabel, attribute:.bottom, multiplier: 1, constant: 0))
    //left
    view.addConstraint(NSLayoutConstraint(item:meetingSegmentedControl, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:meetingSegmentedControl, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
    
    //meetingsTable
    
    //top
    view.addConstraint(NSLayoutConstraint(item:meetingsTable, attribute:.top, relatedBy:.equal, toItem: meetingSegmentedControl, attribute:.bottom, multiplier: 1, constant: 0))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:meetingsTable, attribute:.bottom, relatedBy:.equal, toItem: view, attribute:.bottom, multiplier: 1, constant: 0))
    //left
    view.addConstraint(NSLayoutConstraint(item:meetingsTable, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:meetingsTable, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
  }
  
  // MARK: - View Helpers
  
  func setUpNavBar(){
    self.navigationItem.leftBarButtonItem = menuButton;
    
    // Add a translucent navigation bar
    let navigationBar = self.navigationController?.navigationBar
    navigationBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationBar?.shadowImage = UIImage()
    navigationBar?.isTranslucent = true
  }
  
  func defaultMenuImage() -> UIImage {
    var defaultMenuImage = UIImage()
    UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 25), false, 0.0)
    
    UIColor.white.setStroke()
    UIBezierPath(rect: CGRect(x: 0, y: 1,  width: 27, height: 0.5)).stroke()
    UIBezierPath(rect: CGRect(x: 0, y: 10, width: 27, height: 0.5)).stroke()
    UIBezierPath(rect: CGRect(x: 0, y: 19, width: 27, height: 0.5)).stroke()
    
    defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    
    return defaultMenuImage
  }
  
  // MARK: - Actions
  
  func openSlidingMenu(){
    setStatusBarHidden(true)
    presentMenuVC()
  }
  
  func presentMenuVC() {
    let menuViewController = MenuViewController()
    menuViewController.interactor = interactor
    
    let newNavController = UINavigationController(rootViewController: menuViewController)
    newNavController.transitioningDelegate = self
    newNavController.modalPresentationStyle = .custom
    newNavController.modalPresentationCapturesStatusBarAppearance = true
    self.present(newNavController, animated: true, completion: nil)
  }
  
  func setStatusBarHidden(_ isHidden:Bool) {
    interactor.shouldHideStatusBar = isHidden
    self.setNeedsStatusBarAppearanceUpdate()
  }

}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      switch indexPath.row {
      case 0:
        return 40.0
      default:
        break
      }
    }
    return 40.0
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0.000001
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0.000001
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "headerCell")
    cell.selectionStyle = .none
    if indexPath.section == 0 {
      switch indexPath.row {
      case 0:
//        cell.addSubview(webColorLabel)
//        cell.addSubview(webColorTextField)
        return cell
      case 1:
//        cell.addSubview(pickerColor)
        return cell
      default:
        break
      }
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if indexPath.section == 0 {
       pushStudentProfileViewController()
    }
  }
  
  func pushStudentProfileViewController() {
    let studentProfileVC = StudentProfileViewController()
    self.navigationController?.pushViewController(studentProfileVC, animated: true)
  }
}

// MARK: - UIViewControllerTransitioning Delegates

extension MainViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController,
                           source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return presentMenuAnimationController
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return dismissMenuAnimationController
  }
  
  func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return interactor.hasStarted ? interactor : nil
  }
  
  func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return interactor.hasStarted ? interactor : nil
  }
}

// MARK: - UIGestureRecognizer Delegates

extension MainViewController: UIGestureRecognizerDelegate {
  
  func edgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
    let translation = sender.translation(in: view)
    let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .right)
    
    MenuHelper.mapGestureStateToInteractor(
      sender.state,
      progress: progress,
      interactor: interactor) {
        self.openSlidingMenu()
    }
  }
  
}

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
  static let menuButtonHeightConstraint:CGFloat = 25.0
  static let menuButtonWidthConstraint:CGFloat = 35.0
  static let menuButtonLeftConstraint:CGFloat = 15.0
  static let menuButtonTopConstraint:CGFloat = 35.0
  
  static let searchButtonHeightConstraint:CGFloat = 28.0
  static let searchButtonWidthConstraint:CGFloat = 28.0
  static let searchButtonRightConstraint:CGFloat = 15.0
  static let searchButtonTopConstraint:CGFloat = 35.0
  
  static let titleLabelLeftConstraint:CGFloat = 30.0
  static let titleLabelBottomConstraint:CGFloat = 15.0
  static let titleLabelHeightConstraint:CGFloat = 50.0

  static let editButtonRightConstraint:CGFloat = 15.0
  static let editButtonBottomConstraint:CGFloat = 20.0
  static let editButtonWidthConstraint:CGFloat = 45.0
  static let editButtonHeightConstraint:CGFloat = 20.0
  
  static let bannerImageHeightConstraint:CGFloat = 140.0
  
  static let segmentedControlHeightConstraint:CGFloat = 70.0
}

class MainViewController: UIViewController {
  
  // MARK: - Data
  
  let interactor = Interactor()
  
  fileprivate let presentMenuAnimationController = PresentMenuAnimationController()

  fileprivate let dismissMenuAnimationController = DismissMenuAnimationController()
  
  // MARK: - Views
  
  private lazy var menuButton: ScalableButton = { [unowned self] in
    let menuButton = ScalableButton(type: .custom)
    menuButton.setImage(self.defaultMenuImage(), for: UIControlState())
    menuButton.addTarget(self, action: #selector(openSlidingMenu), for: .touchUpInside)
    
    menuButton.translatesAutoresizingMaskIntoConstraints = false
    return menuButton
    }()
  
  private lazy var searchButton: ScalableButton = { [unowned self] in
    let searchButton = ScalableButton(type: .custom)
    let searchImage = UIImage(named:"search.png")
    searchButton.setImage(searchImage, for: UIControlState())
    searchButton.addTarget(self, action: #selector(openSlidingMenu), for: .touchUpInside)
    
    searchButton.translatesAutoresizingMaskIntoConstraints = false
    return searchButton
    }()
  
  private lazy var bannerImageView: UIImageView = { [unowned self] in
    let bannerImageView = UIImageView()
    bannerImageView.image = UIImage(named: "meetings-header.png")
    bannerImageView.contentMode = .scaleAspectFill
    
    bannerImageView.translatesAutoresizingMaskIntoConstraints = false
    return bannerImageView
    }()
  
  private lazy var titleLabel: UILabel = { [unowned self] in
    let titleLabel = UILabel()
    titleLabel.text = "My Meetings"
    titleLabel.textColor = UIColor.white
    titleLabel.textAlignment = .left
    titleLabel.numberOfLines = 1
    titleLabel.font = UIFont.alunaLightFontWithSize(32.0)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    return titleLabel
    }()
  
  private lazy var editButton: ScalableButton = { [unowned self] in
    let editButton = ScalableButton(type: .custom)
    editButton.setTitle("EDIT", for: .normal)
    editButton.titleLabel?.font = UIFont.alunaFontWithSize(14.0)
    editButton.titleLabel?.textAlignment = .right
    editButton.setTitleColor(UIColor.white, for: .normal)
    editButton.addTarget(self, action: #selector(editCells), for: .touchUpInside)
    
    editButton.translatesAutoresizingMaskIntoConstraints = false
    return editButton
    }()
  
  private lazy var meetingSegmentedControl: Segmentio = { [unowned self] in
    let meetingSegmentedControl = Segmentio(frame: CGRect(x: 0, y: .titleLabelHeightConstraint, width: UIScreen.main.bounds.width, height: .segmentedControlHeightConstraint))
    
    var segmentContent = [SegmentioItem]()
    let upNextSegment = SegmentioItem(title: "UP NEXT", image: nil)
    segmentContent.append(upNextSegment)
    let nameSegement = SegmentioItem(title: "NAME", image: nil)
    segmentContent.append(nameSegement)
    let completedSegment = SegmentioItem(title: "COMPLETED", image: nil)
    segmentContent.append(completedSegment)
    
    meetingSegmentedControl.setup(
      content: segmentContent,
      style: SegmentioStyle.onlyLabel,
      options: SegmentioOptions(
        backgroundColor: UIColor.alunaLightGray(),
        maxVisibleItems: 3,
        scrollEnabled: true,
        indicatorOptions: SegmentioIndicatorOptions(
          type: .bottom,
          ratio: 1,
          height: 5,
          color: UIColor.alunaLightGreen()
        ),
        horizontalSeparatorOptions: SegmentioHorizontalSeparatorOptions(
          type: SegmentioHorizontalSeparatorType.bottom, // Top, Bottom, TopAndBottom
          height: 0,
          color: .clear
        ),
        verticalSeparatorOptions: SegmentioVerticalSeparatorOptions(
          ratio: 0.6, // from 0.1 to 1
          color: .clear
        ),
        imageContentMode: .center,
        labelTextAlignment: .center,
        labelTextNumberOfLines: 1,
        segmentStates: SegmentioStates(
          defaultState: SegmentioState(
            backgroundColor: .clear,
            titleFont: UIFont.alunaFontWithSize(12.0),
            titleTextColor: .black
          ),
          selectedState: SegmentioState(
            backgroundColor: .clear,
            titleFont: UIFont.alunaFontWithSize(12.0),
            titleTextColor: .black
          ),
          highlightedState: SegmentioState(
            backgroundColor: .clear, //UIColor.lightGray.withAlphaComponent(0.6),
            titleFont: UIFont.alunaFontWithSize(12.0),
            titleTextColor: .black
          )
        ),
        animationDuration: 0.2
      )
    )
  
    // Handle the callback function
    meetingSegmentedControl.valueDidChange = { segmentio, segmentIndex in
      print("Selected item: ", segmentIndex)
      self.meetingsTable.reloadData()
    }
    
    // Initialize the segmented control to 0 index
    meetingSegmentedControl.selectedSegmentioIndex = 0
    
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
    navigationController?.setNavigationBarHidden(true, animated: true)
    
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
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // MARK: - Layout
  
  func addSubviews() {
    view.addSubview(bannerImageView)
    view.addSubview(menuButton)
    view.addSubview(searchButton)
    view.addSubview(titleLabel)
    view.addSubview(editButton)
    view.addSubview(meetingSegmentedControl)
    view.addSubview(meetingsTable)
  }
  
  func addConstraints() {
    //menuButton
    
    //top
    view.addConstraint(NSLayoutConstraint(item:menuButton, attribute:.top, relatedBy:.equal, toItem: view, attribute:.top, multiplier: 1, constant: .menuButtonTopConstraint))
    //left
    view.addConstraint(NSLayoutConstraint(item:menuButton, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: .menuButtonLeftConstraint))
    //width
    view.addConstraint(NSLayoutConstraint(item:menuButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .menuButtonWidthConstraint))
    //height
    view.addConstraint(NSLayoutConstraint(item:menuButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .menuButtonHeightConstraint))
    
    
    //searchButton
    
    //top
    view.addConstraint(NSLayoutConstraint(item:searchButton, attribute:.top, relatedBy:.equal, toItem: view, attribute:.top, multiplier: 1, constant: .searchButtonTopConstraint))
    //left
    view.addConstraint(NSLayoutConstraint(item:searchButton, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: -.searchButtonRightConstraint))
    //width
    view.addConstraint(NSLayoutConstraint(item:searchButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .searchButtonWidthConstraint))
    //height
    view.addConstraint(NSLayoutConstraint(item:searchButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .searchButtonHeightConstraint))
    
    //bannerImageView
    
    //height
    view.addConstraint(NSLayoutConstraint(item:bannerImageView, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .bannerImageHeightConstraint))
    //top
    view.addConstraint(NSLayoutConstraint(item:bannerImageView, attribute:.top, relatedBy:.equal, toItem: view, attribute:.top, multiplier: 1, constant: 0))
    //left
    view.addConstraint(NSLayoutConstraint(item:bannerImageView, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:bannerImageView, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
    
    //titleLabel
    
    //height
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .titleLabelHeightConstraint))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.bottom, relatedBy:.equal, toItem: bannerImageView, attribute:.bottom, multiplier: 1, constant: -.titleLabelBottomConstraint))
    //left
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: .titleLabelLeftConstraint))
    //right
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
    
    //editButton
    
    //bottom
    view.addConstraint(NSLayoutConstraint(item:editButton, attribute:.bottom, relatedBy:.equal, toItem: bannerImageView, attribute:.bottom, multiplier: 1, constant: -.editButtonBottomConstraint))
    //right
    view.addConstraint(NSLayoutConstraint(item:editButton, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: -.editButtonRightConstraint))
    //width
    view.addConstraint(NSLayoutConstraint(item:editButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .editButtonWidthConstraint))
    //height
    view.addConstraint(NSLayoutConstraint(item:editButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .editButtonHeightConstraint))
    
    //meetingSegmentedControl
    
    //height
    view.addConstraint(NSLayoutConstraint(item:meetingSegmentedControl, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .segmentedControlHeightConstraint))
    //top
    view.addConstraint(NSLayoutConstraint(item:meetingSegmentedControl, attribute:.top, relatedBy:.equal, toItem: bannerImageView, attribute:.bottom, multiplier: 1, constant: 0))
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
  
//  func setUpNavBar(){
//    // Add a translucent navigation bar
//    let navigationBar = self.navigationController?.navigationBar
//    navigationBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//    navigationBar?.shadowImage = UIImage()
//    navigationBar?.isTranslucent = true
//  }
  
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
    menuViewController.mainNavVC = self.navigationController
    
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
  
  func editCells() {
    
  }

}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      switch indexPath.row {
      case 0:
        return 80.0
      default:
        break
      }
    }
    return 80.0
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
    let meetingCell: MeetingTableViewCell = MeetingTableViewCell()
//    cell.selectionStyle = .none
    if indexPath.section == 0 {
      switch indexPath.row {
      default:
        break
      }
    }
    return meetingCell
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

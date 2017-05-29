//
//  StudentProfileViewController.swift
//  Aluna
//
//  Created by David Xue on 4/15/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit
import Segmentio


private extension CGFloat {
  static let backButtonHeightConstraint:CGFloat = 28.0
  static let backButtonWidthConstraint:CGFloat = 18.0
  static let backButtonLeftConstraint:CGFloat = 15.0
  static let backButtonTopConstraint:CGFloat = 35.0
  
  static let searchButtonHeightConstraint:CGFloat = 28.0
  static let searchButtonWidthConstraint:CGFloat = 28.0
  static let searchButtonRightConstraint:CGFloat = 15.0
  static let searchButtonTopConstraint:CGFloat = 35.0
  
  static let titleLabelLeftConstraint:CGFloat = 25.0
  static let titleLabelBottomConstraint:CGFloat = 15.0
  static let titleLabelHeightConstraint:CGFloat = 50.0
  static let bannerImageHeightConstraint:CGFloat = 220.0
  static let segmentedControlHeightConstraint:CGFloat = 60.0
  
  static let addNewButtonImageHeightConstraint:CGFloat = 70.0
  static let addNewButtonImageWidthConstraint:CGFloat = 70.0
  
  static let addNoteButtonBottomConstraint:CGFloat = 20.0
  static let addNoteButtonWidthConstraint:CGFloat = 80.0
  static let addNoteButtonHeightConstraint:CGFloat = 80.0
}

class StudentProfileViewController: UIViewController {
  
  // MARK: - Views
    
  private lazy var backButton: UIButton = { [unowned self] in
    let backButton = ScalableButton(type: .custom)
    backButton.setImage(UIImage(named:"back-button.png"), for: UIControlState())
    backButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    
    backButton.translatesAutoresizingMaskIntoConstraints = false
    return backButton
    }()
  
  private lazy var searchButton: UIButton = { [unowned self] in
    let searchButton = ScalableButton(type: .custom)
    let searchImage = UIImage(named:"search.png")
    searchButton.setImage(searchImage, for: UIControlState())
    searchButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    
    searchButton.translatesAutoresizingMaskIntoConstraints = false
    return searchButton
    }()
    
  private lazy var addNewButton: UIButton = { [unowned self] in
    let addNewButton = ScalableButton(type: .custom)
    let addNewImage = UIImage(named:"plus-thin.png")
    addNewButton.setImage(addNewImage, for: UIControlState())
    addNewButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
    addNewButton.translatesAutoresizingMaskIntoConstraints = false
    return addNewButton
    }()
  
  private lazy var bannerImageView: UIImageView = { [unowned self] in
    let bannerImageView = UIImageView()
    bannerImageView.image = UIImage(named: "student-header.png")
    bannerImageView.contentMode = .scaleAspectFill
    
    bannerImageView.translatesAutoresizingMaskIntoConstraints = false
    return bannerImageView
    }()
  
  private lazy var titleLabel: UILabel = { [unowned self] in
    let titleLabel = UILabel()
    titleLabel.text = "Susie Johnston"
    titleLabel.textColor = UIColor.white
    titleLabel.textAlignment = .left
    titleLabel.numberOfLines = 1
    titleLabel.font = UIFont.alunaFontWithSize(30.0)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    return titleLabel
    }()
  
  private lazy var studentSegmentedControl: Segmentio = { [unowned self] in
    let studentSegmentedControl = Segmentio(frame: CGRect(x: 0, y: .titleLabelHeightConstraint, width: UIScreen.main.bounds.width, height: .segmentedControlHeightConstraint))
    
    var segmentContent = [SegmentioItem]()
    let upNextSegment = SegmentioItem(title: "MEETINGS", image: nil)
    segmentContent.append(upNextSegment)
    let nameSegement = SegmentioItem(title: "PROFILE", image: nil)
    segmentContent.append(nameSegement)
    
    studentSegmentedControl.setup(
      content: segmentContent,
      style: SegmentioStyle.onlyLabel,
      options: SegmentioOptions(
        backgroundColor: UIColor.alunaLightGray(),
        maxVisibleItems: 2,
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
    studentSegmentedControl.valueDidChange = { segmentio, segmentIndex in
      print("Selected item: ", segmentIndex)
      self.studentTable.reloadData()
    }
  
    // Initialize the segmented control to 0 index
    studentSegmentedControl.selectedSegmentioIndex = 0

    studentSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    return studentSegmentedControl
    }()
  
    private lazy var studentTable: UITableView = { [unowned self ] in
      let meetingsTable = UITableView(frame: CGRect.null, style: .grouped)
      meetingsTable.backgroundColor = UIColor.clear
      meetingsTable.sectionIndexColor = UIColor.gray
      meetingsTable.sectionIndexBackgroundColor = UIColor.groupTableViewBackground
      meetingsTable.register(UITableViewCell.self, forCellReuseIdentifier: "meetingNoteCell")
      meetingsTable.isScrollEnabled = true
      meetingsTable.bounces = false
      meetingsTable.delegate = self
      meetingsTable.dataSource = self
      
      meetingsTable.translatesAutoresizingMaskIntoConstraints = false
      return meetingsTable
      }()
  
    private lazy var addNoteButton: UIButton = { [unowned self] in
      let addNoteButton = ScalableButton(type: .custom)
      addNoteButton.setImage(UIImage(named:"plus-thin.png"), for: UIControlState())
      addNoteButton.addTarget(self, action: #selector(addNote), for: .touchUpInside)
      
      addNoteButton.translatesAutoresizingMaskIntoConstraints = false
      return addNoteButton
      }()
  
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
      super.viewDidLoad()
        
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
  
    // MARK: - layout
    
    func addSubviews() {
      view.addSubview(bannerImageView)
      view.addSubview(backButton)
      view.addSubview(searchButton)
      view.addSubview(titleLabel)
      view.addSubview(studentSegmentedControl)
      view.addSubview(studentTable)
      view.addSubview(addNewButton)
    }
    
    func addConstraints() {
      //backButton
      
      //top
      view.addConstraint(NSLayoutConstraint(item:backButton, attribute:.top, relatedBy:.equal, toItem: view, attribute:.top, multiplier: 1, constant: .backButtonTopConstraint))
      //left
      view.addConstraint(NSLayoutConstraint(item:backButton, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: .backButtonLeftConstraint))
      //width
      view.addConstraint(NSLayoutConstraint(item:backButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .backButtonWidthConstraint))
      //height
      view.addConstraint(NSLayoutConstraint(item:backButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .backButtonHeightConstraint))
      
      
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
      
      //studentSegmentedControl
      
      //height
      view.addConstraint(NSLayoutConstraint(item:studentSegmentedControl, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .segmentedControlHeightConstraint))
      //top
      view.addConstraint(NSLayoutConstraint(item:studentSegmentedControl, attribute:.top, relatedBy:.equal, toItem: bannerImageView, attribute:.bottom, multiplier: 1, constant: 0))
      //left
      view.addConstraint(NSLayoutConstraint(item:studentSegmentedControl, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
      //right
      view.addConstraint(NSLayoutConstraint(item:studentSegmentedControl, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
      
      //meetingsTable
      
      //top
      view.addConstraint(NSLayoutConstraint(item:studentTable, attribute:.top, relatedBy:.equal, toItem: studentSegmentedControl, attribute:.bottom, multiplier: 1, constant: 0))
      //bottom
      view.addConstraint(NSLayoutConstraint(item:studentTable, attribute:.bottom, relatedBy:.equal, toItem: view, attribute:.bottom, multiplier: 1, constant: 0))
      //left
      view.addConstraint(NSLayoutConstraint(item:studentTable, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
      //right
      view.addConstraint(NSLayoutConstraint(item:studentTable, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
      
      //addNewButton
      
      //height
      view.addConstraint(NSLayoutConstraint(item:addNewButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .addNewButtonImageHeightConstraint))
      //width
      view.addConstraint(NSLayoutConstraint(item:addNewButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .addNewButtonImageWidthConstraint))
      //centered
      view.addConstraint(NSLayoutConstraint(item:addNewButton, attribute:.centerX, relatedBy:.equal, toItem: view, attribute:.centerX, multiplier: 1, constant: 0))
      //bottom
      view.addConstraint(NSLayoutConstraint(item:addNewButton, attribute:.bottom, relatedBy:.equal, toItem: view, attribute:.bottom, multiplier: 1, constant: 0))
    }
  
    // MARK: - Actions
  
    func dismissView() {
      self.navigationController?.popViewController(animated: true)
    }
  
    func addNote() {
      
    }
}

extension StudentProfileViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      if indexPath.section == 0 {
        switch indexPath.row {
        case 0:
          return 120.0
        default:
          break
        }
      }
      return 120.0
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
      let cell: MeetingNoteTableViewCell = MeetingNoteTableViewCell(style: .default, reuseIdentifier: "headerCell")
        
      cell.selectionStyle = .none
      if indexPath.section == 0 {
        switch indexPath.row {
        case 0:
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
//        pushStudentProfileViewController()
      }
    }
    
//    func pushStudentProfileViewController() {
//      let studentProfileVC = StudentProfileViewController()
//      self.navigationController?.pushViewController(studentProfileVC, animated: true)
//    }
}

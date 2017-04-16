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
  static let titleLabelHeightConstraint:CGFloat = 160.0
  static let segmentedControlHeightConstraint:CGFloat = 80.0
}

class StudentProfileViewController: UIViewController {
  
  // MARK: - Views
  
  private lazy var titleLabel: UILabel = { [unowned self] in
    let titleLabel = UILabel()
    titleLabel.text = "Susie Johnston"
    titleLabel.textColor = UIColor.white
    titleLabel.textAlignment = .left
    titleLabel.numberOfLines = 1
    titleLabel.font = UIFont.alunaFontWithSize(24.0)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    return titleLabel
    }()
  
  private lazy var studentSegmentedControl: Segmentio = { [unowned self] in
    let meetingSegmentedControl = Segmentio(frame: CGRect(x: 0, y: .titleLabelHeightConstraint, width: UIScreen.main.bounds.width, height: .segmentedControlHeightConstraint))
    
    var segmentContent = [SegmentioItem]()
    let upNextSegment = SegmentioItem(title: "Meetings", image: nil)
    segmentContent.append(upNextSegment)
    let nameSegement = SegmentioItem(title: "Profile", image: nil)
    segmentContent.append(nameSegement)
    
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
      self.studentTable.reloadData()
    }
    
    meetingSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    return meetingSegmentedControl
    }()

  
    private lazy var studentTable: UITableView = { [unowned self ] in
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
      navigationController?.setNavigationBarHidden(false, animated: true)

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
    
    // MARK: - layout
    
    func addSubviews() {
      view.addSubview(titleLabel)
      view.addSubview(studentSegmentedControl)
      view.addSubview(studentTable)
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
      view.addConstraint(NSLayoutConstraint(item:studentSegmentedControl, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .segmentedControlHeightConstraint))
      //top
      view.addConstraint(NSLayoutConstraint(item:studentSegmentedControl, attribute:.top, relatedBy:.equal, toItem: titleLabel, attribute:.bottom, multiplier: 1, constant: 0))
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
    }
    
    // MARK: - View Helpers
    
    func setUpNavBar(){
      // Add a translucent navigation bar
      let navigationBar = self.navigationController?.navigationBar
      navigationBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
      navigationBar?.shadowImage = UIImage()
      navigationBar?.isTranslucent = true
    }
}

extension StudentProfileViewController : UITableViewDelegate, UITableViewDataSource {
    
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

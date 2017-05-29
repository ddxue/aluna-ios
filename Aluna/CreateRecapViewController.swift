//
//  CreateRecapViewController.swift
//  Aluna
//
//  Created by David Xue on 4/21/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

private extension CGFloat {
  static let backButtonHeightConstraint:CGFloat = 28.0
  static let backButtonWidthConstraint:CGFloat = 18.0
  static let backButtonLeftConstraint:CGFloat = 15.0
  static let backButtonTopConstraint:CGFloat = 35.0
  
  static let closeButtonHeightConstraint:CGFloat = 28.0
  static let closeButtonWidthConstraint:CGFloat = 18.0
  static let closeButtonLeftConstraint:CGFloat = 15.0
  static let closeButtonTopConstraint:CGFloat = 35.0
  
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

class CreateRecapViewController: UIViewController {
  
  // MARK: - Views
  
  private lazy var backButton: UIButton = { [unowned self] in
    let closeButton = ScalableButton(type: .custom)
    closeButton.setImage(UIImage(named:"close.png"), for: UIControlState())
    closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    return closeButton
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
  
  private lazy var recapTable: UITableView = { [unowned self ] in
    let recapTable = UITableView(frame: CGRect.null, style: .grouped)
    recapTable.backgroundColor = UIColor.clear
    recapTable.sectionIndexColor = UIColor.gray
    recapTable.sectionIndexBackgroundColor = UIColor.groupTableViewBackground
    recapTable.register(UITableViewCell.self, forCellReuseIdentifier: "meetingNoteCell")
    recapTable.isScrollEnabled = true
    recapTable.bounces = false
    recapTable.delegate = self
    recapTable.dataSource = self
    
    recapTable.translatesAutoresizingMaskIntoConstraints = false
    return recapTable
    }()
  
  private lazy var addRecordingButton: UIButton = { [unowned self] in
    let addRecordingButton = ScalableButton(type: .custom)
    addRecordingButton.setImage(UIImage(named:"microphone.png"), for: UIControlState())
    addRecordingButton.addTarget(self, action: #selector(addRecording), for: .touchUpInside)
    
    addRecordingButton.translatesAutoresizingMaskIntoConstraints = false
    return addRecordingButton
    }()
  
  private lazy var doneButton: UIButton = { [unowned self] in
    let doneButton = ScalableButton(type: .custom)
    doneButton.setImage(UIImage(named:"plus-thin.png"), for: UIControlState())
    doneButton.addTarget(self, action: #selector(addRecap), for: .touchUpInside)
    
    doneButton.translatesAutoresizingMaskIntoConstraints = false
    return doneButton
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
    view.addSubview(titleLabel)
    view.addSubview(recapTable)
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
    
    //recapTable
    
//    //top
//    view.addConstraint(NSLayoutConstraint(item:recapTable, attribute:.top, relatedBy:.equal, toItem: studentSegmentedControl, attribute:.bottom, multiplier: 1, constant: 0))
//    //bottom
//    view.addConstraint(NSLayoutConstraint(item:recapTable, attribute:.bottom, relatedBy:.equal, toItem: view, attribute:.bottom, multiplier: 1, constant: 0))
//    //left
//    view.addConstraint(NSLayoutConstraint(item:recapTable, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
//    //right
//    view.addConstraint(NSLayoutConstraint(item:recapTable, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
    
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
  
  func addRecording() {
    
  }
  
  func addRecap() {
    
  }
}

extension CreateRecapViewController : UITableViewDelegate, UITableViewDataSource {
  
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


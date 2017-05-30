//
//  CreateRecapViewController.swift
//  Aluna
//
//  Created by David Xue on 4/21/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

private extension CGFloat {
  static let backButtonHeightConstraint:CGFloat = 24.0
  static let backButtonWidthConstraint:CGFloat = 24.0
  static let backButtonLeftConstraint:CGFloat = 15.0
  static let backButtonTopConstraint:CGFloat = 35.0
  
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
    let addNewImage = UIImage(named:"createRecap.png")
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
  
  private lazy var backgroundView: UIView = { [unowned self] in
    let backgroundView = UIView()
    backgroundView.backgroundColor = UIColor.white
    
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    return backgroundView
    }()
  
  private lazy var dateLabel: UILabel = { [unowned self] in
    let dateLabel = UILabel()
    dateLabel.text = "Date"
    dateLabel.textColor = UIColor.alunaGray()
    dateLabel.textAlignment = .left
    dateLabel.numberOfLines = 1
    dateLabel.font = UIFont.alunaFontWithSize(18.0)
    
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    return dateLabel
    }()
  
  private lazy var timeLabel: UILabel = { [unowned self] in
    let timeLabel = UILabel()
    timeLabel.text = "Time"
    timeLabel.textColor = UIColor.alunaGray()
    timeLabel.textAlignment = .left
    timeLabel.numberOfLines = 1
    timeLabel.font = UIFont.alunaFontWithSize(18.0)
    
    timeLabel.translatesAutoresizingMaskIntoConstraints = false
    return timeLabel
    }()
  
  private lazy var locationLabel: UILabel = { [unowned self] in
    let locationLabel = UILabel()
    locationLabel.text = "Time"
    locationLabel.textColor = UIColor.alunaGray()
    locationLabel.textAlignment = .left
    locationLabel.numberOfLines = 1
    locationLabel.font = UIFont.alunaFontWithSize(18.0)
    
    locationLabel.translatesAutoresizingMaskIntoConstraints = false
    return locationLabel
    }()
  
  private lazy var durationLabel: UILabel = { [unowned self] in
    let durationLabel = UILabel()
    durationLabel.text = "Duration"
    durationLabel.textColor = UIColor.alunaGray()
    durationLabel.textAlignment = .left
    durationLabel.numberOfLines = 1
    durationLabel.font = UIFont.alunaFontWithSize(18.0)
    
    durationLabel.translatesAutoresizingMaskIntoConstraints = false
    return durationLabel
    }()
  
  private lazy var topicsLabel: UILabel = { [unowned self] in
    let durationLabel = UILabel()
    durationLabel.text = "Topics"
    durationLabel.textColor = UIColor.alunaGray()
    durationLabel.textAlignment = .left
    durationLabel.numberOfLines = 1
    durationLabel.font = UIFont.alunaFontWithSize(18.0)
    
    durationLabel.translatesAutoresizingMaskIntoConstraints = false
    return durationLabel
    }()
  
  private lazy var nextMeetingLabel: UILabel = { [unowned self] in
    let nextMeetingLabel = UILabel()
    nextMeetingLabel.text = "Next Meeting"
    nextMeetingLabel.textColor = UIColor.alunaGray()
    nextMeetingLabel.textAlignment = .left
    nextMeetingLabel.numberOfLines = 1
    nextMeetingLabel.font = UIFont.alunaFontWithSize(18.0)
    
    nextMeetingLabel.translatesAutoresizingMaskIntoConstraints = false
    return nextMeetingLabel
    }()
  
  private lazy var thoughtsLabel: UILabel = { [unowned self] in
    let thoughtsLabel = UILabel()
    thoughtsLabel.text = "Tell us your thoughts:"
    thoughtsLabel.textColor = UIColor.alunaGray()
    thoughtsLabel.textAlignment = .left
    thoughtsLabel.numberOfLines = 1
    thoughtsLabel.font = UIFont.alunaFontWithSize(30.0)
    
    thoughtsLabel.translatesAutoresizingMaskIntoConstraints = false
    return thoughtsLabel
    }()
  
  
  private lazy var addRecordingButton: UIButton = { [unowned self] in
    let addRecordingButton = ScalableButton(type: .custom)
    addRecordingButton.setImage(UIImage(named:"microphone.png"), for: UIControlState())
    addRecordingButton.addTarget(self, action: #selector(addRecording), for: .touchUpInside)
    
    addRecordingButton.translatesAutoresizingMaskIntoConstraints = false
    return addRecordingButton
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
    view.addSubview(backgroundView)
    backgroundView.addSubview(dateLabel)
    backgroundView.addSubview(timeLabel)
    backgroundView.addSubview(locationLabel)
    backgroundView.addSubview(durationLabel)
    backgroundView.addSubview(nextMeetingLabel)
    backgroundView.addSubview(thoughtsLabel)
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
    
    //backgroundView
    
    //top
    view.addConstraint(NSLayoutConstraint(item:backgroundView, attribute:.top, relatedBy:.equal, toItem: bannerImageView, attribute:.bottom, multiplier: 1, constant: 0))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:backgroundView, attribute:.bottom, relatedBy:.equal, toItem: addNewButton, attribute:.top, multiplier: 1, constant: 0))
    //left
    view.addConstraint(NSLayoutConstraint(item:backgroundView, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:backgroundView, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
    
    //dateLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.top, relatedBy:.equal, toItem: backgroundView, attribute:.top, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.left, relatedBy:.equal, toItem: backgroundView, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: 0))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.width, relatedBy:.equal, toItem: backgroundView, attribute:.width, multiplier: 1, constant: 0))
    
    //addNewButton
    
    //height
    view.addConstraint(NSLayoutConstraint(item:addNewButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .addNewButtonImageHeightConstraint))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:addNewButton, attribute:.bottom, relatedBy:.equal, toItem: view, attribute:.bottom, multiplier: 1, constant: 0))
    //left
    view.addConstraint(NSLayoutConstraint(item:addNewButton, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:addNewButton, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
  }
  
  // MARK: - Actions
  
  func dismissView() {
    self.dismiss(animated: true, completion: nil)
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


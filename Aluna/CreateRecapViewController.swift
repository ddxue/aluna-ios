//
//  CreateRecapViewController.swift
//  Aluna
//
//  Created by David Xue on 4/21/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit
import QuartzCore
import ActionSheetPicker_3_0

private extension CGFloat {
  static let backButtonHeightConstraint:CGFloat = 24.0
  static let backButtonWidthConstraint:CGFloat = 24.0
  static let backButtonLeftConstraint:CGFloat = 15.0
  static let backButtonTopConstraint:CGFloat = 35.0
  
  static let titleLabelLeftConstraint:CGFloat = 25.0
  static let titleLabelBottomConstraint:CGFloat = 15.0
  static let titleLabelHeightConstraint:CGFloat = 50.0
  static let bannerImageHeightConstraint:CGFloat = 180.0
  static let segmentedControlHeightConstraint:CGFloat = 60.0
  
  static let valueLabelTopConstraint:CGFloat = 2.0
  static let valueLabelWidthConstraint:CGFloat = 150.0
  static let valueLabelHalfWidthConstraint:CGFloat = 80.0
  static let valueLabelHeightConstraint:CGFloat = 20.0
  
  static let carrotButtonLeftConstraint:CGFloat = 0.0
  static let carrotButtonHeightConstraint:CGFloat = 9.0
  static let carrotButtonWidthConstraint:CGFloat = 18.0
  
  static let dateLabelHeightConstraint:CGFloat = 20.0
  static let dateLabelLeftConstraint:CGFloat = 15.0
  static let dateLabelTopConstraint:CGFloat = 15.0
  
  static let timeLabelRightConstraint:CGFloat = 50.0
  static let timeLabelWidthConstraint:CGFloat = 80.0
  
  static let locationLabelTopConstraint:CGFloat = 40.0
  
  static let topicsLabelHeightConstraint:CGFloat = 50.0
  static let topicsLabelWidthConstraint:CGFloat = 95.0
  
  static let selectedButtonLeftConstraint:CGFloat = 5.0
  static let selectedButtonHeightConstraint:CGFloat = 45.0
  static let selectedButtonWidthConstraint:CGFloat = 80.0
  
  static let nextMeetingLabelTopConstraint:CGFloat = 20.0
  
  static let thoughtsLabelTopConstraint:CGFloat = 20.0
  static let thoughtsLabelHeightConstraint:CGFloat = 35.0
  
  static let thoughtsTextViewHeightConstraint:CGFloat = 80.0
  static let thoughtsTextViewWidthConstraint:CGFloat = 220.0
  static let thoughtsTextViewTopConstraint:CGFloat = 10.0
  
  static let addRecordingButtonTopConstraint:CGFloat = 50.0
  static let addRecordingButtonRightConstraint:CGFloat = 20.0
  static let addRecordingButtonWidthConstraint:CGFloat = 90.0
  static let addRecordingButtonHeightConstraint:CGFloat = 90.0
  
  static let createRecapButtonHeightConstraint:CGFloat = 50.0
  
  static let dividerHeightConstraint:CGFloat = 1.0
  static let dividerBottomConstraint:CGFloat = 8.0
}

class CreateRecapViewController: UIViewController {
  
  // MARK: - Data
  
  let locations = ["My Classroom", "Outdoors", "Home", "Other"]
  
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
  
  lazy var bannerImageView: UIImageView = { [unowned self] in
    let bannerImageView = UIImageView()
    //bannerImageView.image = UIImage(named: "student-header.png")
    bannerImageView.contentMode = .scaleAspectFill
    
    bannerImageView.translatesAutoresizingMaskIntoConstraints = false
    return bannerImageView
    }()
  
  lazy var titleLabel: UILabel = { [unowned self] in
    let titleLabel = UILabel()
    //titleLabel.text = "Susie Johnston"
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
    dateLabel.font = UIFont.alunaFontWithSize(15.0)
    
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    return dateLabel
    }()
  
  private lazy var dateValueLabel: UILabel = { [unowned self] in
    let dateLabel = UILabel()
    dateLabel.text = "February 16, 2015"
    dateLabel.textColor = UIColor.black
    dateLabel.textAlignment = .left
    dateLabel.numberOfLines = 1
    dateLabel.font = UIFont.alunaFontWithSize(15.0)
    
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    return dateLabel
    }()
  
  private lazy var dateCarrotButton: UIButton = { [unowned self] in
    let carrotButton = ScalableButton(type: .custom)
    carrotButton.setImage(UIImage(named:"carrot-down.png"), for: UIControlState())
    carrotButton.addTarget(self, action: #selector(selectDateChooser), for: .touchUpInside)
    
    carrotButton.translatesAutoresizingMaskIntoConstraints = false
    return carrotButton
    }()
  
  private lazy var timeLabel: UILabel = { [unowned self] in
    let timeLabel = UILabel()
    timeLabel.text = "Time"
    timeLabel.textColor = UIColor.alunaGray()
    timeLabel.textAlignment = .left
    timeLabel.numberOfLines = 1
    timeLabel.font = UIFont.alunaFontWithSize(15.0)
    
    timeLabel.translatesAutoresizingMaskIntoConstraints = false
    return timeLabel
    }()
  
  private lazy var timeValueLabel: UILabel = { [unowned self] in
    let timeValueLabel = UILabel()
    timeValueLabel.text = "9:00 AM"
    timeValueLabel.textColor = UIColor.black
    timeValueLabel.textAlignment = .left
    timeValueLabel.numberOfLines = 1
    timeValueLabel.font = UIFont.alunaFontWithSize(15.0)
    
    timeValueLabel.translatesAutoresizingMaskIntoConstraints = false
    return timeValueLabel
    }()
  
  private lazy var timeCarrotButton: UIButton = { [unowned self] in
    let carrotButton = ScalableButton(type: .custom)
    carrotButton.setImage(UIImage(named:"carrot-down.png"), for: UIControlState())
    carrotButton.addTarget(self, action: #selector(selectTimeChooser), for: .touchUpInside)
    
    carrotButton.translatesAutoresizingMaskIntoConstraints = false
    return carrotButton
    }()
  
  private lazy var timeDivider: UIView = { [unowned self] in
    let timeDivider = UIView()
    timeDivider.backgroundColor = UIColor.alunaLightGray()
    
    timeDivider.translatesAutoresizingMaskIntoConstraints = false
    return timeDivider
    }()
  
  private lazy var locationLabel: UILabel = { [unowned self] in
    let locationLabel = UILabel()
    locationLabel.text = "Location"
    locationLabel.textColor = UIColor.alunaGray()
    locationLabel.textAlignment = .left
    locationLabel.numberOfLines = 1
    locationLabel.font = UIFont.alunaFontWithSize(15.0)
    
    locationLabel.translatesAutoresizingMaskIntoConstraints = false
    return locationLabel
    }()
  
  private lazy var locationValueLabel: UILabel = { [unowned self] in
    let locationLabel = UILabel()
    locationLabel.text = "My Classroom"
    locationLabel.textColor = UIColor.black
    locationLabel.textAlignment = .left
    locationLabel.numberOfLines = 1
    locationLabel.font = UIFont.alunaFontWithSize(15.0)
    
    locationLabel.translatesAutoresizingMaskIntoConstraints = false
    return locationLabel
    }()
  
  private lazy var locationCarrotButton: UIButton = { [unowned self] in
    let carrotButton = ScalableButton(type: .custom)
    carrotButton.setImage(UIImage(named:"carrot-down.png"), for: UIControlState())
    carrotButton.addTarget(self, action: #selector(selectLocationChooser), for: .touchUpInside)
    
    carrotButton.translatesAutoresizingMaskIntoConstraints = false
    return carrotButton
    }()
  
  private lazy var durationLabel: UILabel = { [unowned self] in
    let durationLabel = UILabel()
    durationLabel.text = "Duration"
    durationLabel.textColor = UIColor.alunaGray()
    durationLabel.textAlignment = .left
    durationLabel.numberOfLines = 1
    durationLabel.font = UIFont.alunaFontWithSize(15.0)
    
    durationLabel.translatesAutoresizingMaskIntoConstraints = false
    return durationLabel
    }()
  
  private lazy var durationValueLabel: UILabel = { [unowned self] in
    let durationLabel = UILabel()
    durationLabel.text = "6 Minutes"
    durationLabel.textColor = UIColor.black
    durationLabel.textAlignment = .left
    durationLabel.numberOfLines = 1
    durationLabel.font = UIFont.alunaFontWithSize(15.0)
    
    durationLabel.translatesAutoresizingMaskIntoConstraints = false
    return durationLabel
    }()
  
  private lazy var durationCarrotButton: UIButton = { [unowned self] in
    let carrotButton = ScalableButton(type: .custom)
    carrotButton.setImage(UIImage(named:"carrot-down.png"), for: UIControlState())
    carrotButton.addTarget(self, action: #selector(selectDurationChooser), for: .touchUpInside)
    
    carrotButton.translatesAutoresizingMaskIntoConstraints = false
    return carrotButton
    }()
  
  private lazy var locationDivider: UIView = { [unowned self] in
    let locationDivider = UIView()
    locationDivider.backgroundColor = UIColor.alunaLightGray()
    
    locationDivider.translatesAutoresizingMaskIntoConstraints = false
    return locationDivider
    }()
  
  private lazy var topicsLabel: UILabel = { [unowned self] in
    let durationLabel = UILabel()
    durationLabel.text = "Topics Discussed?"
    durationLabel.textColor = UIColor.alunaGray()
    durationLabel.textAlignment = .left
    durationLabel.numberOfLines = 2
    durationLabel.font = UIFont.alunaFontWithSize(14.0)
    
    durationLabel.translatesAutoresizingMaskIntoConstraints = false
    return durationLabel
    }()
  
  private lazy var topicAcademicButton: BorderedButton = { [unowned self] in
    let topicAcademicButton = BorderedButton(frame: .zero)
    topicAcademicButton.setTitle("Academics", for: .normal)
    topicAcademicButton.titleLabel?.font = UIFont.alunaFontWithSize(14.0)
//    addRecordingButton.addTarget(self, action: #selector(addRecording), for: .touchUpInside)
    
    topicAcademicButton.translatesAutoresizingMaskIntoConstraints = false
    return topicAcademicButton
    }()
  
  private lazy var topicInterestsButton: BorderedButton = { [unowned self] in
    let topicInterestsButton = BorderedButton(frame: .zero)
    topicInterestsButton.setTitle("Interests", for: .normal)
    topicInterestsButton.titleLabel?.font = UIFont.alunaFontWithSize(14.0)
    //    addRecordingButton.addTarget(self, action: #selector(addRecording), for: .touchUpInside)
    
    topicInterestsButton.translatesAutoresizingMaskIntoConstraints = false
    return topicInterestsButton
    }()
  
  private lazy var topicPersonalButton: BorderedButton = { [unowned self] in
    let topicPersonalButton = BorderedButton(frame: .zero)
    topicPersonalButton.setTitle("Personal", for: .normal)
    topicPersonalButton.titleLabel?.font = UIFont.alunaFontWithSize(14.0)
    //    addRecordingButton.addTarget(self, action: #selector(addRecording), for: .touchUpInside)
    
    topicPersonalButton.translatesAutoresizingMaskIntoConstraints = false
    return topicPersonalButton
    }()
  
  private lazy var topicsDivider: UIView = { [unowned self] in
    let topicsDivider = UIView()
    topicsDivider.backgroundColor = UIColor.alunaLightGray()
    
    topicsDivider.translatesAutoresizingMaskIntoConstraints = false
    return topicsDivider
    }()
  
  private lazy var nextMeetingLabel: UILabel = { [unowned self] in
    let nextMeetingLabel = UILabel()
    nextMeetingLabel.text = "Next Desired Meeting Time?"
    nextMeetingLabel.textColor = UIColor.alunaGray()
    nextMeetingLabel.textAlignment = .left
    nextMeetingLabel.numberOfLines = 2
    nextMeetingLabel.font = UIFont.alunaFontWithSize(14.0)
    
    nextMeetingLabel.translatesAutoresizingMaskIntoConstraints = false
    return nextMeetingLabel
    }()
  
  private lazy var meetingFirstOptionButton: BorderedButton = { [unowned self] in
    let meetingFirstOptionButton = BorderedButton(frame: .zero)
    meetingFirstOptionButton.setTitle("2 Weeks", for: .normal)
    meetingFirstOptionButton.titleLabel?.font = UIFont.alunaFontWithSize(14.0)
    //    addRecordingButton.addTarget(self, action: #selector(addRecording), for: .touchUpInside)
    
    meetingFirstOptionButton.translatesAutoresizingMaskIntoConstraints = false
    return meetingFirstOptionButton
    }()
  
  private lazy var meetingSecondOptionButton: BorderedButton = { [unowned self] in
    let meetingSecondOptionButton = BorderedButton(frame: .zero)
    meetingSecondOptionButton.setTitle("4 Weeks", for: .normal)
    meetingSecondOptionButton.titleLabel?.font = UIFont.alunaFontWithSize(14.0)
    //    addRecordingButton.addTarget(self, action: #selector(addRecording), for: .touchUpInside)
    
    meetingSecondOptionButton.translatesAutoresizingMaskIntoConstraints = false
    return meetingSecondOptionButton
    }()
  
  private lazy var meetingThirdOptionButton: BorderedButton = { [unowned self] in
    let meetingThirdOptionButton = BorderedButton(frame: .zero)
    meetingThirdOptionButton.setTitle("6 Weeks", for: .normal)
    meetingThirdOptionButton.titleLabel?.font = UIFont.alunaFontWithSize(14.0)
    //    addRecordingButton.addTarget(self, action: #selector(addRecording), for: .touchUpInside)
    
    meetingThirdOptionButton.translatesAutoresizingMaskIntoConstraints = false
    return meetingThirdOptionButton
    }()
  
  private lazy var meetingDivider: UIView = { [unowned self] in
    let meetingDivider = UIView()
    meetingDivider.backgroundColor = UIColor.alunaLightGray()
    
    meetingDivider.translatesAutoresizingMaskIntoConstraints = false
    return meetingDivider
    }()
  
  private lazy var thoughtsLabel: UILabel = { [unowned self] in
    let thoughtsLabel = UILabel()
    thoughtsLabel.text = "Tell us your thoughts:"
    thoughtsLabel.textColor = UIColor.alunaGray()
    thoughtsLabel.textAlignment = .left
    thoughtsLabel.numberOfLines = 1
    thoughtsLabel.font = UIFont.alunaFontWithSize(20.0)
    
    thoughtsLabel.translatesAutoresizingMaskIntoConstraints = false
    return thoughtsLabel
    }()
  
  private lazy var thoughtsTextView: UITextView = { [unowned self] in
    let challengeDescriptionTextView = UITextView()
    challengeDescriptionTextView.text = "...we'll write them for you."
    challengeDescriptionTextView.textColor =  UIColor.alunaGray()
    challengeDescriptionTextView.backgroundColor = UIColor.white
    challengeDescriptionTextView.layer.borderWidth = 1.0
    challengeDescriptionTextView.layer.borderColor = UIColor.alunaGray().cgColor
    challengeDescriptionTextView.layer.cornerRadius = 5.0
    challengeDescriptionTextView.textAlignment = .left
    challengeDescriptionTextView.font = UIFont.alunaFontWithSize(15.0)
    challengeDescriptionTextView.autocorrectionType = UITextAutocorrectionType.no
    challengeDescriptionTextView.autocapitalizationType = UITextAutocapitalizationType.none
    
    challengeDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
    return challengeDescriptionTextView
    } ()
  
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
    backgroundView.addSubview(dateValueLabel)
    backgroundView.addSubview(dateCarrotButton)
    backgroundView.addSubview(timeLabel)
    backgroundView.addSubview(timeValueLabel)
    backgroundView.addSubview(timeCarrotButton)
    backgroundView.addSubview(timeDivider)
    backgroundView.addSubview(locationLabel)
    backgroundView.addSubview(locationValueLabel)
    backgroundView.addSubview(locationCarrotButton)
    backgroundView.addSubview(durationLabel)
    backgroundView.addSubview(durationValueLabel)
    backgroundView.addSubview(durationCarrotButton)
    backgroundView.addSubview(locationDivider)
    backgroundView.addSubview(topicsLabel)
    backgroundView.addSubview(topicAcademicButton)
    backgroundView.addSubview(topicInterestsButton)
    backgroundView.addSubview(topicPersonalButton)
    backgroundView.addSubview(topicsDivider)
    backgroundView.addSubview(nextMeetingLabel)
    backgroundView.addSubview(meetingFirstOptionButton)
    backgroundView.addSubview(meetingSecondOptionButton)
    backgroundView.addSubview(meetingThirdOptionButton)
    backgroundView.addSubview(meetingDivider)
    backgroundView.addSubview(thoughtsLabel)
    backgroundView.addSubview(thoughtsTextView)
    backgroundView.addSubview(addRecordingButton)
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
    
    //========================================
    
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
    backgroundView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.top, relatedBy:.equal, toItem: backgroundView, attribute:.top, multiplier: 1, constant: .dateLabelTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.left, relatedBy:.equal, toItem: backgroundView, attribute:.left, multiplier: 1, constant: .dateLabelLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelWidthConstraint))
    
    //dateValueLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:dateValueLabel, attribute:.top, relatedBy:.equal, toItem: dateLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:dateValueLabel, attribute:.left, relatedBy:.equal, toItem: dateLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:dateValueLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:dateValueLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelWidthConstraint))
    
    //dateCarrotButton
    
    //centerY
    backgroundView.addConstraint(NSLayoutConstraint(item:dateCarrotButton, attribute:.centerY, relatedBy:.equal, toItem: dateValueLabel, attribute:.centerY, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:dateCarrotButton, attribute:.left, relatedBy:.equal, toItem: dateValueLabel, attribute:.right, multiplier: 1, constant: .carrotButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:dateCarrotButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .carrotButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:dateCarrotButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .carrotButtonWidthConstraint))
    
    //timeLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:timeLabel, attribute:.top, relatedBy:.equal, toItem: dateLabel, attribute:.top, multiplier: 1, constant: 0))
    //right
    backgroundView.addConstraint(NSLayoutConstraint(item:timeLabel, attribute:.right, relatedBy:.equal, toItem: backgroundView, attribute:.right, multiplier: 1, constant: -.timeLabelRightConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:timeLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:timeLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .timeLabelWidthConstraint))
    
    //timeValueLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:timeValueLabel, attribute:.top, relatedBy:.equal, toItem: timeLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:timeValueLabel, attribute:.left, relatedBy:.equal, toItem: timeLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:timeValueLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:timeValueLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHalfWidthConstraint))
    
    //timeCarrotButton
    
    //centerY
    backgroundView.addConstraint(NSLayoutConstraint(item:timeCarrotButton, attribute:.centerY, relatedBy:.equal, toItem: timeValueLabel, attribute:.centerY, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:timeCarrotButton, attribute:.left, relatedBy:.equal, toItem: timeValueLabel, attribute:.right, multiplier: 1, constant: .carrotButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:timeCarrotButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .carrotButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:timeCarrotButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .carrotButtonWidthConstraint))
    
    //timeDivider
    
    //bottom
    backgroundView.addConstraint(NSLayoutConstraint(item:timeDivider, attribute:.bottom, relatedBy:.equal, toItem: locationLabel, attribute:.top, multiplier: 1, constant: -.dividerBottomConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:timeDivider, attribute:.left, relatedBy:.equal, toItem: backgroundView, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:timeDivider, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dividerHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:timeDivider, attribute:.width, relatedBy:.equal, toItem: backgroundView, attribute:.width, multiplier: 1, constant: 0))
    
    //locationLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:locationLabel, attribute:.top, relatedBy:.equal, toItem: dateLabel, attribute:.bottom, multiplier: 1, constant: .locationLabelTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:locationLabel, attribute:.left, relatedBy:.equal, toItem: dateLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:locationLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:locationLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelWidthConstraint))
    
    //locationValueLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:locationValueLabel, attribute:.top, relatedBy:.equal, toItem: locationLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:locationValueLabel, attribute:.left, relatedBy:.equal, toItem: locationLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:locationValueLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:locationValueLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelWidthConstraint))
    
    //locationCarrotButton
    
    //centerY
    backgroundView.addConstraint(NSLayoutConstraint(item:locationCarrotButton, attribute:.centerY, relatedBy:.equal, toItem: locationValueLabel, attribute:.centerY, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:locationCarrotButton, attribute:.left, relatedBy:.equal, toItem: locationValueLabel, attribute:.right, multiplier: 1, constant: .carrotButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:locationCarrotButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .carrotButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:locationCarrotButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .carrotButtonWidthConstraint))
    
    //durationLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:durationLabel, attribute:.top, relatedBy:.equal, toItem: locationLabel, attribute:.top, multiplier: 1, constant: 0))
    //right
    backgroundView.addConstraint(NSLayoutConstraint(item:durationLabel, attribute:.right, relatedBy:.equal, toItem: backgroundView, attribute:.right, multiplier: 1, constant: -.timeLabelRightConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:durationLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:durationLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .timeLabelWidthConstraint))
    
    //durationValueLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:durationValueLabel, attribute:.top, relatedBy:.equal, toItem: durationLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:durationValueLabel, attribute:.left, relatedBy:.equal, toItem: durationLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:durationValueLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:durationValueLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHalfWidthConstraint))
    
    //durationCarrotButton
    
    //centerY
    backgroundView.addConstraint(NSLayoutConstraint(item:durationCarrotButton, attribute:.centerY, relatedBy:.equal, toItem: durationValueLabel, attribute:.centerY, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:durationCarrotButton, attribute:.left, relatedBy:.equal, toItem: durationValueLabel, attribute:.right, multiplier: 1, constant: .carrotButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:durationCarrotButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .carrotButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:durationCarrotButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .carrotButtonWidthConstraint))
    
    //locationDivider
    
    //bottom
    backgroundView.addConstraint(NSLayoutConstraint(item:locationDivider, attribute:.bottom, relatedBy:.equal, toItem: topicsLabel, attribute:.top, multiplier: 1, constant: -.dividerBottomConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:locationDivider, attribute:.left, relatedBy:.equal, toItem: backgroundView, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:locationDivider, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dividerHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:locationDivider, attribute:.width, relatedBy:.equal, toItem: backgroundView, attribute:.width, multiplier: 1, constant: 0))
    
    //topicsLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:topicsLabel, attribute:.top, relatedBy:.equal, toItem: locationLabel, attribute:.bottom, multiplier: 1, constant: .locationLabelTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:topicsLabel, attribute:.left, relatedBy:.equal, toItem: dateLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:topicsLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .topicsLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:topicsLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .topicsLabelWidthConstraint))
    
    //topicAcademicButton
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:topicAcademicButton, attribute:.top, relatedBy:.equal, toItem: topicsLabel, attribute:.top, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:topicAcademicButton, attribute:.left, relatedBy:.equal, toItem: topicsLabel, attribute:.right, multiplier: 1, constant: .selectedButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:topicAcademicButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:topicAcademicButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonWidthConstraint))
    
    //topicInterestsButton
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:topicInterestsButton, attribute:.top, relatedBy:.equal, toItem: topicsLabel, attribute:.top, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:topicInterestsButton, attribute:.left, relatedBy:.equal, toItem: topicAcademicButton, attribute:.right, multiplier: 1, constant: .selectedButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:topicInterestsButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:topicInterestsButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonWidthConstraint))
    
    //topicPersonalButton
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:topicPersonalButton, attribute:.top, relatedBy:.equal, toItem: topicsLabel, attribute:.top, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:topicPersonalButton, attribute:.left, relatedBy:.equal, toItem: topicInterestsButton, attribute:.right, multiplier: 1, constant: .selectedButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:topicPersonalButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:topicPersonalButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonWidthConstraint))
    
 
    //topicsDivider
    
    //bottom
    backgroundView.addConstraint(NSLayoutConstraint(item:topicsDivider, attribute:.bottom, relatedBy:.equal, toItem: nextMeetingLabel, attribute:.top, multiplier: 1, constant: -.dividerBottomConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:topicsDivider, attribute:.left, relatedBy:.equal, toItem: backgroundView, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:topicsDivider, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dividerHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:topicsDivider, attribute:.width, relatedBy:.equal, toItem: backgroundView, attribute:.width, multiplier: 1, constant: 0))
    
    //nextMeetingLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:nextMeetingLabel, attribute:.top, relatedBy:.equal, toItem: topicsLabel, attribute:.bottom, multiplier: 1, constant: .nextMeetingLabelTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:nextMeetingLabel, attribute:.left, relatedBy:.equal, toItem: dateLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:nextMeetingLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .topicsLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:nextMeetingLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .topicsLabelWidthConstraint))
    
    //meetingFirstOptionButton
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingFirstOptionButton, attribute:.top, relatedBy:.equal, toItem: nextMeetingLabel, attribute:.top, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingFirstOptionButton, attribute:.left, relatedBy:.equal, toItem: topicsLabel, attribute:.right, multiplier: 1, constant: .selectedButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingFirstOptionButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingFirstOptionButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonWidthConstraint))
    
    //meetingSecondOptionButton
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingSecondOptionButton, attribute:.top, relatedBy:.equal, toItem: nextMeetingLabel, attribute:.top, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingSecondOptionButton, attribute:.left, relatedBy:.equal, toItem: meetingFirstOptionButton, attribute:.right, multiplier: 1, constant: .selectedButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingSecondOptionButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingSecondOptionButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonWidthConstraint))
    
    //meetingThirdOptionButton
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingThirdOptionButton, attribute:.top, relatedBy:.equal, toItem: nextMeetingLabel, attribute:.top, multiplier: 1, constant: 0))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingThirdOptionButton, attribute:.left, relatedBy:.equal, toItem: meetingSecondOptionButton, attribute:.right, multiplier: 1, constant: .selectedButtonLeftConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingThirdOptionButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingThirdOptionButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectedButtonWidthConstraint))
    
    //meetingsDivider
    
    //bottom
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingDivider, attribute:.bottom, relatedBy:.equal, toItem: thoughtsLabel, attribute:.top, multiplier: 1, constant: -.dividerBottomConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingDivider, attribute:.left, relatedBy:.equal, toItem: backgroundView, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingDivider, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dividerHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:meetingDivider, attribute:.width, relatedBy:.equal, toItem: backgroundView, attribute:.width, multiplier: 1, constant: 0))
    
    //thoughtsLabel
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:thoughtsLabel, attribute:.top, relatedBy:.equal, toItem: nextMeetingLabel, attribute:.bottom, multiplier: 1, constant: .thoughtsLabelTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:thoughtsLabel, attribute:.left, relatedBy:.equal, toItem: dateLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:thoughtsLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .thoughtsLabelHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:thoughtsLabel, attribute:.width, relatedBy:.equal, toItem: backgroundView, attribute:.width, multiplier: 1, constant: 0))
    
    //thoughtsTextView
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:thoughtsTextView, attribute:.top, relatedBy:.equal, toItem: thoughtsLabel, attribute:.bottom, multiplier: 1, constant: .thoughtsTextViewTopConstraint))
    //left
    backgroundView.addConstraint(NSLayoutConstraint(item:thoughtsTextView, attribute:.left, relatedBy:.equal, toItem: dateLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:thoughtsTextView, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .thoughtsTextViewHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:thoughtsTextView, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .thoughtsTextViewWidthConstraint))
    
    //addRecordingButton
    
    //top
    backgroundView.addConstraint(NSLayoutConstraint(item:addRecordingButton, attribute:.top, relatedBy:.equal, toItem: nextMeetingLabel, attribute:.bottom, multiplier: 1, constant: .addRecordingButtonTopConstraint))
    //right
    backgroundView.addConstraint(NSLayoutConstraint(item:addRecordingButton, attribute:.right, relatedBy:.equal, toItem: backgroundView, attribute:.right, multiplier: 1, constant: -.addRecordingButtonRightConstraint))
    //height
    backgroundView.addConstraint(NSLayoutConstraint(item:addRecordingButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .addRecordingButtonHeightConstraint))
    //width
    backgroundView.addConstraint(NSLayoutConstraint(item:addRecordingButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .addRecordingButtonWidthConstraint))
    
    //addNewButton
    
    //height
    view.addConstraint(NSLayoutConstraint(item:addNewButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .createRecapButtonHeightConstraint))
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
  
  func selectDateChooser() {
    let datePicker = ActionSheetDatePicker(title: nil, datePickerMode: UIDatePickerMode.date, selectedDate: Date(), doneBlock: {
      picker, value, index in
      
      let dateValue = value as! Date
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMMM d, yyyy"
      let dateString = dateFormatter.string(from:dateValue)
      
      self.dateValueLabel.text = dateString
      
//      print("value = \(value as! Date)")
//      print("index = \(index)")
//      print("picker = \(picker)")
      return
    }, cancel: { ActionStringCancelBlock in return }, origin: self.view)
    
    let secondsInWeek: TimeInterval = 7 * 24 * 60 * 60;
    datePicker?.minimumDate = Date(timeInterval: -secondsInWeek, since: Date())
    datePicker?.maximumDate = Date(timeInterval: secondsInWeek, since: Date())
    
    datePicker?.addCustomButton(withTitle: "Today", value: Date())
    let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
    datePicker?.addCustomButton(withTitle: "Yesterday", value: yesterdayDate)
    datePicker?.hideCancel = true
    datePicker?.show()
  }
  
  func datePicked(obj: Date) {
    self.dateValueLabel.text = obj.description //.setTitle(obj.description, forState: UIControlState.Normal)
  }
  
  func selectTimeChooser() {
    let datePicker = ActionSheetDatePicker(title: nil, datePickerMode: UIDatePickerMode.time, selectedDate: Date(), doneBlock: {
      picker, value, index in
      
      let dateValue = value as! Date
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "h:mm a"
      let dateString = dateFormatter.string(from:dateValue)
      
      self.timeValueLabel.text = dateString //.setTitle(obj.description, forState: UIControlState.Normal)
      
      //      print("value = \(value as! Date)")
      //      print("index = \(index)")
      //      print("picker = \(picker)")
      return
    }, cancel: { ActionStringCancelBlock in return }, origin: self.view)
    
    datePicker?.minuteInterval = 20
    datePicker?.show()
  }
  
  func selectLocationChooser() {
    ActionSheetMultipleStringPicker.show(withTitle: "Location", rows: [
      self.locations
      ], initialSelection: [0], doneBlock: {
        picker, indexes, values in
        
//        print("values = \(values)")
//        print("indexes = \(indexes?[0] ?? 0)")
//        print("picker = \(picker)")
        
        let index = Int("\(indexes?[0] ?? 0)")
        self.locationValueLabel.text = self.locations[index!]
        
        return
    }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
    
  }
  
  let durations = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 70, 80, 90]
  
  func selectDurationChooser() {
    ActionSheetMultipleStringPicker.show(withTitle: "Duration", rows: [
      self.durations
      ], initialSelection: [5], doneBlock: {
        picker, indexes, values in
        
        //        print("values = \(values)")
        //        print("indexes = \(indexes?[0] ?? 0)")
        //        print("picker = \(picker)")
        
        let index = Int("\(indexes?[0] ?? 0)")
        self.durationValueLabel.text = "\(self.durations[index!]) Minutes"
        
        return
    }, cancel: { ActionMultipleStringCancelBlock in return }, origin: self.view)
    
  }
}

//
//  MeetingNoteTableViewCell.swift
//  Aluna
//
//  Created by David Xue on 4/16/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import Foundation
import UIKit

private extension CGFloat {
  
  static let dateLabelLeftConstraint:CGFloat   = 20.0
  static let dateLabelTopConstraint:CGFloat    = 15.0
  static let dateLabelWidthConstraint:CGFloat  = 200.0
  static let dateLabelHeightConstraint:CGFloat = 20.0
  
  static let topicLabelLeftConstraint:CGFloat       = 20.0
  static let topicLabelTopConstraint:CGFloat        = 4.0
  static let topicLabelWidthConstraint:CGFloat      = 200.0
  static let topicLabelHeightConstraint:CGFloat     = 20.0
  
  static let locationLabelLeftConstraint:CGFloat     = 20.0
  static let locationLabelTopConstraint:CGFloat      = 0.0
  static let locationLabelWidthConstraint:CGFloat    = 200.0
  static let locationLabelHeightConstraint:CGFloat   = 20.0
  
  static let nextMeetingLabelLeftConstraint:CGFloat   = 20.0
  static let nextMeetingLabelTopConstraint:CGFloat    = 0.0
  static let nextMeetingLabelWidthConstraint:CGFloat  = 200.0
  static let nextMeetingLabelHeightConstraint:CGFloat = 20.0
  
  static let imageViewRightConstraint : CGFloat      = 40.0
  static let imageViewWidthConstraint: CGFloat       = 10.0
  static let imageViewHeightConstraint: CGFloat      = 20.0
  
  static let selectionCarrotRightConstraint:CGFloat = 25.0
  static let selectionCarrotHeightConstraint:CGFloat = 18.0
  static let selectionCarrotWidthConstraint:CGFloat = 9.0
}

class MeetingNoteTableViewCell: UITableViewCell {
  
  // MARK: - Data
  
  var dateText:String = "1/30/17" {
    didSet {
      dateLabel.text = dateText
    }
  }
  
  var topicText:String = "Main Topic: Academics" {
    didSet {
      topicLabel.text = topicText
    }
  }
  
  var locationText:String = "Location: Classroom" {
    didSet {
      locationLabel.text = locationText
    }
  }
  
  var nextMeetingText:String = "Next Meeting Time: 4 Weeks" {
    didSet {
      nextMeetingLabel.text = nextMeetingText
    }
  }
  
  private var updated = false
  
  // MARK: - Subviews
  
  private lazy var dateLabel : UILabel = { [unowned self] in
    let dateLabel = UILabel()
    dateLabel.textColor = UIColor.alunaGray()
    dateLabel.text  = self.dateText
    dateLabel.font = UIFont.alunaLightFontWithSize(12.0)
    
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    return dateLabel
    }()
  
  private lazy var topicLabel : UILabel = { [unowned self] in
    let topicLabel = UILabel()
    topicLabel.textColor = UIColor.black
    topicLabel.text  = self.topicText
    topicLabel.font = UIFont.alunaLightFontWithSize(14.0)
    
    topicLabel.translatesAutoresizingMaskIntoConstraints = false
    return topicLabel
    }()
  
  private lazy var locationLabel : UILabel = { [unowned self] in
    let locationLabel = UILabel()
    locationLabel.textColor = UIColor.black
    locationLabel.text  = self.locationText
    locationLabel.font = UIFont.alunaLightFontWithSize(14.0)
    
    locationLabel.translatesAutoresizingMaskIntoConstraints = false
    return locationLabel
    }()
  
  private lazy var nextMeetingLabel : UILabel = { [unowned self] in
    let nextMeetingLabel = UILabel()
    nextMeetingLabel.textColor = UIColor.black
    nextMeetingLabel.text  = self.nextMeetingText
    nextMeetingLabel.font = UIFont.alunaLightFontWithSize(14.0)
    
    nextMeetingLabel.translatesAutoresizingMaskIntoConstraints = false
    return nextMeetingLabel
    }()
  
  private  lazy var playImageView: UIImageView = { [unowned self] in
    let playImageView = UIImageView()
    playImageView.image = UIImage(named: "carrot-right.png")
    playImageView.contentMode = .scaleAspectFill
    
    playImageView.translatesAutoresizingMaskIntoConstraints = false
    return playImageView
    }()
  
//  private  lazy var selectionCarrotImageView: UIImageView = { [unowned self] in
//    let selectionCarrotImageView = UIImageView()
//    selectionCarrotImageView.image = UIImage(named: "carrot-right.png")
//    selectionCarrotImageView.contentMode = .scaleAspectFill
//    
//    selectionCarrotImageView.translatesAutoresizingMaskIntoConstraints = false
//    return selectionCarrotImageView
//    }()
  
  // MARK: - Init
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = UIColor.white
    selectionStyle = .gray
    accessibilityLabel = "meetingCell"
    
    contentView.addSubview(dateLabel)
    contentView.addSubview(topicLabel)
    contentView.addSubview(locationLabel)
    contentView.addSubview(nextMeetingLabel)
    contentView.addSubview(playImageView)
//    contentView.addSubview(selectionCarrotImageView)
    
    updateConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func updateConstraints() {
    guard !updated else {
      super.updateConstraints()
      return
    }
    updated = true
    
    //dateLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.top, relatedBy:.equal, toItem: contentView, attribute:.top, multiplier: 1, constant: .dateLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .dateLabelLeftConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelWidthConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelHeightConstraint))
    
    //topicLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:topicLabel, attribute:.top, relatedBy:.equal, toItem: dateLabel, attribute:.bottom, multiplier: 1, constant: .topicLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:topicLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .topicLabelLeftConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:topicLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .topicLabelWidthConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:topicLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .topicLabelHeightConstraint))
    
    //locationLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:locationLabel, attribute:.top, relatedBy:.equal, toItem: topicLabel, attribute:.bottom, multiplier: 1, constant: .locationLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:locationLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .locationLabelLeftConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:locationLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .locationLabelWidthConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:locationLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .locationLabelHeightConstraint))
    
    //nextMeetingLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:nextMeetingLabel, attribute:.top, relatedBy:.equal, toItem: locationLabel, attribute:.bottom, multiplier: 1, constant: .nextMeetingLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:nextMeetingLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .nextMeetingLabelLeftConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:nextMeetingLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .nextMeetingLabelWidthConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:nextMeetingLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .nextMeetingLabelHeightConstraint))
    
    
    //playImageView
    
    //centerY
    contentView.addConstraint(NSLayoutConstraint(item:playImageView, attribute:.centerY, relatedBy:.equal, toItem: contentView, attribute:.centerY, multiplier: 1, constant: 0))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:playImageView, attribute:.right, relatedBy:.equal, toItem: contentView, attribute:.right, multiplier: 1, constant: -.imageViewRightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:playImageView, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .imageViewWidthConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:playImageView, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .imageViewHeightConstraint))
    
//    //selectionCarrotImageView
//    
//    //right
//    contentView.addConstraint(NSLayoutConstraint(item:selectionCarrotImageView, attribute:.right, relatedBy:.equal, toItem: contentView, attribute:.right, multiplier: 1, constant: -.selectionCarrotRightConstraint))
//    //centerY
//    contentView.addConstraint(NSLayoutConstraint(item:selectionCarrotImageView, attribute:.centerY, relatedBy:.equal, toItem: contentView, attribute:.centerY, multiplier: 1, constant: 0))
//    //height
//    contentView.addConstraint(NSLayoutConstraint(item:selectionCarrotImageView, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectionCarrotHeightConstraint))
//    //width
//    contentView.addConstraint(NSLayoutConstraint(item:selectionCarrotImageView, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectionCarrotWidthConstraint))
    
    super.updateConstraints()
  }
}

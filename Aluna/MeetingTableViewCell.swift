//
//  MeetingTableViewCell.swift
//  Aluna
//
//  Created by David Xue on 4/16/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import Foundation
import UIKit

private extension CGFloat {
  static let imageViewLeftConstraint : CGFloat       = 15.0
  static let imageViewHeightConstraint: CGFloat      = 40.0
  static let imageViewWidthConstraint: CGFloat       = 40.0
  
  static let nameLabelLeftConstraint: CGFloat       = 15.0
  static let nameLabelHeightConstraint:CGFloat      = 20.0
  static let nameLabelWidthConstraint:CGFloat       = 200.0
  
  static let dateLabelTopConstraint:CGFloat         = 5.0
  static let dateLabelHeightConstraint:CGFloat      = 20.0
  static let dateLabelWidthConstraint:CGFloat       = 200.0
  
  static let selectionCarrotRightConstraint:CGFloat = 25.0
  static let selectionCarrotHeightConstraint:CGFloat = 18.0
  static let selectionCarrotWidthConstraint:CGFloat = 9.0
}

class MeetingTableViewCell: UITableViewCell {
  
  // MARK: - Data
  
  var nameText:String = "Error" {
    didSet {
      nameLabel.text = nameText
    }
  }
  
  var dateText:String = "Today" {
    didSet {
      dateLabel.text = dateText
    }
  }
  
  private var updated = false

  // MARK: - Subviews
  
  private  lazy var profileImageView: UIImageView = { [unowned self] in
    let profileImageView = UIImageView()
    profileImageView.image = UIImage(named: "student-oval-susie.png")
    profileImageView.contentMode = .scaleAspectFill
    
    profileImageView.translatesAutoresizingMaskIntoConstraints = false
    return profileImageView
    }()
  
  private lazy var nameLabel : UILabel = { [unowned self] in
    let nameLabel = UILabel()
    nameLabel.textColor = UIColor.black
    nameLabel.text  = self.nameText
    nameLabel.font = UIFont.alunaLightFontWithSize(16.0)
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    return nameLabel
    }()
  
  private lazy var dateLabel : UILabel = { [unowned self] in
    let dateLabel = UILabel()
    dateLabel.textColor = UIColor.alunaGray()
    dateLabel.text  = self.dateText
    dateLabel.font = UIFont.alunaLightFontWithSize(14.0)
    
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    return dateLabel
    }()
  
  private  lazy var selectionCarrotImageView: UIImageView = { [unowned self] in
    let selectionCarrotImageView = UIImageView()
    selectionCarrotImageView.image = UIImage(named: "carrot-right.png")
    selectionCarrotImageView.contentMode = .scaleAspectFill
    
    selectionCarrotImageView.translatesAutoresizingMaskIntoConstraints = false
    return selectionCarrotImageView
    }()
  
  
  // MARK: - Init
  
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = UIColor.white
    selectionStyle = .gray
    accessibilityLabel = "meetingCell"
    
    contentView.addSubview(profileImageView)
    contentView.addSubview(nameLabel)
    contentView.addSubview(dateLabel)
    contentView.addSubview(selectionCarrotImageView)
    
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
    
    //profileImageView
    
    //left
    contentView.addConstraint(NSLayoutConstraint(item:profileImageView, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .imageViewLeftConstraint))
    //centerY
    contentView.addConstraint(NSLayoutConstraint(item:profileImageView, attribute:.centerY, relatedBy:.equal, toItem: contentView, attribute:.centerY, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:profileImageView, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .imageViewHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:profileImageView, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .imageViewWidthConstraint))
    
    //nameLabel
    
    //left
    contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.left, relatedBy:.equal, toItem: profileImageView, attribute:.right, multiplier: 1, constant: .nameLabelLeftConstraint))
    //top
    contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.top, relatedBy:.equal, toItem: profileImageView, attribute:.top, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .nameLabelHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .nameLabelWidthConstraint))
    
    
    //dateLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.top, relatedBy:.equal, toItem: nameLabel, attribute:.bottom, multiplier: 1, constant: .dateLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.left, relatedBy:.equal, toItem: nameLabel, attribute:.left, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelWidthConstraint))

    
    //selectionCarrotImageView
    
    //right
    contentView.addConstraint(NSLayoutConstraint(item:selectionCarrotImageView, attribute:.right, relatedBy:.equal, toItem: contentView, attribute:.right, multiplier: 1, constant: -.selectionCarrotRightConstraint))
    //centerY
    contentView.addConstraint(NSLayoutConstraint(item:selectionCarrotImageView, attribute:.centerY, relatedBy:.equal, toItem: contentView, attribute:.centerY, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:selectionCarrotImageView, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectionCarrotHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:selectionCarrotImageView, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .selectionCarrotWidthConstraint))
    
    super.updateConstraints()
  }
  
  
}

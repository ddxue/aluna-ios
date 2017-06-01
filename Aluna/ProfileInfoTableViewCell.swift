//
//  ProfileInfoTableViewCell.swift
//  Aluna
//
//  Created by David Xue on 4/16/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import Foundation
import UIKit

private extension CGFloat {
  static let valueLabelTopConstraint:CGFloat = 2.0
  static let valueLabelWidthConstraint:CGFloat = 150.0
  static let valueLabelHalfWidthConstraint:CGFloat = 80.0
  static let valueLabelHeightConstraint:CGFloat = 20.0
  
  static let headerLabelHeightConstraint:CGFloat = 20.0
  static let headerLabelLeftConstraint:CGFloat = 15.0
  static let headerLabelTopConstraint:CGFloat = 5.0
  
  static let betweenLabelsTopConstraint:CGFloat = 20.0
  
  static let dividerHeightConstraint:CGFloat = 1.0
  static let dividerBottomConstraint:CGFloat = 8.0
}

class ProfileInfoTableViewCell: UITableViewCell {
  
  // MARK: - Data
    
    var student:Student = Student(key: "9999", dictionary: [
        "key" : "9999" as AnyObject,
        "name" : "Alex" as AnyObject,
        "photoURL": "gs://aluna-b378a.appspot.com/0.jpg" as AnyObject,
        "parent1_contact": String(describing: [
            "name" : "Bobby",
            "phoneNumber" : "555-555-5555"
            ]) as AnyObject,
        "parent2_contact": String(describing: [
            "name" : "Bobby",
            "phoneNumber" : "555-555-5555"
            ]) as AnyObject,
        "interests": String(describing: ["playing video games", "exercizing"]) as AnyObject,
        "academicGoals": String(describing: ["improve at everything"]) as AnyObject,
        "socialGoals": String(describing: ["Play outside at recess", "meet friends"]) as AnyObject
        ])
  
  var nameText:String = "Susie Rose Johnston" {
    didSet {
      nameLabel.text = nameText
    }
  }
  
  var parent_1_text:String = "John - 510-456-7700" {
    didSet {
      firstParentLabel.text = parent_1_text
    }
  }
  
  var parent_2_text:String = "Melissa - 510-657-0076" {
    didSet {
      secondParentLabel.text = parent_2_text
    }
  }
  
  var interestsText:String = "Location: Classroom" {
    didSet {
      interestsLabel.text = interestsText
    }
  }
  
  var favoriteSubjectText:String = "Math" {
    didSet {
      favoriteSubjectLabel.text = favoriteSubjectText
    }
  }
  
  var learningGoalsText:String = "Improve reading comprehension" {
    didSet {
      learningGoalsLabel.text = learningGoalsText
    }
  }
  
  var personalGoalsText:String = "Make more friends in class" {
    didSet {
      personalGoalsLabel.text = personalGoalsText
    }
  }

  private var updated = false
  
  // MARK: - Subviews
  
  private lazy var nameHeaderLabel: UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.alunaGray()
    label.text = "Full Name"
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var nameLabel: UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.text  = self.nameText
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var nameDivider: UIView = { [unowned self] in
    let divider = UIView()
    divider.backgroundColor = UIColor.alunaLightGray()
    
    divider.translatesAutoresizingMaskIntoConstraints = false
    return divider
    }()
  
  private lazy var parentsHeaderLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.alunaGray()
    label.text  = "Parent's Contact"
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var firstParentLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.text  = self.parent_1_text
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var secondParentLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.text  = self.parent_2_text
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var parentsDivider: UIView = { [unowned self] in
    let divider = UIView()
    divider.backgroundColor = UIColor.alunaLightGray()
    
    divider.translatesAutoresizingMaskIntoConstraints = false
    return divider
    }()
  
  private lazy var interestsHeaderLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.alunaGray()
    label.text  = "Interests"
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var interestsLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.text  = self.interestsText
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var interestsDivider: UIView = { [unowned self] in
    let divider = UIView()
    divider.backgroundColor = UIColor.alunaLightGray()
    
    divider.translatesAutoresizingMaskIntoConstraints = false
    return divider
    }()
  
  private lazy var favoriteSubjectHeaderLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.alunaGray()
    label.text  = "Favorite Subject"
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var favoriteSubjectLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.text  = self.favoriteSubjectText
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var favoriteSubjectDivider: UIView = { [unowned self] in
    let divider = UIView()
    divider.backgroundColor = UIColor.alunaLightGray()
    
    divider.translatesAutoresizingMaskIntoConstraints = false
    return divider
    }()
  
  private lazy var learningGoalsHeaderLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.alunaGray()
    label.text  = "Learning Goals"
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var learningGoalsLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.text  = self.learningGoalsText
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var learningGoalsDivider: UIView = { [unowned self] in
    let divider = UIView()
    divider.backgroundColor = UIColor.alunaLightGray()
    
    divider.translatesAutoresizingMaskIntoConstraints = false
    return divider
    }()
  
  private lazy var personalGoalsHeaderLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.alunaGray()
    label.text  = "Personal Goals"
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  private lazy var personalGoalsLabel : UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.text  = self.personalGoalsText
    label.font = UIFont.alunaLightFontWithSize(14.0)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  // MARK: - Init
  
    init(style: UITableViewCellStyle, reuseIdentifier: String?, student: Student) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.student = student
        nameText = student.name
        learningGoalsText = student.academicGoals
        
        personalGoalsText = student.socialGoals
        interestsText = student.interests
        parent_1_text = student.parent1_contact!
        parent_2_text = student.parent2_contact!
        //FAVORITE SUBJECT IS NOT IN THE BACKEND.  DO WE WANT TO KEEP THIS IN THE PROFILE
    
    backgroundColor = UIColor.white
    selectionStyle = .gray
    accessibilityLabel = "meetingCell"
    
    contentView.addSubview(nameHeaderLabel)
    contentView.addSubview(nameLabel)
    contentView.addSubview(nameDivider)
    
    contentView.addSubview(parentsHeaderLabel)
    contentView.addSubview(firstParentLabel)
    contentView.addSubview(secondParentLabel)
    contentView.addSubview(parentsDivider)
    
    contentView.addSubview(interestsHeaderLabel)
    contentView.addSubview(interestsLabel)
    contentView.addSubview(interestsDivider)
    
    contentView.addSubview(favoriteSubjectHeaderLabel)
    contentView.addSubview(favoriteSubjectLabel)
    contentView.addSubview(favoriteSubjectDivider)
    
    contentView.addSubview(learningGoalsHeaderLabel)
    contentView.addSubview(learningGoalsLabel)
    contentView.addSubview(learningGoalsDivider)
    
    contentView.addSubview(personalGoalsHeaderLabel)
    contentView.addSubview(personalGoalsLabel)
    
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
    
    //nameHeaderLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:nameHeaderLabel, attribute:.top, relatedBy:.equal, toItem: contentView, attribute:.top, multiplier: 1, constant: .headerLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:nameHeaderLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .headerLabelLeftConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:nameHeaderLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .headerLabelHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:nameHeaderLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //nameLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.top, relatedBy:.equal, toItem: nameHeaderLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.left, relatedBy:.equal, toItem: nameHeaderLabel, attribute:.left, multiplier: 1, constant: 0))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelWidthConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))

    //nameDivider
    
    //bottom
    contentView.addConstraint(NSLayoutConstraint(item:nameDivider, attribute:.bottom, relatedBy:.equal, toItem: parentsHeaderLabel, attribute:.top, multiplier: 1, constant: -.dividerBottomConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:nameDivider, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:nameDivider, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dividerHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:nameDivider, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //parentsHeaderLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:parentsHeaderLabel, attribute:.top, relatedBy:.equal, toItem: nameLabel, attribute:.bottom, multiplier: 1, constant: .betweenLabelsTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:parentsHeaderLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .headerLabelLeftConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:parentsHeaderLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .headerLabelHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:parentsHeaderLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //firstParentLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:firstParentLabel, attribute:.top, relatedBy:.equal, toItem: parentsHeaderLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:firstParentLabel, attribute:.left, relatedBy:.equal, toItem: parentsHeaderLabel, attribute:.left, multiplier: 1, constant: 0))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:firstParentLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelWidthConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:firstParentLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    
    //secondParentLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:secondParentLabel, attribute:.top, relatedBy:.equal, toItem: firstParentLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:secondParentLabel, attribute:.left, relatedBy:.equal, toItem: firstParentLabel, attribute:.left, multiplier: 1, constant: 0))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:secondParentLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelWidthConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:secondParentLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    
    //parentsDivider
    
    //bottom
    contentView.addConstraint(NSLayoutConstraint(item:parentsDivider, attribute:.bottom, relatedBy:.equal, toItem: interestsHeaderLabel, attribute:.top, multiplier: 1, constant: -.dividerBottomConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:parentsDivider, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:parentsDivider, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dividerHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:parentsDivider, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //interestsHeaderLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:interestsHeaderLabel, attribute:.top, relatedBy:.equal, toItem: secondParentLabel, attribute:.bottom, multiplier: 1, constant: .betweenLabelsTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:interestsHeaderLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .headerLabelLeftConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:interestsHeaderLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .headerLabelHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:interestsHeaderLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //interestsLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:interestsLabel, attribute:.top, relatedBy:.equal, toItem: interestsHeaderLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:interestsLabel, attribute:.left, relatedBy:.equal, toItem: interestsHeaderLabel, attribute:.left, multiplier: 1, constant: 0))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:interestsLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:interestsLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    
    //interestsDivider
    
    //bottom
    contentView.addConstraint(NSLayoutConstraint(item:interestsDivider, attribute:.bottom, relatedBy:.equal, toItem: favoriteSubjectHeaderLabel, attribute:.top, multiplier: 1, constant: -.dividerBottomConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:interestsDivider, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:interestsDivider, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dividerHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:interestsDivider, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //favoriteSubjectHeaderLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectHeaderLabel, attribute:.top, relatedBy:.equal, toItem: interestsLabel, attribute:.bottom, multiplier: 1, constant: .betweenLabelsTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectHeaderLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .headerLabelLeftConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectHeaderLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .headerLabelHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectHeaderLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //favoriteSubjectLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectLabel, attribute:.top, relatedBy:.equal, toItem: favoriteSubjectHeaderLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectLabel, attribute:.left, relatedBy:.equal, toItem: favoriteSubjectHeaderLabel, attribute:.left, multiplier: 1, constant: 0))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    
    //favoriteSubjectDivider
    
    //bottom
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectDivider, attribute:.bottom, relatedBy:.equal, toItem: learningGoalsHeaderLabel, attribute:.top, multiplier: 1, constant: -.dividerBottomConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectDivider, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectDivider, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dividerHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:favoriteSubjectDivider, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //learningGoalsHeaderLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsHeaderLabel, attribute:.top, relatedBy:.equal, toItem: favoriteSubjectLabel, attribute:.bottom, multiplier: 1, constant: .betweenLabelsTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsHeaderLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .headerLabelLeftConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsHeaderLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .headerLabelHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsHeaderLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //learningGoalsLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsLabel, attribute:.top, relatedBy:.equal, toItem: learningGoalsHeaderLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsLabel, attribute:.left, relatedBy:.equal, toItem: learningGoalsHeaderLabel, attribute:.left, multiplier: 1, constant: 0))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    
    //learningGoalsDivider
    
    //bottom
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsDivider, attribute:.bottom, relatedBy:.equal, toItem: personalGoalsHeaderLabel, attribute:.top, multiplier: 1, constant: -.dividerBottomConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsDivider, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsDivider, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dividerHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:learningGoalsDivider, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //personalGoalsHeaderLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:personalGoalsHeaderLabel, attribute:.top, relatedBy:.equal, toItem: learningGoalsLabel, attribute:.bottom, multiplier: 1, constant: .betweenLabelsTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:personalGoalsHeaderLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .headerLabelLeftConstraint))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:personalGoalsHeaderLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .headerLabelHeightConstraint))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:personalGoalsHeaderLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    
    //personalGoalsLabel
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:personalGoalsLabel, attribute:.top, relatedBy:.equal, toItem: personalGoalsHeaderLabel, attribute:.bottom, multiplier: 1, constant: .valueLabelTopConstraint))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:personalGoalsLabel, attribute:.left, relatedBy:.equal, toItem: personalGoalsHeaderLabel, attribute:.left, multiplier: 1, constant: 0))
    //width
    contentView.addConstraint(NSLayoutConstraint(item:personalGoalsLabel, attribute:.width, relatedBy:.equal, toItem: contentView, attribute:.width, multiplier: 1, constant: 0))
    //height
    contentView.addConstraint(NSLayoutConstraint(item:personalGoalsLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .valueLabelHeightConstraint))
    
    super.updateConstraints()
  }
  
  
}

//
//  PastMeetingsViewCell.swift
//  Aluna
//
//  Created by Jack Gartland on 4/16/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

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

class PastMeetingsViewCell: UITableViewCell {
   private var updated = false
    
    // MARK: - Subviews
    
    private lazy var mainTopicLabel : UILabel = { [unowned self] in
        let mainTopicLabel = UILabel()
        mainTopicLabel.textColor = UIColor.black
        mainTopicLabel.text  = "Main Topic:"
        mainTopicLabel.font = UIFont.alunaLightFontWithSize(15.0)
        
        mainTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainTopicLabel
        }()
    
    private lazy var locationMainLabel : UILabel = { [unowned self] in
        let locationMainLabel = UILabel()
        locationMainLabel.textColor = UIColor.black
        locationMainLabel.text  = "Location:"
        locationMainLabel.font = UIFont.alunaLightFontWithSize(15.0)
        
        locationMainLabel.translatesAutoresizingMaskIntoConstraints = false
        return locationMainLabel
        }()
    
    private lazy var nextMeetingLabel : UILabel = { [unowned self] in
        let nextMeetingLabel = UILabel()
        nextMeetingLabel.textColor = UIColor.black
        nextMeetingLabel.text  = "Next Meeting Time:"
        nextMeetingLabel.font = UIFont.alunaLightFontWithSize(15.0)
        
        nextMeetingLabel.translatesAutoresizingMaskIntoConstraints = false
        return nextMeetingLabel
        }()
    
    private lazy var topicLabel : UILabel = { [unowned self] in
        let topicLabel = UILabel()
        topicLabel.textColor = UIColor.black
        topicLabel.text  = "Topic"
        topicLabel.font = UIFont.alunaLightFontWithSize(15.0)
        
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        return topicLabel
        }()
    
    private lazy var nextMeetingTimeLabel : UILabel = { [unowned self] in
        let nextMeetingTimeLabel = UILabel()
        nextMeetingTimeLabel.textColor = UIColor.black
        nextMeetingTimeLabel.text  = "Time"
        nextMeetingTimeLabel.font = UIFont.alunaLightFontWithSize(15.0)
        
        nextMeetingTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        return nextMeetingTimeLabel
        }()
    
    private lazy var locationLabel : UILabel = { [unowned self] in
        let locationLabel = UILabel()
        locationLabel.textColor = UIColor.black
        locationLabel.text  = "Place"
        locationLabel.font = UIFont.alunaLightFontWithSize(15.0)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        return locationLabel
        }()
    
    private lazy var dateLabel : UILabel = { [unowned self] in
        let dateLabel = UILabel()
        dateLabel.textColor = UIColor.alunaGray()
        dateLabel.text  = "1/30/17"
        dateLabel.font = UIFont.alunaLightFontWithSize(10.0)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
        }()
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.white
        
        topicLabel.text = "Academics"
        locationLabel.text = "Classroom"
        nextMeetingTimeLabel.text = "2 Weeks"
        dateLabel.text = "4/16/17"
        
        contentView.addSubview(topicLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(nextMeetingTimeLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(nextMeetingLabel)
        contentView.addSubview(locationMainLabel)
        contentView.addSubview(mainTopicLabel)
        
        updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateConstraints() {
        guard !updated else {
            super.updateConstraints()
            return
        }
        updated = true
        
        
        //topicLabel
        
        //left
        contentView.addConstraint(NSLayoutConstraint(item:topicLabel, attribute:.left, relatedBy:.equal, toItem: nil, attribute:.right, multiplier: 1, constant: .nameLabelLeftConstraint))
        //top
        contentView.addConstraint(NSLayoutConstraint(item:topicLabel, attribute:.top, relatedBy:.equal, toItem: dateLabel, attribute:.top, multiplier: 1, constant: 0))
        //height
        contentView.addConstraint(NSLayoutConstraint(item:topicLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .nameLabelHeightConstraint))
        //width
        contentView.addConstraint(NSLayoutConstraint(item:topicLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .nameLabelWidthConstraint))
        
        
        //dateLabel
        
        //top
        contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.top, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelTopConstraint))
        //left
        contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.left, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: 0))
        //height
        contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelHeightConstraint))
        //width
        contentView.addConstraint(NSLayoutConstraint(item:dateLabel, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .dateLabelWidthConstraint))
        
        super.updateConstraints()
    }
    
    
}

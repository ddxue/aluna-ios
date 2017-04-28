//
//  StudentViewCell.swift
//  Aluna
//
//  Created by Jack Gartland on 4/16/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import Foundation
import UIKit

private extension CGFloat {
    static let nameLabelLeftConstraint: CGFloat       = 15.0
    static let nameLabelHeightConstraint:CGFloat      = 20.0
    static let nameLabelWidthConstraint:CGFloat       = 200.0
    
    static let dateLabelTopConstraint:CGFloat         = 5.0
    static let dateLabelHeightConstraint:CGFloat      = 20.0
    static let dateLabelWidthConstraint:CGFloat       = 200.0
}

class StudentViewCell: UITableViewCell {
    
    // MARK: - Data
    
    var nameText:String = "Susie Johnston" {
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
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.white
        selectionStyle = .gray
        accessibilityLabel = "studentCell"
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        
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
        
        //nameLabel
        
        //left
        contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.left, relatedBy:.equal, toItem: nil, attribute:.right, multiplier: 1, constant: .nameLabelLeftConstraint))
        //top
        contentView.addConstraint(NSLayoutConstraint(item:nameLabel, attribute:.top, relatedBy:.equal, toItem: nil, attribute:.top, multiplier: 1, constant: 0))
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
        
        super.updateConstraints()
    }
    
    
}

//
//  MenuTableViewCell.swift
//  Aluna
//
//  Created by David Xue on 4/15/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import Foundation
import UIKit

private extension CGFloat {
  static let optionLabelLeftConstraint : CGFloat       = 40.0
}

class MenuTableViewCell: UITableViewCell {
  
  // MARK: - Data
  
  var optionText:String = "My Meetings" {
    didSet {
      optionLabel.text = optionText
    }
  }
  
  private var updated = false

  
  // MARK: - Subviews
  
  private lazy var optionLabel : UILabel = { [unowned self] in
    let optionLabel = UILabel()
    optionLabel.textColor = UIColor.black
    optionLabel.font = UIFont.alunaLightFontWithSize(20.0)
    
    optionLabel.translatesAutoresizingMaskIntoConstraints = false
    return optionLabel
    }()
  
  
  // MARK: - Init

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = UIColor.white
    selectionStyle = .gray
    accessibilityLabel = "menuOptionCell"
    
    contentView.addSubview(optionLabel)
    
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
    
    // Option Label
    
    //top
    contentView.addConstraint(NSLayoutConstraint(item:optionLabel, attribute:.top, relatedBy:.equal, toItem: contentView, attribute:.top, multiplier: 1, constant: 0))
    //bottom
    contentView.addConstraint(NSLayoutConstraint(item:optionLabel, attribute:.bottom, relatedBy:.equal, toItem: contentView, attribute:.bottom, multiplier: 1, constant: 0))
    //right
    contentView.addConstraint(NSLayoutConstraint(item:optionLabel, attribute:.right, relatedBy:.equal, toItem: contentView, attribute:.right, multiplier: 1, constant: 0))
    //left
    contentView.addConstraint(NSLayoutConstraint(item:optionLabel, attribute:.left, relatedBy:.equal, toItem: contentView, attribute:.left, multiplier: 1, constant: .optionLabelLeftConstraint))
    
    super.updateConstraints()
  }


}

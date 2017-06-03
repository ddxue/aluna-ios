//
//  DailyDoseViewController.swift
//  Aluna
//
//  Created by David Xue on 4/21/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

private extension CGFloat {
  static let menuButtonHeightConstraint:CGFloat = 25.0
  static let menuButtonWidthConstraint:CGFloat = 35.0
  static let menuButtonLeftConstraint:CGFloat = 15.0
  static let menuButtonTopConstraint:CGFloat = 35.0
  
  static let titleLabelTopConstraint:CGFloat = 100.0
  static let titleLabelSideConstraint:CGFloat = 20.0
  static let titleLabelHeightConstraint:CGFloat = 40.0
  
  static let descriptionLabelTopConstraint:CGFloat = 20.0
  static let descriptionLabelSideConstraint:CGFloat = 40.0
  static let descriptionLabelHeightConstraint:CGFloat = 200.0
  
  static let downButtonBottomConstraint:CGFloat = 25.0
  static let downButtonWidthConstraint:CGFloat = 25.0
  static let downButtonHeightConstraint:CGFloat = 12.0
}

class DailyDoseViewController : UIViewController {
  
  // MARK: - Data
  
  var tipTitle: String? = "Tip of the Day"
    var tipDescription: String? = "Good teaching is one-fourth preparation and three-fourths theatre. \n-Gail Goldwin" {
        didSet {
            titleLabel.text = self.tipTitle
        }
    }
  
  // MARK: - Views
  
  private lazy var backgroundImageView: UIImageView = { [unowned self] in
    let backgroundImageView = UIImageView()
    backgroundImageView.image = UIImage(named: "inspiration-background.png")
    backgroundImageView.contentMode = .scaleAspectFill
    
    backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
    return backgroundImageView
    }()
  
//  private lazy var menuButton: ScalableButton = { [unowned self] in
//    let menuButton = ScalableButton(type: .custom)
//    menuButton.setImage(self.defaultMenuImage(), for: UIControlState())
//    menuButton.addTarget(self, action: #selector(openSlidingMenu), for: .touchUpInside)
//    
//    menuButton.translatesAutoresizingMaskIntoConstraints = false
//    return menuButton
//    }()
  
  private lazy var titleLabel: UILabel = { [unowned self] in
    let titleLabel = UILabel()
    titleLabel.text = self.tipTitle
    titleLabel.textColor = UIColor.black
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 1
    titleLabel.font = UIFont.alunaLightFontWithSize(30.0)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    return titleLabel
    }()
  
  private lazy var descriptionLabel: UILabel = { [unowned self] in
    let descriptionLabel = UILabel()
    descriptionLabel.text = self.tipDescription
    descriptionLabel.textColor = UIColor.black
    descriptionLabel.textAlignment = .center
    descriptionLabel.numberOfLines = 0
    descriptionLabel.font = UIFont.alunaLightItalicFontWithSize(24.0)
    
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    return descriptionLabel
    }()
  
  private lazy var downButton: ScalableButton = { [unowned self] in
    let downButton = ScalableButton(type: .custom)
    downButton.setImage(UIImage(named:"carrot-down.png"), for: UIControlState())
//    downButton.contentMode = .scaleAspectFit
    downButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    
    downButton.translatesAutoresizingMaskIntoConstraints = false
    return downButton
    }()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    API.getDailyDose(completed: { [weak self] tipDescription in self?.tipDescription = tipDescription })
    super.viewDidLoad()
    
    setUpNavBar()
    
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
  
  // MARK: - Layout
  
  func addSubviews() {
    view.addSubview(backgroundImageView)
//    view.addSubview(menuButton)
    view.addSubview(titleLabel)
    view.addSubview(descriptionLabel)
    view.addSubview(downButton)
  }
  
  func addConstraints() {
    //backgroundImageView
    
    //top
    view.addConstraint(NSLayoutConstraint(item:backgroundImageView, attribute:.top, relatedBy:.equal, toItem: view, attribute:.top, multiplier: 1, constant: 0))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:backgroundImageView, attribute:.bottom, relatedBy:.equal, toItem: view, attribute:.bottom, multiplier: 1, constant: 0))
    //left
    view.addConstraint(NSLayoutConstraint(item:backgroundImageView, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:backgroundImageView, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
    
//    //menuButton
//    
//    //top
//    view.addConstraint(NSLayoutConstraint(item:menuButton, attribute:.top, relatedBy:.equal, toItem: view, attribute:.top, multiplier: 1, constant: .menuButtonTopConstraint))
//    //left
//    view.addConstraint(NSLayoutConstraint(item:menuButton, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: .menuButtonLeftConstraint))
//    //width
//    view.addConstraint(NSLayoutConstraint(item:menuButton, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .menuButtonWidthConstraint))
//    //height
//    view.addConstraint(NSLayoutConstraint(item:menuButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .menuButtonHeightConstraint))
//    
    //titleLabel
    
    //top
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.top, relatedBy:.equal, toItem:view, attribute:.top, multiplier: 1, constant: .titleLabelTopConstraint))
    //left
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.left, relatedBy:.equal, toItem:view, attribute:.left, multiplier: 1, constant: .titleLabelSideConstraint))
    //right
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.right, relatedBy:.equal, toItem:view, attribute:.right, multiplier: 1, constant: -.titleLabelSideConstraint))
    //height
    view.addConstraint(NSLayoutConstraint(item:titleLabel, attribute:.height, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier: 1, constant: .titleLabelHeightConstraint))
    
    //descriptionLabel
    
    //top
    view.addConstraint(NSLayoutConstraint(item:descriptionLabel, attribute:.top, relatedBy:.equal, toItem:titleLabel, attribute:.bottom, multiplier: 1, constant: .descriptionLabelTopConstraint))
    //left
    view.addConstraint(NSLayoutConstraint(item:descriptionLabel, attribute:.left, relatedBy:.equal, toItem:view, attribute:.left, multiplier: 1, constant: .descriptionLabelSideConstraint))
    //right
    view.addConstraint(NSLayoutConstraint(item:descriptionLabel, attribute:.right, relatedBy:.equal, toItem:view, attribute:.right, multiplier: 1, constant: -.descriptionLabelSideConstraint))
    //height
    view.addConstraint(NSLayoutConstraint(item:descriptionLabel, attribute:.height, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier: 1, constant: .descriptionLabelHeightConstraint))
    
    //downButton
    
    //bottom
    view.addConstraint(NSLayoutConstraint(item:downButton, attribute:.bottom, relatedBy:.equal, toItem:view, attribute:.bottom, multiplier: 1, constant: -.downButtonBottomConstraint))
    //centerX
    view.addConstraint(NSLayoutConstraint(item:downButton, attribute:.centerX, relatedBy:.equal, toItem:view, attribute:.centerX, multiplier: 1, constant: 0))
    //width
    view.addConstraint(NSLayoutConstraint(item:downButton, attribute:.width, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier: 1, constant: .downButtonWidthConstraint))
    //height
    view.addConstraint(NSLayoutConstraint(item:downButton, attribute:.height, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier: 1, constant: .downButtonHeightConstraint))
  }
  
  // MARK: - View Setup
  
  func setUpNavBar() {
    self.navigationController?.navigationBar.isHidden = true
  }
  
//  func defaultMenuImage() -> UIImage {
//    var defaultMenuImage = UIImage()
//    UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 25), false, 0.0)
//    
//    UIColor.gray.setStroke()
//    UIBezierPath(rect: CGRect(x: 0, y: 1,  width: 27, height: 0.5)).stroke()
//    UIBezierPath(rect: CGRect(x: 0, y: 10, width: 27, height: 0.5)).stroke()
//    UIBezierPath(rect: CGRect(x: 0, y: 19, width: 27, height: 0.5)).stroke()
//    
//    defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
//    UIGraphicsEndImageContext()
//    
//    return defaultMenuImage
//  }
  
  // MARK: - Actions
  
  func dismissView() {
    presentingViewController?.dismiss(animated: true, completion: nil)
  }
  
//  func openSlidingMenu() {
//    
//  }
}

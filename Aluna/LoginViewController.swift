//
//  ViewController.swift
//  Aluna
//
//  Created by David Xue on 4/10/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

private extension CGFloat {
  static let logoBannerTopConstraint:CGFloat = 120.0
  static let logoBannerWidthConstraint:CGFloat = 250.0
  static let logoBannerHeightConstraint:CGFloat = 125.0
  
  static let emailTextFieldHeightConstraint:CGFloat = 80.0
  static let passwordTextFieldHeightConstraint:CGFloat = 80.0
  static let loginButtonHeightConstraint:CGFloat = 80.0
  static let loginButtonBottomConstraint:CGFloat = 100.0
}

class LoginViewController: UIViewController {

  // MARK: - Views
  
  private lazy var logoBannerImageView: UIImageView = { [unowned self] in
    let logoBannerImageView = UIImageView()
    logoBannerImageView.image = UIImage(named: "logo-tagline.png")
    logoBannerImageView.contentMode = .scaleAspectFit
    
    logoBannerImageView.translatesAutoresizingMaskIntoConstraints = false
    return logoBannerImageView
    }()
  
  private lazy var backgroundImageView: UIImageView = { [unowned self] in
    let backgroundImageView = UIImageView()
    backgroundImageView.image = UIImage(named: "main-background.png")
    backgroundImageView.contentMode = .scaleAspectFill
    
    backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
    return backgroundImageView
    }()
  
  private lazy var emailTextField: UITextField = { [unowned self] in
    let emailTextField = UITextField()
    emailTextField.placeholder = "Username"
    emailTextField.textColor =  UIColor.alunaBlue()
    emailTextField.backgroundColor = UIColor.alunaLightGray()
    emailTextField.alpha = 0.5
    emailTextField.delegate = self
    emailTextField.textAlignment = .left
    emailTextField.font = UIFont.alunaFontWithSize(12.0)
    emailTextField.autocorrectionType = UITextAutocorrectionType.no
    emailTextField.autocapitalizationType = UITextAutocapitalizationType.none
    
    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    return emailTextField
    } ()

  private lazy var passwordTextField: UITextField = { [unowned self] in
    let passwordTextField = UITextField()
    passwordTextField.placeholder = "Password"
    passwordTextField.textColor =  UIColor.alunaBlue()
    passwordTextField.backgroundColor = UIColor.alunaLightGray()
    passwordTextField.alpha = 0.5
    passwordTextField.delegate = self
    passwordTextField.textAlignment = .left
    passwordTextField.font = UIFont.alunaFontWithSize(12.0)
    passwordTextField.autocorrectionType = UITextAutocorrectionType.no
    passwordTextField.autocapitalizationType = UITextAutocapitalizationType.none
    
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    return passwordTextField
    } ()
  
  private lazy var loginButton: UIButton = { [unowned self] in
    let loginButton = UIButton(type: .custom)
    loginButton.setTitle("Sign In", for: UIControlState())
    loginButton.titleLabel!.font = UIFont.alunaFontWithSize(16.0)
    loginButton.backgroundColor = UIColor.alunaDarkBlue()
    loginButton.addTarget(self, action: #selector(loginWithEmail), for: UIControlEvents.touchUpInside)
    
    loginButton.translatesAutoresizingMaskIntoConstraints = false
    return loginButton
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
  
  // MARK: - layout
  
  func addSubviews() {
    view.addSubview(backgroundImageView)
    view.addSubview(logoBannerImageView)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)
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
    
    
    //logoBannerImageView
    
    //top
    view.addConstraint(NSLayoutConstraint(item:logoBannerImageView, attribute:.top, relatedBy:.equal, toItem: view, attribute:.top, multiplier: 1, constant: .logoBannerTopConstraint))
    //centerX
    view.addConstraint(NSLayoutConstraint(item:logoBannerImageView, attribute:.centerX, relatedBy:.equal, toItem: view, attribute:.centerX, multiplier: 1, constant: 0))
    //width
    view.addConstraint(NSLayoutConstraint(item:logoBannerImageView, attribute:.width, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .logoBannerWidthConstraint))
    //height
    view.addConstraint(NSLayoutConstraint(item:logoBannerImageView, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .logoBannerHeightConstraint))
    
    
    //emailTextField
    
    //height
    view.addConstraint(NSLayoutConstraint(item:emailTextField, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .emailTextFieldHeightConstraint))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:emailTextField, attribute:.bottom, relatedBy:.equal, toItem: passwordTextField, attribute:.top, multiplier: 1, constant: 0.0))
    //left
    view.addConstraint(NSLayoutConstraint(item:emailTextField, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:emailTextField, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
    
    //passwordTextField
    
    //height
    view.addConstraint(NSLayoutConstraint(item:passwordTextField, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .passwordTextFieldHeightConstraint))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:passwordTextField, attribute:.bottom, relatedBy:.equal, toItem: loginButton, attribute:.top, multiplier: 1, constant: 0.0))
    //left
    view.addConstraint(NSLayoutConstraint(item:passwordTextField, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:passwordTextField, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
    
    //loginButton
    
    //height
    view.addConstraint(NSLayoutConstraint(item:loginButton, attribute:.height, relatedBy:.equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1, constant: .loginButtonHeightConstraint))
    //bottom
    view.addConstraint(NSLayoutConstraint(item:loginButton, attribute:.bottom, relatedBy:.equal, toItem: view, attribute:.bottom, multiplier: 1, constant: -.loginButtonBottomConstraint))
    //left
    view.addConstraint(NSLayoutConstraint(item:loginButton, attribute:.left, relatedBy:.equal, toItem: view, attribute:.left, multiplier: 1, constant: 0))
    //right
    view.addConstraint(NSLayoutConstraint(item:loginButton, attribute:.right, relatedBy:.equal, toItem: view, attribute:.right, multiplier: 1, constant: 0))
  }
  
  // MARK: - Login Actions
  
  func loginWithFacebook(_ sender: UIButton) {
    skipToMain()
  }
  
  func loginWithEmail(_ sender: UIButton) {
    skipToMain()
  }
  
  // MARK: - Signup Actions
  
  func signUpWithFacebook(_ sender: UIButton) {
    skipToMain()
  }
  
  func signUpWithEmail(_ sender: UIButton) {
    skipToMain()
  }
  
  private func skipToMain() {
    let mainVC = MainViewController()
    self.navigationController?.pushViewController(mainVC, animated: true)
  }
  
}

extension LoginViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

}


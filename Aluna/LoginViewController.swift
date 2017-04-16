//
//  ViewController.swift
//  Aluna
//
//  Created by David Xue on 4/10/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

private extension CGFloat {
  static let emailTextFieldHeightConstraint:CGFloat = 80.0
  static let passwordTextFieldHeightConstraint:CGFloat = 80.0
  static let loginButtonHeightConstraint:CGFloat = 80.0
  static let loginButtonBottomConstraint:CGFloat = 100.0
}

class LoginViewController: UIViewController {

  // MARK: - Views
  
  private lazy var emailTextField: UITextField = { [unowned self] in
    let emailTextField = UITextField()
    emailTextField.placeholder = "Username"
    emailTextField.textColor =  UIColor.alunaBlue()
    emailTextField.backgroundColor = UIColor.red
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
    passwordTextField.backgroundColor = UIColor.green
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
    loginButton.titleLabel!.font = UIFont.alunaSemiboldFontWithSize(15.0)
    loginButton.backgroundColor = UIColor.gray
    loginButton.addTarget(self, action: #selector(loginWithEmail), for: UIControlEvents.touchUpInside)
    
    loginButton.translatesAutoresizingMaskIntoConstraints = false
    return loginButton
    }()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.blue
    
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
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)
  }
  
  func addConstraints() {
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


//
//  ViewController.swift
//  FOPS
//
//  Created by Vlad Gachi on 10/03/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
///

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
  
  override public var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  let loginViews = LoginViews()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .darkBlue
    
    loginViews.setupViews(for: self)
    setupButtons()
  }
  
  private func setupButtons() {
    loginViews.usernameTextField.delegate = self
    loginViews.usernameTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    
    loginViews.passwordTextField.delegate = self
    loginViews.passwordTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    
    loginViews.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    loginViews.usernameTextField.resignFirstResponder()
    loginViews.passwordTextField.resignFirstResponder()
    return true
  }
  
  @objc fileprivate func handleTextInputChange() {
    let isFormValid = loginViews.usernameTextField.text?.count ?? 0 > 0 && loginViews.passwordTextField.text?.count ?? 0 > 0
    
    if isFormValid {
      loginViews.loginButton.isEnabled = true
      loginViews.loginButton.backgroundColor = .white
    } else {
      loginViews.loginButton.isEnabled = false
      loginViews.loginButton.backgroundColor = .lightGray
    }
  }
  
  @objc fileprivate func handleLogin() {
    let despatchOrdersController = OrdersController(collectionViewLayout: UICollectionViewFlowLayout())
    let navController = UINavigationController(rootViewController: despatchOrdersController)
    
    present(navController, animated: true, completion: nil)
  }
}




















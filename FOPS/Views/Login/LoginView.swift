//
//  LoginViews.swift
//  FOPS
//
//  Created by Vlad Gachi on 29/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class LoginView: UIView {
  
  // MARK: Properties
  private let fopsLogoView  = UIImageView(image: #imageLiteral(resourceName: "FOPS_logo"))
  private let fopsTitleView = UIImageView(image: #imageLiteral(resourceName: "FOPS_title"))

  private let usernameLabel = UILabel.createLabelWith(text: "User Name", color: .white)
  private let passwordLabel = UILabel.createLabelWith(text: "Password", color: .white)
  
  public let usernameTextField = UITextField.createTextFieldWith(placeholder: "")
  public let passwordTextField = UITextField.createTextFieldWith(placeholder: "")
  
  public let loginButton = UIButton.createButtonWith(title: "Login", backgroundColor: .lightGray)
  
  
  // MARK: - View Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupTextFields()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - Private Methods
  private func setupTextFields() {
    usernameTextField.delegate = self
    usernameTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    
    passwordTextField.delegate = self
    passwordTextField.isSecureTextEntry = true
    passwordTextField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
  }
  
  
  // MARK: - Public Methods
  public func setupViews(for controller: UIViewController) {
    let usernameStackView           = UIStackView(arrangedSubviews: [usernameLabel, usernameTextField])
    usernameStackView.distribution  = .fillEqually
    usernameStackView.spacing       = -90

    let passwordStackView           = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
    passwordStackView.distribution  = .fillEqually
    passwordStackView.spacing       = -90

    controller.view.addSubview(fopsLogoView)
    controller.view.addSubview(fopsTitleView)
    controller.view.addSubview(usernameStackView)
    controller.view.addSubview(passwordStackView)

    controller.view.addSubview(loginButton)
    loginButton.isEnabled = false

    fopsLogoView.anchor(top: controller.view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: 175, height: 175))
    fopsLogoView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true

    fopsTitleView.anchor(top: fopsLogoView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 308, height: 66))
    fopsTitleView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true

    usernameStackView.anchor(top: fopsTitleView.bottomAnchor, leading: controller.view.leadingAnchor, bottom: nil, trailing: controller.view.trailingAnchor, padding: .init(top: 40, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 0))

    passwordStackView.anchor(top: usernameStackView.bottomAnchor, leading: controller.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: controller.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 0))

    loginButton.anchor(top: passwordStackView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 25))
    loginButton.centerXAnchor.constraint(equalTo: passwordStackView.centerXAnchor).isActive = true
  }
  
  
  // MARK: - Handlers
  @objc private func handleTextInputChange() {
    let isFormValid = usernameTextField.text?.count ?? 0 > 0 &&
                      passwordTextField.text?.count ?? 0 > 0

    if isFormValid {
      loginButton.isEnabled = true
      loginButton.backgroundColor = .white
    } else {
      loginButton.isEnabled = false
      loginButton.backgroundColor = .lightGray
    }
  }
}





















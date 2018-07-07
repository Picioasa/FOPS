//
//  LoginViews.swift
//  FOPS
//
//  Created by Vlad Gachi on 29/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

struct LoginViews {
  let fopsLogoView: UIImageView = {
    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "FOPS_logo").withRenderingMode(.alwaysOriginal)
    return iv
  }()
  
  let fopsTitleView: UIImageView = {
    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "FOPS_title").withRenderingMode(.alwaysOriginal)
    return iv
  }()
  
  let usernameLabel: UILabel = {
    let label = UILabel()
    let attributedText = NSMutableAttributedString(string: "User Name", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedStringKey.foregroundColor: UIColor.white])
    label.attributedText = attributedText
    return label
  }()
  
  let usernameTextField: UITextField = {
    let tf = UITextField()
    tf.borderStyle = .roundedRect
    tf.returnKeyType = .done
    return tf
  }()
  
  let passwordLabel: UILabel = {
    let label = UILabel()
    let attributedText = NSMutableAttributedString(string: "Password", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedStringKey.foregroundColor: UIColor.white])
    label.attributedText = attributedText
    return label
  }()
  
   let passwordTextField: UITextField = {
    let tf = UITextField()
    tf.borderStyle = .roundedRect
    tf.isSecureTextEntry = true
    tf.returnKeyType = .done
    return tf
  }()
  
   let loginButton: UIButton = {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: "Login", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.black])
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.backgroundColor = .lightGray
    button.layer.cornerRadius = 3
    button.isEnabled = false
//    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()
  
  func setupViews(for controller: UIViewController) {
    
    let usernameStackView = UIStackView(arrangedSubviews: [usernameLabel, usernameTextField])
    usernameStackView.distribution = .fillEqually
    usernameStackView.spacing = -90
    
    let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
    passwordStackView.distribution = .fillEqually
    passwordStackView.spacing = -90
    
    controller.view.addSubview(fopsLogoView)
    controller.view.addSubview(fopsTitleView)
    controller.view.addSubview(usernameStackView)
    controller.view.addSubview(passwordStackView)
    controller.view.addSubview(loginButton)
    
    fopsLogoView.anchor(top: controller.view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: 175, height: 175))
    fopsLogoView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true
    
    fopsTitleView.anchor(top: fopsLogoView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 308, height: 66))
    fopsTitleView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true
    
    usernameStackView.anchor(top: fopsTitleView.bottomAnchor, leading: controller.view.leadingAnchor, bottom: nil, trailing: controller.view.trailingAnchor, padding: .init(top: 40, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 0))
    
    passwordStackView.anchor(top: usernameStackView.bottomAnchor, leading: controller.view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: controller.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 40, bottom: 0, right: 40), size: .init(width: 0, height: 0))
    
    loginButton.anchor(top: passwordStackView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 25))
    loginButton.centerXAnchor.constraint(equalTo: passwordStackView.centerXAnchor).isActive = true
  }
}


























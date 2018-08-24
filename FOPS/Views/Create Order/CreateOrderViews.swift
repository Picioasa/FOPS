//
//  CreateOrderViews.swift
//  FOPS
//
//  Created by Vlad Gachi on 30/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class CreateOrderViews: UIView, UITextFieldDelegate {
  
  let backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 246/255, alpha: 1.0)
    return view
  }()
  
  let orderNameLabel = CustomLabel(string: "Name", font: UIFont.boldSystemFont(ofSize: 14))
  
  let orderNameTextField: CustomTextField = {
    let tf = CustomTextField()
    tf.placeholder = "Enter Name"
    return tf
  }()
  
  let orderNumberLabel = CustomLabel(string: "Id", font: UIFont.boldSystemFont(ofSize: 14))
  
  let orderNumberTextField: CustomTextField = {
    let tf = CustomTextField()
    tf.placeholder = "Enter Order Number"
    tf.keyboardType = .numberPad
    return tf
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    orderNameTextField.delegate = self
    orderNumberTextField.delegate = self
  }
  
  func setupViews(for viewController: UIViewController) {
    viewController.view.addSubview(backgroundView)
    viewController.view.addSubview(orderNameLabel)
    viewController.view.addSubview(orderNameTextField)
    viewController.view.addSubview(orderNumberLabel)
    viewController.view.addSubview(orderNumberTextField)
    
    backgroundView.anchor(top: viewController.view.safeAreaLayoutGuide.topAnchor, leading: viewController.view.leadingAnchor, bottom: nil, trailing: viewController.view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 150))
    
    orderNameLabel.anchor(top: viewController.view.safeAreaLayoutGuide.topAnchor, leading: viewController.view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: .init(width: 50, height: 50))
    
    orderNameTextField.anchor(top: orderNameLabel.topAnchor, leading: orderNameLabel.trailingAnchor, bottom: orderNameLabel.bottomAnchor, trailing: viewController.view.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 8))
    
    orderNumberLabel.anchor(top: orderNameLabel.bottomAnchor, leading: orderNameLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: 50, height: 50))
    
    orderNumberTextField.anchor(top: orderNumberLabel.topAnchor, leading: orderNameTextField.leadingAnchor, bottom: orderNumberLabel.bottomAnchor, trailing: viewController.view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 8))

  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}



















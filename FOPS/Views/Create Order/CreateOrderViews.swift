//
//  CreateOrderViews.swift
//  FOPS
//
//  Created by Vlad Gachi on 30/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class CreateOrderViews: UIView {
  
  // MARK: - Properties
  private let backgroundView      = UIView.backgroundView
  
  private let orderNameLabel      = UILabel.createLabelWith(text: "Name", font: .boldSystemFont(ofSize: 14))
  public let orderNameTextField   = UITextField.orderNameTextField
  
  private let orderNumberLabel    = UILabel.createLabelWith(text: "Id", font: .boldSystemFont(ofSize: 14))
  public let orderNumberTextField = UITextField.orderNumberTextField
  
  
  // MARK: - View Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    orderNameTextField.delegate = self
    orderNumberTextField.delegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - Public Methods
  public func setupViews(for viewController: UIViewController) {
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
}



















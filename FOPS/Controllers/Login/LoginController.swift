//
//  ViewController.swift
//  FOPS
//
//  Created by Vlad Gachi on 10/03/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
///

import UIKit

class LoginController: UIViewController {
  
  // MARK: - Properties
  private let loginView = LoginView()
  
  
  // MARK: - Controller Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override public var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // MARK: - Private Methods
  private func setupView() {
    view.backgroundColor = .darkBlue
    view.addSubview(loginView)
    
    loginView.setupViews(for: self)
    loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
  }
  
  
  // MARK: - Handlers
  @objc private func handleLogin() {
    let despatchOrdersController  = OrdersController(collectionViewLayout: UICollectionViewFlowLayout())
    let navController             = UINavigationController(rootViewController: despatchOrdersController)
    present(navController, animated: true, completion: nil)
  }
}




















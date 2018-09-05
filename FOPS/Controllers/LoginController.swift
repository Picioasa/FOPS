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
  let loginView = LoginView()
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  // MARK: - Methods
  override public var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  private func setupView() {
    view.backgroundColor = .darkBlue
    view.addSubview(loginView)
    
    loginView.setupViews(for: self)
    loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
  }
  
  // MARK: - Handlers
  @objc fileprivate func handleLogin() {
    let despatchOrdersController = OrdersController(collectionViewLayout: UICollectionViewFlowLayout())
    let navController = UINavigationController(rootViewController: despatchOrdersController)

    present(navController, animated: true, completion: nil)
  }
}




















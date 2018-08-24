//
//  ViewController.swift
//  FOPS
//
//  Created by Vlad Gachi on 10/03/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
///

import UIKit

class LoginController: UIViewController {
  
  let loginViews = LoginViews()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .darkBlue
    
    loginViews.setupViews(for: self)
    loginViews.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
  }
  
  override public var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  @objc fileprivate func handleLogin() {
    let despatchOrdersController = OrdersController(collectionViewLayout: UICollectionViewFlowLayout())
    let navController = UINavigationController(rootViewController: despatchOrdersController)

    present(navController, animated: true, completion: nil)
  }
}




















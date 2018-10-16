//
//  AppDelegate.swift
//  FOPS
//
//  Created by Vlad Gachi on 10/03/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    UINavigationBar.appearance().isTranslucent = false
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().barTintColor = .darkBlue
    UINavigationBar.appearance().prefersLargeTitles = true
    UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    self.window = UIWindow()
    self.window?.makeKeyAndVisible()
    
    let despatchOrdersController = OrdersController(collectionViewLayout: UICollectionViewFlowLayout())
    let navController = UINavigationController(rootViewController: despatchOrdersController)
    self.window?.rootViewController = navController
    
//    let loginViewController = LoginController()
//    window?.rootViewController = loginViewController
    
    return true
  }
}


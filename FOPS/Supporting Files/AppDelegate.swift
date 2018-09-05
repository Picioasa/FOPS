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
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    UINavigationBar.appearance().isTranslucent = false
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().barTintColor = .darkBlue
    UINavigationBar.appearance().prefersLargeTitles = true
    UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    
    window = UIWindow()
    window?.makeKeyAndVisible()
    
    let despatchOrdersController = OrdersController(collectionViewLayout: UICollectionViewFlowLayout())
    let navController = UINavigationController(rootViewController: despatchOrdersController)
    
    window?.rootViewController = navController
    
    //    let loginViewController = LoginController()
    //    window?.rootViewController = loginViewController
    
    return true
  }
}


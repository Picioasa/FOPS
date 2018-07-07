//
//  DespatchOrdersViewController.swift
//  FOPS
//
//  Created by Vlad Gachi on 31/03/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit
import CoreData

class OrdersController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let cellId = "cellId"
  
  var orders = [Order]()
  var selectedOrderIndexPath: IndexPath?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Orders"
    
    setupNavigationBarButtons()
    
    collectionView?.alwaysBounceVertical = true
    collectionView?.backgroundColor = .darkBlue
    collectionView?.register(OrdersCell.self, forCellWithReuseIdentifier: cellId)
    
    self.orders = CoreDataManager.shared.fetchOrders()
  }
  
  fileprivate func setupNavigationBarButtons() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear_white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleLogOut))
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(habdleAddOrder))
  }
  
  @objc private func handleLogOut() {
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
      let loginController = LoginController()
      self.present(loginController, animated: true, completion: nil)
    }))
    
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    present(alertController, animated: true, completion: nil)
  }
  
  @objc private func habdleAddOrder() {
    let createOrder = CreateOrderController()
    createOrder.delegate = self
    let navController = UINavigationController(rootViewController: createOrder)
    present(navController, animated: true)
  }
  
  @objc func handleDelete(_ sender: UIButton) {
    guard let cell = sender.superview as? OrdersCell else { return }
    guard let indexPath = collectionView?.indexPath(for: cell) else { return }
    
    let order = orders[indexPath.item]
    
    let context = CoreDataManager.shared.persistentContainer.viewContext
    context.delete(order)
    
    do {
      try context.save()
    } catch let delErr {
      print("Failed to delete order:", delErr)
    }
    
    orders.remove(at: indexPath.item)
    collectionView?.deleteItems(at: [indexPath])
  }
}















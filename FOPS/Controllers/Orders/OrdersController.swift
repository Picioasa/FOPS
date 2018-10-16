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
  
  // MARK: - Properties
  fileprivate let searchController = UISearchController(searchResultsController: nil)
  
  let cellId = "cellId"

  var orders = [Order]()
  var filteredOrders = [Order]()
  var selectedOrderIndexPath: IndexPath?
  
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavigationBar()
    setupCollectionView()
    self.orders = CoreDataManager.shared.fetchOrders()
    filteredOrders = orders
  }
  
  
  // MARK: - Private Methods
  private func setupCollectionView() {
    collectionView?.alwaysBounceVertical = true
    collectionView?.backgroundColor = .darkBlue
    collectionView?.register(OrdersCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  
  private func setupNavigationBar() {
    navigationItem.title = "Orders"

    // Setup Bar Buttons
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear_white").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSettings))
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddOrder))

    // Setup Search Bar
    navigationItem.searchController = searchController
    searchController.searchBar.barStyle = .black
    searchController.dimsBackgroundDuringPresentation = false
    searchController.hidesNavigationBarDuringPresentation = false
    searchController.searchBar.delegate = self
  }
  
  
  // MARK: - Handlers
  @objc private func handleSettings() {
    let alertController = UIAlertController(title: "Settings", message: nil, preferredStyle: .actionSheet)
    
    alertController.addAction(UIAlertAction(title: "Refresh", style: .default, handler: { (_) in
      JSONService.shared.refreshDatabase()
      
      DispatchQueue.main.async {
        self.orders = CoreDataManager.shared.fetchOrders()
        self.filteredOrders = self.orders
        self.collectionView?.reloadData()
      }
    }))
    
    alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
      let loginController = LoginController()
      self.present(loginController, animated: true, completion: nil)
    }))
    
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    present(alertController, animated: true, completion: nil)
  }
  
  
  @objc private func handleAddOrder() {
    let createOrder = CreateOrderController()
    createOrder.delegate = self
    let navController = UINavigationController(rootViewController: createOrder)
    present(navController, animated: true)
  }
  
  
  @objc func handleDelete(_ sender: UIButton) {
    guard let cell = sender.superview as? OrdersCell else { return }
    guard let indexPath = collectionView?.indexPath(for: cell) else { return }
    let order = orders[indexPath.item]
    
    CoreDataManager.shared.delete(order: order)
    orders.remove(at: indexPath.item)
    filteredOrders = orders
    collectionView?.deleteItems(at: [indexPath])
  }
}














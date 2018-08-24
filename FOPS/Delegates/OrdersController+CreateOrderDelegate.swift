//
//  OrdersController+CreateOrderDelegate.swift
//  FOPS
//
//  Created by Vlad Gachi on 30/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import Foundation

extension OrdersController: CreateOrderDelegate {
  
  func didAdd(order: Order) {
    orders.append(order)
    
    let indexPath = IndexPath(row: orders.count - 1, section: 0)
    collectionView?.insertItems(at: [indexPath])
  }
}



















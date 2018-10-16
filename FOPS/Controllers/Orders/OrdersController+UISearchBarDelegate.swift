//
//  OrdersController+UISearchBarDelegate.swift
//  FOPS
//
//  Created by Vlad Gachi on 16/10/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension OrdersController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    if searchText.isEmpty {
      filteredOrders = orders
    } else {
      filteredOrders = self.orders.filter({ (order) -> Bool in
        return order.name?.lowercased().contains(searchText.lowercased()) ?? false
      })
    }
    collectionView?.reloadData()
  }
}


















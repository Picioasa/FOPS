//
//  OrdersController+DepotControllerDelegate.swift
//  FOPS
//
//  Created by Vlad Gachi on 29/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension OrdersController: DepotControllerDelegate {

  func didModifiedOrder() {
    guard let indexPath = self.selectedOrderIndexPath else { return }
    collectionView?.reloadItems(at: [indexPath])
  }
}


























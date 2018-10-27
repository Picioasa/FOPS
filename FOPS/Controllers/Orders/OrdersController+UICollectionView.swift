//
//  OrdersController+UICollectionView.swift
//  FOPS
//
//  Created by Vlad Gachi on 29/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

// MARK: - CollectionViewDataSource
extension OrdersController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filteredOrders.count
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .ordersControllerCellId, for: indexPath) as! OrdersCell
    let order = filteredOrders[indexPath.item]
    cell.order = order
    cell.deleteOrderButton.addTarget(self, action: #selector(handleDelete(_:)), for: .touchUpInside)
    return cell
  }
}


// MARK: - CollectionViewDelegate
extension OrdersController {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 114)
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let depotController = DepotController(collectionViewLayout: UICollectionViewFlowLayout())
    let order = filteredOrders[indexPath.item]
    
    self.selectedOrderIndexPath = indexPath
    depotController.order = order
    depotController.delegate = self
    navigationController?.pushViewController(depotController, animated: true)
  }
}














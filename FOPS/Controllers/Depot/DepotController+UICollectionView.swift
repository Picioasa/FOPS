//
//  DepotController+UICollectionView.swift
//  FOPS
//
//  Created by Vlad Gachi on 07/07/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

// MARK: - CollectionViewDataSource
extension DepotController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
    return pallets.count
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .depotControllerCellId, for: indexPath) as! DepotCell
    cell.pallet = pallets[indexPath.item]
    
    if selectedCells.contains(indexPath) {
      cell.backgroundColor = UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 0.6)
      collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
    } else {
      collectionView.deselectItem(at: indexPath, animated: false)
      cell.backgroundColor = .clear
    }
    return cell
  }
}


// MARK: - CollectionViewDelegate
extension DepotController {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 60)
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selectedCells.add(indexPath)
    selectedRows.insert(indexPath.row)
    collectionView.reloadItems(at: [indexPath])
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    selectedCells.remove(indexPath)
    selectedRows.remove(indexPath.row)
    collectionView.reloadItems(at: [indexPath])
  }
}













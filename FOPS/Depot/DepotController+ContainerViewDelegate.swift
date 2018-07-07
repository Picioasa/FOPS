//
//  DepotController+ContainerViewDelegate.swift
//  FOPS
//
//  Created by Vlad Gachi on 29/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit
import CoreData

extension DepotController: ContainerViewDelegate {

  func didDispatch() {
    if selectedCells.count > 0 {
      var boxes = 0
      var weight = 0.0
      var palletsToDespatched = 0
      for index in selectedRows.sorted().reversed() {
        boxes += Int(pallets[index].boxes)
        weight += pallets[index].weight
        palletsToDespatched += 1
      }

      let alertController = UIAlertController(title: "Confirm Despatch", message: """
        Pallets: \(palletsToDespatched)
        Boxes: \(boxes)
        Weight: \(weight)
        Pallets Remaining: \(pallets.count - palletsToDespatched)
        """, preferredStyle: .alert)

      let despatchAction = UIAlertAction(title: "Yes", style: .default) { (_) in
        let context = CoreDataManager.shared.persistentContainer.viewContext

        for index in self.selectedRows.sorted().reversed() {
          let removedPallet = self.pallets.remove(at: index)
          context.delete(removedPallet)
        }
        
        self.order?.despatchedPallets += Int64(palletsToDespatched)
        self.order?.boxesDone += Int64(boxes)
        
        do {
          try context.save()
        } catch let err {
          print("Failed to despatch pallets:", err)
        }
        
        self.weight = weight
        self.selectedRows.removeAll()
        self.selectedCells.removeAllObjects()
        self.delegate?.didModifiedOrder()
        self.collectionView?.reloadData()
      }

      let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)

      alertController.addAction(despatchAction)
      alertController.addAction(cancelAction)
      present(alertController, animated: true, completion: nil)
    }
  }

  func didDismantle() {
    let context = CoreDataManager.shared.persistentContainer.viewContext

    if selectedCells.count > 0 {
      
      for index in selectedRows.sorted().reversed() {
        let removedPallet = pallets.remove(at: index)
        context.delete(removedPallet)
      }
      selectedRows.removeAll()
      selectedCells.removeAllObjects()
    }
    
    do {
      try context.save()
    } catch let err {
      print("Failed to dismantle pallets:", err)
    }

    self.delegate?.didModifiedOrder()
    collectionView?.reloadData()
  }

  func didPrint() {

    let printInfo = UIPrintInfo(dictionary: nil)
    printInfo.jobName = "Vehicle Manifest"
    printInfo.outputType = .general

    let printController = UIPrintInteractionController.shared
    printController.printInfo = printInfo
    printController.showsNumberOfCopies = true
    printController.printingItem = "Vehicle Manifest"

    printController.present(animated: true, completionHandler: nil)
  }
}



























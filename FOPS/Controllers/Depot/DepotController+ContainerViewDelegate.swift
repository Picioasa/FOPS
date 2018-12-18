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

  // Dispatch selected products and update the order's values
  func didDispatch() {
    // Check if multiple rows are selected
    if selectedCells.count > 0 {
      var boxes                 = 0
      var weight                = 0.0
      var palletsToBeDespatched = 0
      // Update boxes, weight, and palletsToBeDespatched with the selected values
      for index in selectedRows.sorted().reversed() {
        boxes                 += Int(pallets[index].boxes)
        weight                += pallets[index].weight
        palletsToBeDespatched += 1
      }
      // Present an alert controller with selected values
      let alertController = UIAlertController(title: "Confirm Despatch", message: """
        Pallets: \(palletsToBeDespatched)
        Boxes: \(boxes)
        Weight: \(weight.rounded(toDecimalPlaces: 1))
        Pallets Remaining: \(pallets.count - palletsToBeDespatched)
        """, preferredStyle: .alert)

      let despatchAction = UIAlertAction(title: "Yes", style: .default) { (_) in
        let context = CoreDataManager.shared.persistentContainer.viewContext
        // Remove the selected pallets from database
        for index in self.selectedRows.sorted().reversed() {
          let removedPallet = self.pallets.remove(at: index)
          context.delete(removedPallet)
        }
        // Update despatchePallets and boxesDone fields with the processed values
        self.order?.despatchedPallets += Int64(palletsToBeDespatched)
        self.order?.boxesDone         += Int64(boxes)
        // Save the changes into database
        do {
          try context.save()
        } catch let err {
          print("Failed to despatch pallets:", err)
        }
        // Clean up the view
        self.totalWeight = weight
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

  // Delete selected products and update the order's values
  func didDismantle() {
    let context = CoreDataManager.shared.persistentContainer.viewContext
    // If one product or more is selected then delete it
    if selectedCells.count > 0 {
      for index in selectedRows.sorted().reversed() {
        let removedPallet = pallets.remove(at: index)
        context.delete(removedPallet)
      }
      // selectedRows, selectedCells - Keep track of the multiple selections
      selectedRows.removeAll()
      selectedCells.removeAllObjects()
    }
    // Save the changes into database
    do {
      try context.save()
    } catch let err {
      print("Failed to dismantle pallets:", err)
    }
    // Update Order Cell
    self.delegate?.didModifiedOrder()
    collectionView?.reloadData()
  }

  // Generates paperwork for the shipped products and tries to print them
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



























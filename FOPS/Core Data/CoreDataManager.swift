//
//  CoreDataManager.swift
//  FOPS
//
//  Created by Vlad Gachi on 30/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import CoreData

struct CoreDataManager {
  
  // MARK: - Properties
  static let shared = CoreDataManager()
  
  let persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "FopsModel")
    container.loadPersistentStores(completionHandler: { (storeDescription, err) in
      if let err = err { fatalError("Failed to load store: \(err)") }
    })
    return container
  }()
  
  
  // MARK: - Methods
  func fetchOrders() -> [Order] {
    let context = persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<Order>(entityName: "Order")
    do {
      let orders = try context.fetch(fetchRequest)
      return orders
    } catch let fetchErr {
      print("Failed to fetch orders:", fetchErr)
      return []
    }
  }
  
  
  func delete(order: Order) {
    let context = persistentContainer.viewContext
    
    context.delete(order)
    
    do {
      try context.save()
    } catch let delErr {
      print("Failed to delete order:", delErr)
    }
  }

  
  func addPallet(for order: Order) -> Pallet? {
    let context = persistentContainer.viewContext
    let pallet = NSEntityDescription.insertNewObject(forEntityName: "Pallet", into: context) as! Pallet
    
    pallet.order = order
    
    let palletNumber = Int.random(in: 1...100)
    let boxesNumber = Int.random(in: 3...135)
    let products = ["TAF5254D", "TAF3000D", "TAB6478D", "TAF5704D", "TAB0373D", "TAB4722D", "TAB6843D", "TAB3941D", "TAB8867D", "TAF1793D", "TAB9865D", "TAB8297D"]
    let randomProduct = Int.random(in: 0..<products.count)
    
    let sevenDaysInSeconds = TimeInterval(604800)
    
    let currentDate = Date()
    let date = currentDate.addingTimeInterval(sevenDaysInSeconds)
    
    pallet.setValue(palletNumber, forKey: "number")
    pallet.setValue(boxesNumber, forKey: "boxes")
    pallet.setValue(products[randomProduct], forKey: "product")
    pallet.setValue(76.2, forKey: "weight")
    pallet.setValue(date, forKey: "date")
    
    do {
      try context.save()
      return pallet
    } catch let err {
      print("Failed to create pallet:", err)
      return nil
    }
  }
  
}












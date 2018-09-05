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
}












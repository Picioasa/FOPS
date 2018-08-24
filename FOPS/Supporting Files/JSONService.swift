//
//  JSONService.swift
//  FOPS
//
//  Created by Vlad Gachi on 13/07/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import Foundation

struct JSONService {
  static let shared = JSONService()
  
  func refreshDatabase() {
    guard let url = Bundle.main.url(forResource: "depots", withExtension: "json")
      else { fatalError("Unable to find depots.json in project") }
    
    let jsonDecoder = JSONDecoder()
    
    do {
      let data = try Data(contentsOf: url)
      let jsonDepots = try jsonDecoder.decode([JSONOrder].self, from: data)
      
      CoreDataManager.shared.persistentContainer.performBackgroundTask { (backgroundContext) in
        
        jsonDepots.forEach({ (jsonDepot) in
          let order = Order(context: backgroundContext)
          
          order.id = Int64(jsonDepot.id)
          order.name = jsonDepot.name
          order.despatchedPallets = Int64(jsonDepot.despatchedPallets)
          order.boxesDone = Int64(jsonDepot.boxesDone)
          
          order.pallets?.forEach({ (jsonPallet) in
            let pallet = Pallet(context: backgroundContext)
            
            pallet.number = (jsonPallet as! Pallet).number
            pallet.product = (jsonPallet as! Pallet).product
            pallet.boxes = (jsonPallet as! Pallet).boxes
            pallet.date = (jsonPallet as! Pallet).date
            pallet.weight = (jsonPallet as! Pallet).weight
            pallet.order = order
          })
        })
        
        do {
          try backgroundContext.save()
          
        } catch let createErr {
          print("Failed to create company on background thread: \(createErr)")
        }
        
      }
      
      
    } catch let decodeErr {
      print("Failed to decode json: \(decodeErr)")
    }
    
  }
}

struct JSONOrder: Decodable {
  let id: Int
  let name: String
  let despatchedPallets: Int
  let boxesDone: Int
  let pallets: [JSONPallet]?
}

struct JSONPallet: Decodable {
  let number: Int
  let product: String
  let boxes: Int
  let date: String // to be modified
  let weight: Double
}

















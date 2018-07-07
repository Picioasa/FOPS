//
//  DepotController.swift
//  FOPS
//
//  Created by Vlad Gachi on 22/05/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit
import CoreData

protocol DepotControllerDelegate {
  func didModifiedOrder()
}

class DepotController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var order: Order?
  var selectedCells: NSMutableArray = []
  var selectedRows = Set<Int>()
  var pallets: [Pallet] = []
  var delegate: DepotControllerDelegate?
  var weight: Double = 0.0
  
  let cellId = "cellId"
  
  fileprivate lazy var containerView: UIView = {
    let cv = ContainerView()
    cv.delegate = self
    cv.backgroundColor = .white
    return cv
  }()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.title = order?.name
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.backgroundColor = .white
    collectionView?.alwaysBounceVertical = true
    collectionView?.allowsMultipleSelection = true
    collectionView?.register(DepotCell.self, forCellWithReuseIdentifier: cellId)
    
    collectionView?.addSubview(containerView)
    containerView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0 , right: 0), size: .init(width: 0, height: 60))
    
    setupAddingPalletsButton()
    fetchPallets()
  }
  
  fileprivate func fetchPallets() {
    guard let orderPallets = order?.pallets?.allObjects as? [Pallet] else { return }
    
    pallets = orderPallets
  }
  
  fileprivate func setupAddingPalletsButton() {
    //    guard let order = order else { return }
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddingPallet))
    
    //    switch order.status {
    //    case .COMP, .DESP, .HOLD:
    //      navigationItem.rightBarButtonItem?.isEnabled = false
    //    case .WIP:
    //      navigationItem.rightBarButtonItem?.isEnabled = true
    //    }
  }
  
  @objc fileprivate func handleAddingPallet() {
    let context = CoreDataManager.shared.persistentContainer.viewContext
    let pallet = NSEntityDescription.insertNewObject(forEntityName: "Pallet", into: context) as! Pallet
    
    pallet.order = order
    
    let palletNumber = Int(arc4random_uniform(100) + 1)
    let boxesNumber = Int(arc4random_uniform(135) + 3)
    let products = ["TAF5254D", "TAF3000D", "TAB6478D", "TAF5704D", "TAB0373D", "TAB4722D", "TAB6843D", "TAB3941D", "TAB8867D", "TAF1793D", "TAB9865D", "TAB8297D"]
    let randomProduct = Int(arc4random_uniform(UInt32(products.count)))
    let currentDate = Date()
    let sevenDays = TimeInterval(604800)
    let date = currentDate.addingTimeInterval(sevenDays)
    
    pallet.setValue(palletNumber, forKey: "number")
    pallet.setValue(boxesNumber, forKey: "boxes")
    pallet.setValue(products[randomProduct], forKey: "product")
    pallet.setValue(76.2, forKey: "weight")
    pallet.setValue(date, forKey: "date")
    
    do {
      try context.save()
      weight += pallet.weight
      pallets.append(pallet)
      order?.pallets?.adding(pallet)
      delegate?.didModifiedOrder()
      collectionView?.reloadData()
    } catch let err {
      print("Failed to create pallet:", err)
    }
  }
}
















//
//  DepotController.swift
//  FOPS
//
//  Created by Vlad Gachi on 22/05/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit
import CoreData

protocol DepotControllerDelegate: class {
  func didModifiedOrder()
}

class DepotController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  // MARK: - Properties
  var order: Order!
  var selectedCells: NSMutableArray = []
  var selectedRows = Set<Int>()
  var pallets: [Pallet] = []
  var totalWeight: Double = 0.0
  
  weak var delegate: DepotControllerDelegate?
  
  
  fileprivate lazy var containerView: DepotContainerView = {
    let cv = DepotContainerView()
    cv.delegate = self
    cv.backgroundColor = .white
    return cv
  }()
  
  
  // MARK: - View Lifecycle
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.title = order?.name
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
    
    setupCollectionView()
    setupAddingPalletsButton()
    fetchPallets()
  }
  
  
  // MARK: - Private Methods
  private func setupCollectionView() {
    collectionView?.backgroundColor = .white
    collectionView?.alwaysBounceVertical = true
    collectionView?.allowsMultipleSelection = true
    collectionView?.register(DepotCell.self, forCellWithReuseIdentifier: .depotControllerCellId)
    
    collectionView?.addSubview(containerView)
    containerView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0 , right: 0), size: .init(width: 0, height: 60))
  }
  
  
  fileprivate func fetchPallets() {
    guard let orderPallets = order?.pallets?.allObjects as? [Pallet] else { return }
    pallets = orderPallets
  }
  
  
  fileprivate func setupAddingPalletsButton() {
    #warning("Handle Order Status")
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddingPallet))
  }
  
  
  // MARK: - Handlers
  @objc fileprivate func handleAddingPallet() {
    guard let pallet = CoreDataManager.shared.addPallet(for: self.order) else { return }
    pallets.append(pallet)
    totalWeight += pallet.weight
    order?.pallets?.adding(pallet)
    order?.activeBoxes += pallet.boxes
    delegate?.didModifiedOrder()
    collectionView?.reloadData()
  }
}
















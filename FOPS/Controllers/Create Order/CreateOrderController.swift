//
//  CreateOrderController.swift
//  FOPS
//
//  Created by Vlad Gachi on 30/06/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit
import CoreData

protocol CreateOrderDelegate: class {
  func didAdd(order: Order)
}

class CreateOrderController: UIViewController {
  
  // MARK: - Properties
  private let createOrderViews = CreateOrderViews()
  
  weak var delegate: CreateOrderDelegate?
  
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setupNavigationBar()
    createOrderViews.setupViews(for: self)
  }
  
  
  // MARK: - Private Methods
  private func setupNavigationBar() {
    navigationItem.title = "Create Order"

    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(handleCreate))
  }
  
  
  // MARK: - Handlers
  @objc private func handleCancel() {
    dismiss(animated: true, completion: nil)
  }
  
  
  @objc private func handleCreate() {
    let context = CoreDataManager.shared.persistentContainer.viewContext
    let order = NSEntityDescription.insertNewObject(forEntityName: "Order", into: context)
    
    order.setValue(createOrderViews.orderNameTextField.text, forKey: "name")
    order.setValue(Int(createOrderViews.orderNumberTextField.text ?? ""), forKey: "id")
    
    do {
      try context.save()
    } catch let saveErr {
      print("Failed to create order:", saveErr)
    }
    
    dismiss(animated: true) {
      self.delegate?.didAdd(order: order as! Order)
    }
  }
}



















////
//  DepotContainerView.swift
//  FOPS
//
//  Created by Vlad Gachi on 23/05/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

protocol ContainerViewDelegate: class {
  func didDispatch()
  func didDismantle()
  func didPrint()
}

class DepotContainerView: UIView {
  
  //MARK: - Properties
  weak var delegate: ContainerViewDelegate?
  
  private lazy var despatchButton   = UIButton.createButtonWith(image: #imageLiteral(resourceName: "delivery-truck"))
  private lazy var dismantleButton  = UIButton.createButtonWith(image: #imageLiteral(resourceName: "bomb-2"))
  private lazy var printButton      = UIButton.createButtonWith(image: #imageLiteral(resourceName: "printer-2"))
  
  
  // MARK: - View Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupButtons()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - Private Methods
  private func setupButtons() {
    let separatorView             = UIView()
    separatorView.backgroundColor = UIColor(white: 0, alpha: 0.7)
    
    let stackView           = UIStackView(arrangedSubviews: [despatchButton, dismantleButton, printButton])
    stackView.axis          = .horizontal
    stackView.distribution  = .fillEqually
    
    addSubview(separatorView)
    addSubview(stackView)
    
    separatorView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0 , right: 0), size: .init(width: 0, height: 1))
    
    stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 4, bottom: 4, right: 4))
    
    addTargetActions()
  }
  
  private func addTargetActions() {
    despatchButton.addTarget(self, action: #selector(handleDispatch), for: .touchUpInside)
    dismantleButton.addTarget(self, action: #selector(handleDismantle), for: .touchUpInside)
    printButton.addTarget(self, action: #selector(handlePrinting), for: .touchUpInside)
  }
  
  // MARK: - Handlers
  @objc private func handleDispatch() {
    delegate?.didDispatch()
  }
  
  @objc private func handleDismantle() {
    delegate?.didDismantle()
  }
  
  @objc private func handlePrinting() {
    delegate?.didPrint()
  }
}













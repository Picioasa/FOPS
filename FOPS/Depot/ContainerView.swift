////
//  ContainerView.swift
//  FOPS
//
//  Created by Vlad Gachi on 23/05/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

protocol ContainerViewDelegate {
  func didDispatch()
  func didDismantle()
  func didPrint()
}

class ContainerView: UIView {
  
  var delegate: ContainerViewDelegate?
  
  fileprivate lazy var despatchButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "delivery-truck").withRenderingMode(.alwaysOriginal), for: .normal)
    button.addTarget(self, action: #selector(handleDespatching), for: .touchUpInside)
    return button
  }()
  
  fileprivate lazy var dismantleButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "bomb-2").withRenderingMode(.alwaysOriginal), for: .normal)
    button.addTarget(self, action: #selector(handleDismantling), for: .touchUpInside)
    return button
  }()
  
  fileprivate lazy var printButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "printer-2").withRenderingMode(.alwaysOriginal), for: .normal)
    button.addTarget(self, action: #selector(handlePrinting), for: .touchUpInside)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupButtons()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupButtons() {
    let separatorView = UIView()
    separatorView.backgroundColor = UIColor(white: 0, alpha: 0.7)
    
    let stackView = UIStackView(arrangedSubviews: [despatchButton, dismantleButton, printButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    
    addSubview(separatorView)
    addSubview(stackView)
    
    separatorView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0 , right: 0), size: .init(width: 0, height: 1))
    
    stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 4, bottom: 4, right: 4))
  }
  
  @objc fileprivate func handleDespatching() {
    delegate?.didDispatch()
  }
  
  @objc fileprivate func handleDismantling() {
    delegate?.didDismantle()
  }
  
  @objc fileprivate func handlePrinting() {
    delegate?.didPrint()
  }
}













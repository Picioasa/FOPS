//
//  OrdersCell.swift
//  FOPS
//
//  Created by Vlad Gachi on 02/04/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class OrdersCell: UICollectionViewCell {
  
  // MARK: - Properties
  var order: Order? {
    didSet {
      setupAttributedText()
    }
  }
  
  fileprivate let orderNameLabel = UILabel()
  fileprivate let orderIdLabel = UILabel()
  fileprivate let activePalletsLabel = UILabel()
  fileprivate let despatchedPalletsLabel = UILabel()
  fileprivate let boxesLabel = UILabel()
  fileprivate let doneLabel = UILabel()
  
  // MARK: - Computed Properties
  fileprivate let statusLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.numberOfLines = 0
    let attributedText = NSMutableAttributedString(string: "Status:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    attributedText.append(NSAttributedString(string: " WIP", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.blue]))
    label.attributedText = attributedText
    return label
  }()
  
  fileprivate lazy var openDepotButton: CustomButton = {
    let btn = CustomButton(title: "+", textColor: UIColor.black, textFont: UIFont.boldSystemFont(ofSize: 24), backgroundColor: UIColor.clear)
    return btn
  }()
  
  fileprivate lazy var closeDepotButton: CustomButton = {
    let btn = CustomButton(title: "-", textColor: UIColor.black, textFont: UIFont.boldSystemFont(ofSize: 24), backgroundColor: UIColor.clear)
    return btn
  }()
  
  lazy var deleteOrderButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "Delete").withRenderingMode(.alwaysOriginal), for: .normal)
    return button
  }()
  
  // MARK: - Object Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor =  UIColor.init(red: 247/255, green: 247/255, blue: 246/255, alpha: 1.0)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private Methods
  fileprivate func setupViews() {
    let separatorView = UIView()
    separatorView.backgroundColor = UIColor(white: 0, alpha: 0.2)
    
    let separatorView2 = UIView()
    separatorView2.backgroundColor = UIColor(white: 0, alpha: 0.2)
    
    let buttonStackView = UIStackView(arrangedSubviews: [openDepotButton, closeDepotButton])
    buttonStackView.axis = .horizontal
    buttonStackView.distribution = .fillEqually
    
    addSubview(orderNameLabel)
    addSubview(deleteOrderButton)
    addSubview(orderIdLabel)
    addSubview(statusLabel)
    addSubview(buttonStackView)
    addSubview(separatorView)
    addSubview(activePalletsLabel)
    addSubview(boxesLabel)
    addSubview(separatorView2)
    addSubview(despatchedPalletsLabel)
    addSubview(doneLabel)
    
    orderNameLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 0))
    
    deleteOrderButton.anchor(top: nil, leading: orderNameLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0), size: .init(width: 25, height: 25))
    deleteOrderButton.centerYAnchor.constraint(equalTo: orderNameLabel.centerYAnchor).isActive = true
    
    orderIdLabel.anchor(top: orderNameLabel.bottomAnchor, leading: orderNameLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
    
    statusLabel.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 12))
    
    buttonStackView.anchor(top: statusLabel.bottomAnchor, leading: statusLabel.leadingAnchor, bottom: nil, trailing: statusLabel.trailingAnchor, padding: .init(top: -4, left: 0, bottom: 0, right: 0))
    
    separatorView.anchor(top: orderIdLabel.bottomAnchor, leading: orderIdLabel.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    
    activePalletsLabel.anchor(top: separatorView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 8, bottom: 0, right: 0))
    
    boxesLabel.anchor(top: separatorView.bottomAnchor, leading: doneLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
    
    separatorView2.anchor(top: activePalletsLabel.bottomAnchor, leading: activePalletsLabel.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    
    despatchedPalletsLabel.anchor(top: separatorView2.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 4, left: 8, bottom: 8, right: 0))
    
    doneLabel.anchor(top: separatorView2.bottomAnchor, leading: despatchedPalletsLabel.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 4, left: 24, bottom: 8, right: 0))
  }
  
  fileprivate func setupAttributedText() {
    guard let order = order else { return }
    
    let orderNameAttributedText = NSMutableAttributedString(string: "\(order.name ?? "")", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
    
    let orderIdAttributedText = NSMutableAttributedString(string: "\(order.id)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)])
    
    let activePalletsAttributedText = NSMutableAttributedString(string: "Active Pallets:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    activePalletsAttributedText.append(NSAttributedString(string: " \(order.pallets?.count ?? 0)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))

    let despathedPalletsAttributedText = NSMutableAttributedString(string: "Despatched Pallets:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    despathedPalletsAttributedText.append(NSAttributedString(string: " \(order.despatchedPallets)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    let boxesAttributedText = NSMutableAttributedString(string: "Boxes:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    boxesAttributedText.append(NSAttributedString(string: " \(order.activeBoxes)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    let doneAttributedText = NSMutableAttributedString(string: "Done:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    doneAttributedText.append(NSAttributedString(string: " \(order.boxesDone)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    orderNameLabel.attributedText = orderNameAttributedText
    orderIdLabel.attributedText = orderIdAttributedText
    activePalletsLabel.attributedText = activePalletsAttributedText
    despatchedPalletsLabel.attributedText = despathedPalletsAttributedText
    boxesLabel.attributedText = boxesAttributedText
    doneLabel.attributedText = doneAttributedText
  }
}

















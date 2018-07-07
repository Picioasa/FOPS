//
//  OrdersCell.swift
//  FOPS
//
//  Created by Vlad Gachi on 02/04/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class OrdersCell: UICollectionViewCell {
  
  var order: Order? {
    didSet {
      setupAttributedText()
    }
  }
  
  var numberOfBoxes = 0
  
  fileprivate let orderNameLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  fileprivate let orderIdLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  fileprivate let activePalletsLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  fileprivate let boxesLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  fileprivate let despatchedPalletsLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  fileprivate let doneLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  fileprivate let statusLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.numberOfLines = 0
    let attributedText = NSMutableAttributedString(string: "Status", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    attributedText.append(NSAttributedString(string: " WIP", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.blue]))
    label.attributedText = attributedText
    
    return label
  }()
  
  fileprivate lazy var openDepotButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("+", for: .normal)
    button.tintColor = .black
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 0)
    //    button.addTarget(self, action: #selector(handleOpenDepot), for: .touchUpInside)
    return button
  }()
  
  fileprivate lazy var closeDepotButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("-", for: .normal)
    button.tintColor = .black
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    //    button.addTarget(self, action: #selector(handleCloseDepot), for: .touchUpInside)
    return button
  }()
  
  lazy var deleteOrderButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "Delete").withRenderingMode(.alwaysOriginal), for: .normal)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor =  UIColor.init(red: 247/255, green: 247/255, blue: 246/255, alpha: 1.0)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews() {
    let separatorView = UIView()
    separatorView.backgroundColor = UIColor(white: 0, alpha: 0.2)
    
    let separatorView2 = UIView()
    separatorView2.backgroundColor = UIColor(white: 0, alpha: 0.2)
    
    addSubview(orderNameLabel)
    addSubview(deleteOrderButton)
    addSubview(orderIdLabel)
    addSubview(statusLabel)
    addSubview(openDepotButton)
    addSubview(closeDepotButton)
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
    
    statusLabel.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 8))
    
    openDepotButton.anchor(top: statusLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 4, left: 8, bottom: 0, right: 0), size: .init(width: 40, height: 40))
    
    closeDepotButton.anchor(top: statusLabel.bottomAnchor, leading: openDepotButton.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 8, bottom: 0, right: 8), size: .init(width: 40, height: 40))
    
    separatorView.anchor(top: orderIdLabel.bottomAnchor, leading: orderIdLabel.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    
    activePalletsLabel.anchor(top: separatorView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 8, bottom: 0, right: 0))
    
    boxesLabel.anchor(top: separatorView.bottomAnchor, leading: doneLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
    
    separatorView2.anchor(top: activePalletsLabel.bottomAnchor, leading: activePalletsLabel.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    
    despatchedPalletsLabel.anchor(top: separatorView2.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 4, left: 8, bottom: 8, right: 0))
    
    doneLabel.anchor(top: separatorView2.bottomAnchor, leading: despatchedPalletsLabel.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 4, left: 24, bottom: 8, right: 0))
  }
  
  fileprivate func setupAttributedText() {
    guard let order = order else { return }
    
    let orderNameAttributedText = NSMutableAttributedString(string: "\(order.name ?? "")", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
    
    let orderIdAttributedText = NSMutableAttributedString(string: " \(order.id)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)])
    
    let palletsNumberAttributedText = NSMutableAttributedString(string: "Active Pallets:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    palletsNumberAttributedText.append(NSAttributedString(string: " \(order.pallets?.count ?? 0)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    let despatchedAttributedText = NSMutableAttributedString(string: "Despatched Pallets:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    despatchedAttributedText.append(NSAttributedString(string: " \(order.despatchedPallets)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    let boxesAttributedText = NSMutableAttributedString(string: "Boxes:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    boxesAttributedText.append(NSAttributedString(string: " \(numberOfBoxes)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    let boxesDoneAttributedText = NSMutableAttributedString(string: "Done:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    boxesDoneAttributedText.append(NSAttributedString(string: " \(order.boxesDone)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    
    //    let StatusAttributedText = NSMutableAttributedString(string: "Status: ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    
    
    //    if order.status == Status.HOLD {
    //      StatusAttributedText.append(NSAttributedString(string: "\(order.status)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.red]))
    //    } else if order.status == Status.COMP {
    //      StatusAttributedText.append(NSAttributedString(string: "\(order.status)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.purple]))
    //    } else if order.status == Status.DESP {
    //      StatusAttributedText.append(NSAttributedString(string: "\(order.status)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.green]))
    //    } else {
    //      StatusAttributedText.append(NSAttributedString(string: "\(order.status)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.blue]))
    //    }
    
    orderNameLabel.attributedText = orderNameAttributedText
    orderIdLabel.attributedText = orderIdAttributedText
    activePalletsLabel.attributedText = palletsNumberAttributedText
    despatchedPalletsLabel.attributedText = despatchedAttributedText
    boxesLabel.attributedText = boxesAttributedText
    doneLabel.attributedText = boxesDoneAttributedText
    //    statusLabel.attributedText = StatusAttributedText
  }
  
  //  @objc fileprivate func handleOpenDepot() {
  //    if order?.status == Status.HOLD {
  //      order?.status = .WIP
  //      let attributedText = NSMutableAttributedString(string: "Status: ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
  //      attributedText.append(NSAttributedString(string: "WIP", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.blue]))
  //
  //      statusLabel.attributedText = attributedText
  //    } else if order?.status == Status.WIP {
  //      order?.status = .COMP
  //
  //      let attributedText = NSMutableAttributedString(string: "Status: ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
  //      attributedText.append(NSAttributedString(string: "COMP", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.purple]))
  //
  //      statusLabel.attributedText = attributedText
  //    } else if order?.status == Status.COMP {
  //      order?.status = .DESP
  //
  //      let attributedText = NSMutableAttributedString(string: "Status: ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
  //      attributedText.append(NSAttributedString(string: "DESP", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.green]))
  //
  //      statusLabel.attributedText = attributedText
  //    }
  //  }
  
  //  @objc fileprivate func handleCloseDepot() {
  //    if order?.status == Status.WIP {
  //      order?.status = .HOLD
  //
  //      let attributedText = NSMutableAttributedString(string: "Status: ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
  //      attributedText.append(NSAttributedString(string: "HOLD", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.red]))
  //
  //      statusLabel.attributedText = attributedText
  //    } else if order?.status == Status.COMP {
  //      order?.status = .WIP
  //
  //      let attributedText = NSMutableAttributedString(string: "Status: ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
  //      attributedText.append(NSAttributedString(string: "WIP", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.blue]))
  //
  //      statusLabel.attributedText = attributedText
  //    } else if order?.status == Status.DESP {
  //      order?.status = .COMP
  //
  //      let attributedText = NSMutableAttributedString(string: "Status: ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
  //      attributedText.append(NSAttributedString(string: "COMP", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.purple]))
  //
  //      statusLabel.attributedText = attributedText
  //    }
  //  }
}

















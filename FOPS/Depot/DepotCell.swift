//
//  DepotCell.swift
//  FOPS
//
//  Created by Vlad Gachi on 23/05/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class DepotCell: UICollectionViewCell {
  
  var pallet: Pallet? {
    didSet {
      setupAttributedText()
    }
  }
  
  fileprivate let palletNumberLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  fileprivate let boxesLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  fileprivate let productLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  fileprivate let maxLifeLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews() {
    let topSeparatorView = UIView()
    topSeparatorView.backgroundColor = UIColor(white: 0, alpha: 0.6)
    
    let middleSeparatorView = UIView()
    middleSeparatorView.backgroundColor = UIColor(white: 0, alpha: 0.2)
    
    let bottomSeparatorView = UIView()
    bottomSeparatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    
    addSubview(topSeparatorView)
    addSubview(palletNumberLabel)
    addSubview(boxesLabel)
    addSubview(middleSeparatorView)
    addSubview(productLabel)
    addSubview(maxLifeLabel)
    addSubview(bottomSeparatorView)
    
    palletNumberLabel.anchor(top: topSeparatorView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 0))
    
    boxesLabel.anchor(top: topAnchor, leading: maxLifeLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
    
    middleSeparatorView.anchor(top: palletNumberLabel.bottomAnchor, leading: palletNumberLabel.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    
    productLabel.anchor(top: middleSeparatorView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 8, bottom: 0, right: 0))
    
    maxLifeLabel.anchor(top: middleSeparatorView.bottomAnchor, leading: productLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 20, bottom: 0, right: 0))
    
    bottomSeparatorView.anchor(top: nil, leading: productLabel.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 1))
  }
  
  fileprivate func setupAttributedText() {
    guard let pallet = pallet else { return }
    
    let numberAttributedText = NSMutableAttributedString(string: "Pallet Number:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    numberAttributedText.append(NSAttributedString(string: " \(String(pallet.number))", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    let boxesAttributedText = NSMutableAttributedString(string: "Boxes:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    boxesAttributedText.append(NSAttributedString(string: " \(String(pallet.boxes))", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    let productAttributedText = NSMutableAttributedString(string: "Product:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    productAttributedText.append(NSAttributedString(string: " \(pallet.product ?? "")", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    let maxLifeAttributedText = NSMutableAttributedString(string: "Max Life:", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, yyyy"
    let date = dateFormatter.string(from: pallet.date ?? "")
    maxLifeAttributedText.append(NSAttributedString(string: " \(date)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
    
    palletNumberLabel.attributedText = numberAttributedText
    boxesLabel.attributedText = boxesAttributedText
    productLabel.attributedText = productAttributedText
    maxLifeLabel.attributedText = maxLifeAttributedText
  }
  
}















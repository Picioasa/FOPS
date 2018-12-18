//
//  DepotCell.swift
//  FOPS
//
//  Created by Vlad Gachi on 23/05/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class DepotCell: UICollectionViewCell {
  
  // MARK: - Properties
  var pallet: Pallet? {
    didSet {
      setupAttributedText()
    }
  }
  
  private let palletNumberLabel = UILabel()
  private let boxesLabel        = UILabel()
  private let productLabel      = UILabel()
  private let maxLifeLabel      = UILabel()
  
  
  // MARK: - View Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViewsAndConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  // MARK: - Private Methods
  private func setupViewsAndConstraints() {
    let middleSeparatorView = UIView()
    middleSeparatorView.backgroundColor = UIColor(white: 0, alpha: 0.2)
    
    let bottomSeparatorView = UIView()
    bottomSeparatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    
    addSubview(palletNumberLabel)
    addSubview(boxesLabel)
    addSubview(middleSeparatorView)
    addSubview(productLabel)
    addSubview(maxLifeLabel)
    addSubview(bottomSeparatorView)
    
    palletNumberLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 0))
    
    boxesLabel.anchor(top: topAnchor, leading: maxLifeLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
    
    middleSeparatorView.anchor(top: palletNumberLabel.bottomAnchor, leading: palletNumberLabel.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
    
    productLabel.anchor(top: middleSeparatorView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 8, bottom: 0, right: 0))
    
    maxLifeLabel.anchor(top: middleSeparatorView.bottomAnchor, leading: productLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 20, bottom: 0, right: 0))
    
    bottomSeparatorView.anchor(top: nil, leading: productLabel.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 1))
  }
  
  
  private func setupAttributedText() {
    guard let pallet = pallet else { return }
    
    let numberAttributedText  = NSMutableAttributedString.attributedText("Pallet Number:", and: " \(String(pallet.number))")
    let boxesAttributedText   = NSMutableAttributedString.attributedText("Boxes", and: " \(String(pallet.boxes))")
    let productAttributedText = NSMutableAttributedString.attributedText("Product:", and: " \(pallet.product ?? "")")
    
    let dateFormatter         = DateFormatter()
    dateFormatter.dateFormat  = "MMM dd, yyyy"
    let stringDate            = dateFormatter.string(from: pallet.date ?? "")
    
    let maxLifeAttributedText = NSMutableAttributedString.attributedText("Max Life:", and:  " \(stringDate)")
    
    palletNumberLabel.attributedText = numberAttributedText
    boxesLabel.attributedText        = boxesAttributedText
    productLabel.attributedText      = productAttributedText
    maxLifeLabel.attributedText      = maxLifeAttributedText
  }
}















//
//  CustomButton.swift
//  FOPS
//
//  Created by Vlad Gachi on 23/08/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
  
  // MARK: - Object Lifecycle
  init(title: String, textColor: UIColor = UIColor.black, textFont: UIFont = UIFont.boldSystemFont(ofSize: 14), backgroundColor: UIColor = UIColor.clear) {
    super.init(frame: .zero)
    let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: textFont])
    
    self.setAttributedTitle(attributedTitle, for: .normal)
    self.backgroundColor = backgroundColor
    self.layer.cornerRadius = 3
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


























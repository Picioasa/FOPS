//
//  CustomTextField.swift
//  FOPS
//
//  Created by Vlad Gachi on 23/08/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
  
  override init(frame: CGRect) {
    
    super.init(frame: frame)
    
    borderStyle = .roundedRect
    returnKeyType = .done
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

























//
//  CreateOrderViews+UITextFieldDelegate.swift
//  FOPS
//
//  Created by Vlad Gachi on 16/10/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension CreateOrderViews: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // Switch to the next textField upon hitting done button
    if textField == orderNameTextField {
      orderNameTextField.resignFirstResponder()
      orderNumberTextField.becomeFirstResponder()
      
    } else if textField == orderNumberTextField {
      orderNumberTextField.resignFirstResponder()
      return true
    }
    
    return false
  }
}























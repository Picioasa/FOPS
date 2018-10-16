//
//  LoginView+UITextFieldDelegate.swift
//  FOPS
//
//  Created by Vlad Gachi on 16/10/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension LoginView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    if textField == usernameTextField {
      usernameTextField.resignFirstResponder()
      passwordTextField.becomeFirstResponder()
      
    } else if textField == passwordTextField {
      passwordTextField.resignFirstResponder()
      return true
    }
    
    return false
  }
}

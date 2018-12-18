//
//  UITextField.swift
//  FOPS
//
//  Created by Vlad Gachi on 18/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension UITextField {
  static let orderNameTextField: UITextField = {
    let tf              = UITextField()
    tf.borderStyle      = .roundedRect
    tf.returnKeyType    = .done
    tf.clearButtonMode  = .whileEditing
    tf.placeholder      = "Order Name"
    return tf
  }()
  
  static let orderNumberTextField: UITextField = {
    let tf              = UITextField()
    tf.borderStyle      = .roundedRect
    tf.placeholder      = "Order Number"
    tf.keyboardType     = .numbersAndPunctuation
    tf.returnKeyType    = .done
    tf.clearButtonMode  = .whileEditing
    return tf
  }()
  
  static func createTextFieldWith(placeholder: String) -> UITextField {
    let tf              = UITextField()
    tf.borderStyle      = .roundedRect
    tf.returnKeyType    = .done
    tf.clearButtonMode  = .whileEditing
    tf.placeholder      = placeholder
    return tf
  }
}



























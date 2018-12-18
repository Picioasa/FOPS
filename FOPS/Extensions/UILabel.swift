//
//  UILabel.swift
//  FOPS
//
//  Created by Vlad Gachi on 18/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension UILabel {
  static func createLabelWith(text: String, font: UIFont) -> UILabel {
    let label   = UILabel()
    label.font  = font
    label.text  = text
    return label
  }
  
  static func createLabelWith(text: String, color: UIColor) -> UILabel {
    let label        = UILabel()
    label.textColor  = color
    label.text       = text
    return label
  }
}



























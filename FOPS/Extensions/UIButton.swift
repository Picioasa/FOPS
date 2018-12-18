//
//  UIButton.swift
//  FOPS
//
//  Created by Vlad Gachi on 18/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension UIButton {
  static func createButtonWith(title: String, font: UIFont) -> UIButton {
    let btn              = UIButton(type: .system)
    btn.titleLabel?.font = font
    btn.tintColor        = .black
    btn.setTitle(title, for: .normal)
    return btn
  }
  
  static func createButtonWith(title: String, backgroundColor: UIColor) -> UIButton {
    let btn              = UIButton(type: .system)
    btn.backgroundColor  = backgroundColor
    btn.setTitle(title, for: .normal)
    return btn
  }
  
  static func createButtonWith(image: UIImage) -> UIButton {
    let btn = UIButton(type: .system)
    btn.setImage(image, for: .normal)
    return btn
  }
}


























//
//  Extensions.swift
//  FOPS
//
//  Created by Vlad Gachi on 10/03/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension UIView {
  
  func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets, size: CGSize = .zero) {
    
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
    }
    
    if let leading = leading {
      leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
    }
    
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
    }
    
    if let trailing = trailing {
      trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
    }
    
    if size.width != 0 {
      widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }
    
    if size.height != 0 {
      heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
  }
}

extension Date: ExpressibleByStringLiteral {
  public init(stringLiteral value: String) {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-mm"
    if let date = formatter.date(from: value) {
      self = date
    } else {
      self = Date()
    }
  }
}

extension UINavigationController {
  open override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
}

extension UIColor {
  static let darkBlue = UIColor(red: 39/255, green: 37/255, blue: 49/255, alpha: 1.0)
  static let someBlue = UIColor(red: 250/255, green: 24/255, blue: 19/255, alpha: 1.0)
}

















//
//  UIView.swift
//  FOPS
//
//  Created by Vlad Gachi on 15/10/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension UIView {
  
  static let backgroundView: UIView = {
    let view              = UIView()
    view.backgroundColor  = UIColor.init(red: 247/255, green: 247/255, blue: 246/255, alpha: 1.0)
    return view
  }()
  
  static func createViewWith(color: UIColor) -> UIView {
    let view              = UIView()
    view.backgroundColor  = color
    return view
  }
  
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
  
  func fillSuperview(padding: UIEdgeInsets = .zero) {
    translatesAutoresizingMaskIntoConstraints = false
    if let superviewTopAnchor = superview?.topAnchor {
      topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
    }
    
    if let superviewBottomAnchor = superview?.bottomAnchor {
      bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
    }
    
    if let superviewLeadingAnchor = superview?.leadingAnchor {
      leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
    }
    
    if let superviewTrailingAnchor = superview?.trailingAnchor {
      trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
    }
  }
  
  func centerInSuperview(size: CGSize) {
    translatesAutoresizingMaskIntoConstraints = false
    if let superviewCenterXAnchor = superview?.centerXAnchor {
      centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
    }
    
    if let superviewCenterYAnchor = superview?.centerYAnchor {
      centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
    }
    
    widthAnchor.constraint(equalToConstant: size.width).isActive = true
    heightAnchor.constraint(equalToConstant: size.height).isActive = true
  }
}























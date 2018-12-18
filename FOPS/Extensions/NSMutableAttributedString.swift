//
//  NSMutableAttributedString.swift
//  FOPS
//
//  Created by Vlad Gachi on 16/10/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
  
  static func attributedText(_ string: String, weight: UIFont.Weight = UIFont.Weight.light, and
    string2: String = "", weight2: UIFont.Weight = UIFont.Weight.regular) -> NSMutableAttributedString {
    
    let attributedText = NSMutableAttributedString(string: string, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: weight)])
    
    attributedText.append(NSAttributedString(string: string2, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: weight2)]))
    
    return attributedText
  }
  
}



























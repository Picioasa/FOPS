//
//  CustomLabel.swift
//  FOPS
//
//  Created by Vlad Gachi on 23/08/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
  
  // MARK: - Object Lifecycle
  init(string: String = "", font: UIFont = UIFont.systemFont(ofSize: 14), color: UIColor = UIColor.black) {
    super.init(frame: .zero)
    self.attributedText = NSAttributedString(string: string, attributes: [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color])
  }
  
  
  init(lightFontString: String = "", regularFontString: String = "") {
    super.init(frame: .zero)
    self.attributedText = NSAttributedString(string: lightFontString, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .light)])
    
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


























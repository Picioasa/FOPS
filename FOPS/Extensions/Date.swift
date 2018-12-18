//
//  Date.swift
//  FOPS
//
//  Created by Vlad Gachi on 15/10/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import Foundation

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

























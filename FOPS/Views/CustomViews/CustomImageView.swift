//
//  CustomImageView.swift
//  FOPS
//
//  Created by Vlad Gachi on 23/08/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
  
  override init(image: UIImage?) {
    super.init(image: image)
    
    image?.withRenderingMode(.alwaysOriginal)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}


























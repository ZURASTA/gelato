//
//  Waffle.swift
//  gelato
//
//  Created by EvanTsai on 2017/10/18.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

@IBDesignable class Waffle: UIView
{
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
        updateShadow()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 5 : 0
    }
    
    func updateShadow() {
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 3.0
        layer.shadowColor = UIColor.darkGray.cgColor
    }
}


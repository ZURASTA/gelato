//
//  Cupcake.swift
//  A round button used for indicating rating
//  gelato
//
//  Created by EvanTsai on 2017/10/18.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

@IBDesignable class Cupcake: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}

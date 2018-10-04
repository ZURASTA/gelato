//
//  Cheesecake.swift
//  A rectangle button for items on a menu bar
//  gelato
//
//  Created by EvanTsai on 2017/11/5.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit
class Cheesecake: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
        
    }

    func updateCornerRadius() {
        layer.cornerRadius = frame.size.height / 10
    }
}


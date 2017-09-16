//
//  SushiRoll.swift
//  gelato
//
//  Created by EvanTsai on 2017/9/6.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

@IBDesignable class SushiRoll: UIStackView {
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
        
    private func putBiscuits() {
        for _ in 0..<3 {
            // Create the button
            let biscuit = Biscuit()
            biscuit.backgroundColor = UIColor.red

            
//            let view = UIView()
//            view.backgroundColor = UIColor.red
            
            // Add the button to the stack
            addArrangedSubview(biscuit)
            
        }
    }
    
    private func setupView(){
        putBiscuits()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

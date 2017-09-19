//
//  ViewController.swift
//  gelato
//
//  Created by EvanTsai on 2017/9/6.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titleItem: UINavigationItem!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
    
    var rows = 3
    let rowHeight = 290
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /* display current location on title item */
        titleItem.title = "700 Bourke Street"
    }

    override func viewDidAppear(_ animated: Bool) {
        autoAdjustContentHeight(height: CGFloat(rowHeight * rows))
        contentHeightConstraint.constant = CGFloat(rowHeight * rows)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func autoAdjustContentHeight(height: CGFloat){
        contentView.frame = CGRect(x: contentView.frame.origin.x, y: contentView.frame.origin.y, width: contentView.frame.width, height: height)
    }

}


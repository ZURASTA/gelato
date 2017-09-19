//
//  ViewController.swift
//  gelato
//
//  Created by EvanTsai on 2017/9/6.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, SushiProtocol{
    

    @IBOutlet weak var titleItem: UINavigationItem!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentHeightConstraint: NSLayoutConstraint!
    
    var rows = 3
    let rowHeight = 290
    var sushi = [SushiRoll]()
    /* sushiRoll tag is 10, 11, 12 */
    var sushiTag = 10
    
    
    /* User interaction value */
    var rID = 0
    var bID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /* display current location on title item */
        titleItem.title = "700 Bourke Street"
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        autoAdjustContentHeight(height: CGFloat(rowHeight * rows))
        contentHeightConstraint.constant = CGFloat(rowHeight * rows)
        
        /* if view is SushiRoll */
        for case let sushiRoll as SushiRoll in contentView.subviews {
            sushiRoll.sushiDelegate = self
            sushiRoll.tag = sushiTag
            sushiTag += 1
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func autoAdjustContentHeight(height: CGFloat){
        contentView.frame = CGRect(x: contentView.frame.origin.x, y: contentView.frame.origin.y, width: contentView.frame.width, height: height)
    }

    // MARK: - Delegate methods
    
    func didTapBiscuit(sender: Any, bID: Int, rID: Int) {
        self.bID = bID
        self.rID = rID
        performSegue(withIdentifier: "biscuitToRestaurant", sender: sender)
    }
    
    // MARK: - Custom Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "biscuitToRestaurant" {
            if let destinationVC = segue.destination as? RestaurantViewController  {
                destinationVC.biscuitID = bID
                destinationVC.restaurantID = rID
            }
        }
    }
    
    
}


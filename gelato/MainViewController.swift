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
    
    @IBOutlet weak var menuViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    var rows = 3
    let rowHeight = 322
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
        
        /* do not show title on back button on navbar in next VC */
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        /* set up menu items*/
        setupMenuButtons()
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

    // MARK: - Menu Items
    private func setupMenuButtons(){

        /* initailise menu view content */
        let button0 = UIButton(frame: CGRect(x: 10, y: 0, width: 70, height: 50))
        button0.setTitle("Entree", for: .normal)
        button0.setTitleColor(UIColor.black, for: .normal)
        let button1 = UIButton(frame: CGRect(x: 90, y: 0, width: 100, height: 50))
        button1.setTitle("Main Dishes", for: .normal)
        button1.setTitleColor(UIColor.black, for: .normal)
        let button2 = UIButton(frame: CGRect(x: 200, y: 0, width: 50, height: 50))
        button2.setTitle("Sides", for: .normal)
        button2.setTitleColor(UIColor.black, for: .normal)
        let button3 = UIButton(frame: CGRect(x: 260, y: 0, width: 50, height: 50))
        button3.setTitle("Kids", for: .normal)
        button3.setTitleColor(UIColor.black, for: .normal)
        let button4 = UIButton(frame: CGRect(x: 320, y: 0, width: 70, height: 50))
        button4.setTitle("Dessers", for: .normal)
        button4.setTitleColor(UIColor.black, for: .normal)
        let button5 = UIButton(frame: CGRect(x: 400, y: 0, width: 70, height: 50))
        button5.setTitle("Drinks", for: .normal)
        button5.setTitleColor(UIColor.black, for: .normal)
        
        menuView.addSubview(button0)
        menuView.addSubview(button1)
        menuView.addSubview(button2)
        menuView.addSubview(button3)
        menuView.addSubview(button4)
        menuView.addSubview(button5)
        
        /* update the frame of menu view*/
        menuView.frame = CGRect(x: 0, y: 0, width: 480 , height: menuView.frame.height)
        menuViewWidthConstraint.constant = 480
    }
    
    
    // MARK: - Delegate methods
    
    func didTapBiscuit(sender: Any, bID: Int, rID: Int) {
        self.bID = bID
        self.rID = rID
        performSegue(withIdentifier: "biscuitToRestaurant2", sender: sender)
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


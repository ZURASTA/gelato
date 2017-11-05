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
        let button0 = Cheesecake(frame: CGRect(x: 10, y: 0, width: 100, height: 50))
        button0.setTitle("Top Picks", for: .normal)
        button0.setTitleColor(UIColor.black, for: .normal)
        button0.backgroundColor = UIColor.init(red: 255/255.0, green: 138/255.0, blue: 134/255.0, alpha: 1.0)
        let button1 = Cheesecake(frame: CGRect(x: 120, y: 0, width: 120, height: 50))
        button1.setTitle("Most Popular", for: .normal)
        button1.setTitleColor(UIColor.black, for: .normal)
        button1.backgroundColor = UIColor.init(red: 50/255.0, green: 194/255.0, blue: 255/255.0, alpha: 1.0)
        let button2 = Cheesecake(frame: CGRect(x: 250, y: 0, width: 100, height: 50))
        button2.setTitle("Quick Bites", for: .normal)
        button2.setTitleColor(UIColor.black, for: .normal)
        button2.backgroundColor = UIColor.init(red: 1/255.0, green: 242/255.0, blue: 210/255.0, alpha: 1.0)
        let button3 = Cheesecake(frame: CGRect(x: 360, y: 0, width: 100, height: 50))
        button3.setTitle("Healthy", for: .normal)
        button3.setTitleColor(UIColor.black, for: .normal)
        button3.backgroundColor = UIColor.init(red: 250/255.0, green: 232/255.0, blue: 134/255.0, alpha: 1.0)
        
        
        menuView.addSubview(button0)
        menuView.addSubview(button1)
        menuView.addSubview(button2)
        menuView.addSubview(button3)
        
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


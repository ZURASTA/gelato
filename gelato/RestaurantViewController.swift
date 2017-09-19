//
//  RestaurantViewController.swift
//  gelato
//
//  Created by EvanTsai on 2017/9/19.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var restaurantID = 0
    var biscuitID = 0
    
    @IBOutlet weak var brownieTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* do not show empty cells*/
        brownieTable.tableFooterView = UIView(frame: .zero)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Brownie Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = brownieTable.dequeueReusableCell(withIdentifier: "Brownie", for: indexPath) as! Brownie;
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Choose your custom row height
        return 170.0;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  RestaurantViewController2.swift
//  gelato
//
//  Created by EvanTsai on 2017/9/20.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var fudgesView: UICollectionView!
    
    @IBOutlet weak var menuViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupMenuButtons()
        
        let numberOfCell = 2
        let inset = CGFloat(((Int(UIScreen.main.bounds.width) - (172 * numberOfCell)))/3)
        if let layout = fudgesView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 172, height: 215)
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 10, left: inset, bottom: 10, right: inset)
            layout.invalidateLayout()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let fudge = fudgesView.dequeueReusableCell(withReuseIdentifier: "Fudge", for: indexPath) as! Fudge
        
        return fudge
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "restaurantToMeal2", sender: self)
        
    }
    
    private func setupMenuButtons(){
        
        
        /* initailise menu view content */
        let button0 = Cheesecake(frame: CGRect(x: 10, y: 0, width: 70, height: 50))
        button0.setTitle("Entree", for: .normal)
        button0.backgroundColor = UIColor.init(red: 255/255.0, green: 138/255.0, blue: 134/255.0, alpha: 1.0)
        button0.setTitleColor(UIColor.white, for: .normal)
        let button1 = Cheesecake(frame: CGRect(x: 90, y: 0, width: 100, height: 50))
        button1.setTitle("Main Dishes", for: .normal)
        button1.backgroundColor = UIColor.init(red: 50/255.0, green: 194/255.0, blue: 255/255.0, alpha: 1.0)
        button1.setTitleColor(UIColor.white, for: .normal)
        let button2 = Cheesecake(frame: CGRect(x: 200, y: 0, width: 50, height: 50))
        button2.setTitle("Sides", for: .normal)
        button2.backgroundColor = UIColor.init(red: 1/255.0, green: 242/255.0, blue: 210/255.0, alpha: 1.0)
        button2.setTitleColor(UIColor.white, for: .normal)
        let button3 = Cheesecake(frame: CGRect(x: 260, y: 0, width: 50, height: 50))
        button3.setTitle("Kids", for: .normal)
        button3.backgroundColor = UIColor.init(red: 250/255.0, green: 232/255.0, blue: 134/255.0, alpha: 1.0)
        button3.setTitleColor(UIColor.white, for: .normal)
        let button4 = Cheesecake(frame: CGRect(x: 320, y: 0, width: 70, height: 50))
        button4.setTitle("Dessers", for: .normal)
        button4.backgroundColor = UIColor.init(red: 66/255.0, green: 197/255.0, blue: 264/255.0, alpha: 1.0)
        button4.setTitleColor(UIColor.white, for: .normal)
        let button5 = Cheesecake(frame: CGRect(x: 400, y: 0, width: 70, height: 50))
        button5.setTitle("Drinks", for: .normal)
        button5.backgroundColor = UIColor.init(red: 66/255.0, green: 244/255.0, blue: 209/255.0, alpha: 1.0)
        button5.setTitleColor(UIColor.white, for: .normal)
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

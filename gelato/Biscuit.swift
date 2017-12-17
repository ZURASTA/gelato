//
//  CusineCardView.swift
//  gelato
//
//  Created by EvanTsai on 2017/9/6.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit
import RealmSwift

protocol BiscuitProtocol: class {
    // protocol definition goes here
    func didTap(sender: Any, bID: Int, rID: Int)
}

class Biscuit: UIView, BiscuitGesture {

    // MARK: - Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var biscuitID = 0
    var restaurantID = 0
    
    weak var delegate: BiscuitProtocol?
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setImage(image:UIImage, name:String, detail:String, price:String){
        imageView.image = image
        nameLabel.text = name
        detailLabel.text = detail
        priceLabel.text = price
    }
    
    
    // MARK: - IBAction
    
    @IBAction func addBiscuit(_ sender: Any) {
        
    }
    
    @IBAction func tapBiscuit(_ sender: Any) {
        delegate?.didTap(sender: sender, bID: biscuitID, rID:restaurantID)
    }
    
    // MARK: - Private Helper Methods
    
    // Performs the initial setup.
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        
        // Show the view.
        addSubview(view)
        
        setDeepPressAction(target: self, action: #selector(handleDeepPress(value:)))
    }
    
    // Loads a XIB file into a view and returns this view.
    private func viewFromNibForClass() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    @objc private func handleDeepPress(value: BiscuitGestureRecognizer){
        
        if value.state == UIGestureRecognizerState.began
        {
            /* add item to a cart, save to Realm */
            print("deep press begin")
            let realm = try! Realm()
            
            let cartItem = CartItem()
            cartItem.id = Int(arc4random())
            cartItem.name = "Beef Sandwich"
            cartItem.price = 10.2
            try! realm.write {
                realm.add(cartItem)
            }
        }
        else if value.state == UIGestureRecognizerState.ended
        {
            print("deep press ends.")
        }
    }

}

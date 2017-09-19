//
//  CusineCardView.swift
//  gelato
//
//  Created by EvanTsai on 2017/9/6.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

protocol BiscuitProtocol: class {
    // protocol definition goes here
    func didTap(sender: Any, bID: Int, rID: Int)
}

class Biscuit: UIView {

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
    }
    
    // Loads a XIB file into a view and returns this view.
    private func viewFromNibForClass() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

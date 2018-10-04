//
//  Fondant.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/16.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

protocol FondantProtocol: class {
    func didClick()
}

@IBDesignable class Fondant: UIView {
    
    @IBOutlet weak var priceLabel: UILabel!
    
    weak var delegate: FondantProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        
        /* invoke delegate */
        delegate?.didClick()
        
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
    
    
    
}

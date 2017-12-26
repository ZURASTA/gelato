//
//  MealViewModel.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/26.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import Foundation

class MealViewModel {
    
    
    func addMeal() {
        
        let cartItem = CartItem()
        cartItem.id = Int(arc4random())
        cartItem.name = "Beef Sandwich"
        cartItem.price = 10.2
        RealmManager.sharedInstance.addCartItem(item: cartItem)
        
        
    }
    
    
    
}

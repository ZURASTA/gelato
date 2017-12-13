//
//  CartItem.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/9.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import Foundation
import RealmSwift
import Differentiator
class CartItem: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var price: Float = 0
    @objc dynamic var item: Dish?
}

extension CartItem : IdentifiableType {
    typealias Identity = Int
    
    var identity: Int {
        return id
    }
}

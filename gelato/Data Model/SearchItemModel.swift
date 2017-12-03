//
//  SearchItemModel.swift
//  gelato
//
//  Created by EvanTsai on 2017/11/30.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import Foundation
import RealmSwift

class Dish: Object {
    @objc dynamic var name: String = "dummy burger"
    @objc dynamic var price: Float = 0.0
}

class Restaurant: Object {
    @objc dynamic var name: String = "dummy restaurant"
    @objc dynamic var rate: Float = 0.0
}

class Ingrediant: Object {
    @objc dynamic var name: String = "dummy chicken"
}

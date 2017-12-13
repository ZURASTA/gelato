//
//  Dish.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/3.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import Foundation
import RealmSwift
class Dish: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var price: Float = 0
}


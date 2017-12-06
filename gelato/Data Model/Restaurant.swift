//
//  Restaurant.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/3.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import Foundation
import RealmSwift
class Restaurant: Object {
    @objc dynamic var name: String = "dummy restaurant"
    @objc dynamic var rate: Float = 0.0
}

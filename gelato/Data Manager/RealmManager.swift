//
//  RealmManager.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/26.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import Foundation
import RealmSwift
class RealmManager {
    
    static let sharedInstance = RealmManager()
    
    var realm: Realm
    
    init(){
        realm = try! Realm()
    }
    
    final func addCartItem(item: CartItem){
        try! realm.write {
            realm.add(item)
        }
    }
    
    
    
}

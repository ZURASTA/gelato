//
//  MainViewModel.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/16.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import Foundation
import RxSwift
import RxRealm
import RealmSwift
class MainViewModel {
    
    var cart = Variable<[CartItem]>([])
    
    let disposeBag = DisposeBag()
    
    init() {
        /* read from Realm */
        let realm = try! Realm()
        Observable.array(from: realm.objects(CartItem.self))
            .subscribe(onNext: { [unowned self] items in
            self.cart.value = items
        }).disposed(by: disposeBag)
    }
    
    func addItem(item: CartItem) -> Void {
        
    }
    
}

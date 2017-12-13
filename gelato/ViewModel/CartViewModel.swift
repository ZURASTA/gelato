//
//  CartViewModel.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/9.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import RealmSwift
import RxRealm

struct CartSectionModel {
    var header: String
    var items: [Item]
}

extension CartSectionModel: AnimatableSectionModelType{
    typealias Item = CartItem
    typealias Identity = String
    
    var identity: String {
        return header
    }
    
    init(original: CartSectionModel, items: [Item]) {
        self = original
        self.items = items
    }
}

class CartViewModel: NSObject {
    
    let disposeBag = DisposeBag()
    var sections = Variable<[CartSectionModel]>([])
    
    override init(){
        super.init()
        
        let realm = try! Realm()
        
        let cartItems = realm.objects(CartItem.self)
        
        self.sections.value = [.init(header: "Shopping List", items: cartItems.toArray())]
        
//        Observable.array(from: cartItems)
//            .map {[unowned self] array in
//                self.sections.value = [.init(header: "Shopping List", items: array)]
//            }
//            .subscribe()
//            .disposed(by: disposeBag)
        
//        sections.asObservable()
//            .subscribe(onNext: { text in
//                print("\(text)")
//            })
//            .disposed(by: disposeBag)
        
        
    }
}

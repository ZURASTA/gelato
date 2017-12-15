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
    var deletedItemID: PublishSubject<Int> = PublishSubject<Int>()
    
    override init(){
        super.init()
        
        let realm = try! Realm()
        
        let cartItems = realm.objects(CartItem.self)
    
        var cartArray: [CartItem] = []
        
        /*
         deep copy,
         otherwise RLMException:
         Object has been deleted or invalidated.
         */
        cartItems.forEach { c in
            let item = CartItem()
            item.id = c.id
            item.name = c.name
            cartArray.append(item)
        }
        
        self.sections.value = [.init(header: "Shopping List", items: cartArray)]
        
        deletedItemID.asObservable()
            .subscribe(onNext: { [unowned self] itemID in
                /* query object by id */
                let items = realm.objects(CartItem.self).filter("id = \(itemID)")
                /* delete from realm */
                Observable.collection(from: items)
                    .subscribe(Realm.rx.delete())
                    .disposed(by: self.disposeBag)
            })
            .disposed(by: disposeBag)
        
    }
}

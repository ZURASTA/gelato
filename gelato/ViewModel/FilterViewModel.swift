//
//  FilterViewModel.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/4.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import Foundation
import RxSwift
import RxRealm
import RealmSwift
import RxDataSources

enum MultipleSectionModel {
    case DishSection(title: String, items: [SectionItem])
    case IngrediantSection(title: String, items: [SectionItem])
    case RestaurantSection(title: String, items: [SectionItem])
}

enum SectionItem {
    case DishSectionItem(dish: Dish)
    case IngrediantSectionItem(ingrediant: Ingrediant)
    case RestaurantSectionItem(restaurant: Restaurant)
}

extension MultipleSectionModel: SectionModelType {
    typealias Item = SectionItem
    
    var items: [SectionItem] {
        switch self {
        case .DishSection(title: _, items: let items):
            return items.map {$0}
        case .IngrediantSection(title: _, items: let items):
            return items.map {$0}
        case .RestaurantSection(title: _, items: let items):
            return items.map {$0}
        }
    }
    
    init(original: MultipleSectionModel, items: [Item]) {
        switch original {
        case let .DishSection(title: title, items: _):
            self = .DishSection(title: title, items: items)
        case let .IngrediantSection(title, _):
            self = .IngrediantSection(title: title, items: items)
        case let .RestaurantSection(title, _):
            self = .RestaurantSection(title: title, items: items)
        }
    }
}

extension MultipleSectionModel {
    var title: String {
        switch self {
        case .DishSection(title: let title, items: _):
            return title
        case .IngrediantSection(title: let title, items: _):
            return title
        case .RestaurantSection(title: let title, items: _):
            return title
        }
    }
}

class FilterViewModel: NSObject {
    
    var sections: [MultipleSectionModel]?
    
    let disposeBag = DisposeBag()

    override init(){
        super.init()
        
        let realm = try! Realm()
        let ingrediants = realm.objects(Ingrediant.self)
        let restaurants = realm.objects(Restaurant.self)
        let dishes = realm.objects(Dish.self)
        
        var ingrediantItems = [SectionItem]();
        var restaurantItems = [SectionItem]();
        var dishItems = [SectionItem]();
        
        for ingrediant in ingrediants {
            ingrediantItems.append(SectionItem.IngrediantSectionItem(ingrediant: ingrediant))
        }
        for restaurant in restaurants {
            restaurantItems.append(SectionItem.RestaurantSectionItem(restaurant: restaurant))
        }
        for dish in dishes {
            dishItems.append(SectionItem.DishSectionItem(dish: dish))
        }
        
        sections = [
            .DishSection(title: "Dish",
                         items: dishItems),
            .IngrediantSection(title: "Ingrediant",
                               items: ingrediantItems),
            .RestaurantSection(title: "Restaurant",
                               items: restaurantItems)
        ]
        
    }
}

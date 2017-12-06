//
//  SearchViewController.swift
//  gelato
//
//  Created by EvanTsai on 2017/9/19.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class FilterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    
    var shouldShowSearchResults:Bool = false
    
    var dataArray1 = [String]()
    var filteredArray1 = [String]()
    
    var dataArray2 = [String]()
    var filteredArray2 = [String]()
    
    var dataArray3 = [String]()
    var filteredArray3 = [String]()
    
    var sectionArray = ["Dishes", "Restaurants", "Ingrediants"]
    
    let disposeBag = DisposeBag()
    
    let filterViewModel = FilterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        let dataSource = FilterViewController.dataSource()
        
        if let sections = filterViewModel.sections {
            Observable.just(sections)
                .bind(to: tableView.rx.items(dataSource: dataSource))
                .disposed(by: disposeBag)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FilterViewController {
    static func dataSource() -> RxTableViewSectionedReloadDataSource<MultipleSectionModel> {
        return RxTableViewSectionedReloadDataSource<MultipleSectionModel>(
            configureCell: { (dataSource, table, idxPath, _) in
                switch dataSource[idxPath] {
                case let .DishSectionItem(dish):
                    let cell:FilterDishTableViewCell = table.dequeueReusableCell(withIdentifier: "FilterDishTableViewCell", for:idxPath) as! FilterDishTableViewCell
                    cell.textLabel?.text = dish.name
                    
                    return cell
                case let .IngrediantSectionItem(ingrediant):
                    let cell: FilterIngrediantTableViewCell = table.dequeueReusableCell(withIdentifier: "FilterIngrediantTableViewCell", for:idxPath) as! FilterIngrediantTableViewCell
                    cell.textLabel?.text = ingrediant.name
                    
                    return cell
                case let .RestaurantSectionItem(restaurant):
                    let cell: FilterRestaurantTableViewCell = table.dequeueReusableCell(withIdentifier: "FilterRestaurantTableViewCell", for:idxPath) as! FilterRestaurantTableViewCell
                    cell.textLabel?.text = restaurant.name
                    
                    return cell
                }
        },
            titleForHeaderInSection: { dataSource, index in
                let section = dataSource[index]
                return section.title
        }
        )
    }
}



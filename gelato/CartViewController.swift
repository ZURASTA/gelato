//
//  CartViewController.swift
//  gelato
//
//  Created by EvanTsai on 2017/12/10.
//  Copyright © 2017年 Zurasta. All rights reserved.
//
import Foundation
import UIKit
import RxDataSources
import RxSwift
import RealmSwift
class CartViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cartViewModel = CartViewModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: .zero)

        let dataSource = CartViewController.dataSource()
        
        cartViewModel.sections
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx.itemDeleted
            .subscribe(onNext: { [unowned self] indexPath in
                let section = self.cartViewModel.sections.value[indexPath.section]
                var items = section.items
                let item = items[indexPath.row]
                self.cartViewModel.deletedItemID.onNext(item.id)
                items.remove(at:indexPath.row)
                self.cartViewModel.sections.value = [.init(original:section, items: items)]
            })
            .disposed(by: disposeBag)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CartViewController {
    static func dataSource() -> RxTableViewSectionedAnimatedDataSource<CartSectionModel> {
        return RxTableViewSectionedAnimatedDataSource<CartSectionModel>(
            animationConfiguration: AnimationConfiguration(insertAnimation: .top,
                                                           reloadAnimation: .fade,
                                                           deleteAnimation: .left),
            configureCell: { (dataSource, table, idxPath, item) in
                let cell = table.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: idxPath)
                cell.textLabel?.text = "\(item.name)"
                return cell
            },
            titleForHeaderInSection: { dataSource, index in
                let section = dataSource[index]
                return section.header
            },
            canEditRowAtIndexPath: { _, _ in
                return true
            },
            canMoveRowAtIndexPath: { _, _ in
                return true
            }
        )
    }
}

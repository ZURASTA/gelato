//
//  SearchViewController.swift
//  gelato
//
//  Created by EvanTsai on 2017/9/19.
//  Copyright © 2017年 Zurasta. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dataArray1 = loadListOfData(name: "dishes")!
        dataArray2 = loadListOfData(name: "restaurants")!
        dataArray3 = loadListOfData(name: "ingrediants")!
        
        configureSearchController()
        
        tableView.tableFooterView = UIView(frame: .zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadListOfData(name:String) -> [String]?{
        // Specify the path to the countries list file.
        let pathURL = Bundle.main.url(forResource: name, withExtension: "txt")
        if let url = pathURL {
            // Load the file contents as a string.
            do {
                let countriesString =  try String.init(contentsOf: url, encoding: String.Encoding.utf8)
                // Append the countries from the string to the dataArray array by breaking them using the line change character.
                return countriesString.components(separatedBy: "\n")
                // Reload the tableview.
//                tableView.reloadData()
            }
            catch {
                print("Error")
            }
        }
        return nil
    }
    
    // MARK: - Search Controller
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
            navigationItem.titleView = searchController?.searchBar
        }
        
    }

    // MARK: - Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var array = [String]()
        
        var dataArray = [String]()
        
        switch section {
        case 0:
            array = filteredArray1
            dataArray = dataArray1
        case 1:
            array = filteredArray2
            dataArray = dataArray2
        case 2:
            array = filteredArray3
            dataArray = dataArray3
        default:
            ()
        }
        
        if shouldShowSearchResults {
            return array.count
        }
        else {
            return dataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        
        var array = [String]()
        
        var dataArray = [String]()
        
        switch indexPath.section {
        case 0:
            array = filteredArray1
            dataArray = dataArray1
        case 1:
            array = filteredArray2
            dataArray = dataArray2
        case 2:
            array = filteredArray3
            dataArray = dataArray3
        default:
            ()
        }
        
        if shouldShowSearchResults {
            cell.textLabel?.text = array[indexPath.row]
        }
        else {
            cell.textLabel?.text = dataArray[indexPath.row]
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else {
            return
        }
        
        // Filter the data array and get only those countries that match the search text.
        filteredArray1 = dataArray1.filter({ (country) -> Bool in
            let countryText = country as NSString
            
            return countryText.contains(searchString)
        })
        
        filteredArray2 = dataArray2.filter({ (country) -> Bool in
            let countryText = country as NSString
            
            return countryText.contains(searchString)
        })
        
        filteredArray3 = dataArray3.filter({ (country) -> Bool in
            let countryText = country as NSString
            
            return countryText.contains(searchString)
        })
        
        // Reload the tableview.
        tableView.reloadData()
        
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tableView.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tableView.reloadData()
        }
        searchController.searchBar.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  HomeViewController.swift
//  ShopAndChop_Final
//
//  Created by Nyckolle Grace T. Lucuab on 8/13/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var CategoryTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryTableView.dataSource = self
        CategoryTableView.register(CategoryCell.self, forCellReuseIdentifier: "cellid")
    
    }
    
    var categoryNameArray = ["Beverages",
                      "Bakery",
                      "Canned Goods",
                      "Dairy",
                      "Dry Goods",
                      "Frozen Foods",
                      "Meat",
                      "Produce",
                      "Cleaning Products",
                      "Paper Products",
                      "Personal Care",
                      "Other"]
    

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CategoryTableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let categoryName = categoryNameArray[indexPath.row]
        cell.textLabel?.text = categoryName
        // how to write out logic that will let me add to imageArray dynamically via an add button in the VC?
        return cell
    }
    
    
}

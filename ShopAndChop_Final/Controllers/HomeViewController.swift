//
//  HomeViewController.swift
//  ShopAndChop_Final
//
//  Created by Nyckolle Grace T. Lucuab on 8/13/21.
//

import UIKit

class HomeViewController: UITableViewController {
//    var categoryList = [CategoryForView]()
    
    
    @IBOutlet var CategoryTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryTableView.dataSource = self
        CategoryTableView.register(CategoryCell.self, forCellReuseIdentifier: "cellid")
    
    }
    
    var selectedCategory: String = ""
    
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
    
       
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.selectedCategory = categoryNameArray[indexPath.row]
    self.performSegue(withIdentifier: "ToItemListVC", sender: self)
    print(indexPath)
    }
}

extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryNameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CategoryTableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let categoryName = categoryNameArray[indexPath.row]
        
        
        
        guard let categoryCell = cell as? CategoryCell else {
            return cell
        }
        categoryCell.nameLabel.text = categoryName
        categoryCell.imageIV.image = UIImage(named: categoryNameArray[indexPath.row])
        
        // how to write out logic that will let me add to imageArray dynamically via an add button in the VC?
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let itemListViewController = segue.destination as! ItemListVC
        itemListViewController.receivedData = self.selectedCategory
        
        
        // reset selectedCategory after useage
//            ItemListVC.receivedData = categoryNameArray[indexPath.row]
    }
//    self.selectedCategory = ""
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let category = self.categoryNameArray[indexPath.row]
//        let categoryItemListVC = CategoryItemListVC()
////        CategoryItemListVC.category = category
//        // Connect CategoryItemListVC when category tapped?
//        self.present(categoryItemListVC, animated: true)
//    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
}

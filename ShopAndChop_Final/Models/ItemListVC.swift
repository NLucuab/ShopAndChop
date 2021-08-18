//
//  ItemListVC.swift
//  ShopAndChop_Final
//
//  Created by Nyckolle Grace T. Lucuab on 8/15/21.

import UIKit
import Firebase
import FirebaseFirestore


class ItemListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ itemTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
//
    func tableView(_ itemTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ itemTableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        items.remove(at: indexPath.row)
        itemTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
    
    
        
    
    var receivedData:String = ""
    
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
    
    
    var items = [String]()
    

    @IBOutlet weak var CategoryLabel: UILabel!
        

    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var itemTableView: UITableView!
    
    
    
//    self.itemTableView
    
    
    
    @IBAction func addItem(_ sender: Any) {
           let alert = UIAlertController(title: "New Item", message: "Please enter an item.", preferredStyle: .alert)
           
           alert.addTextField { field in
               field.placeholder = "Enter item..."
           }
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           alert.addAction(UIAlertAction(title: "Done", style: .default) { [](_) in
               if let field = alert.textFields?.first {
                   if let text = field.text, !text.isEmpty {
                       self.items.append(text)
                       self.itemTableView.reloadData()
                       let db = Firestore.firestore()
                       
                       db.collection("CategoryItems").addDocument(data: ["name": text]) {
                           (error) in
                           if error != nil {
                               self.showError("Error saving user data")
                           }
                       }
                   }

               }
       })
           present(alert, animated: true)
       }
    
    
    func showError(_ message: String) {
        print(message)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryLabel?.text = receivedData
        CategoryLabel.font = UIFont(name: "BebasNeue", size: 30)
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        title = "Items"
    //            view.addSubview(table)
        itemTableView.delegate = self
        itemTableView.dataSource = self
            
    }
    }
    
    
    
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
            
        
//    func didTapAdd()
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.leadingAnchor.constraint(equalTo: CategoryLabel.leadingAnchor).isActive = true
//        table.centerYAnchor.constraint(equalTo: CategoryLabel.centerYAnchor).isActive = true
//        table.trailingAnchor.constraint(equalTo: CategoryLabel.trailingAnchor).isActive = true
//        table.topAnchor.constraint(equalTo: CategoryLabel.bottomAnchor).isActive = true
//        table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 700).isActive = true
        

    

//        set constraints for table view
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        // add delete and edit functionality!
//
//        // path and delete routes to firebase!

//
//  ShoppingListViewController.swift
//  ShopAndChop_Final
//
//  Created by Nyckolle Grace T. Lucuab on 8/10/21.
//

import UIKit
import Firebase


class ShoppingListViewController: UIViewController, UITableViewDataSource {
    
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var items = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        title = "Shopping List"
        view.addSubview(table)
        table.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        
        }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Please enter a new shopping list item!", preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Enter item..."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default) { [](_) in
            if let field = alert.textFields?.first {
                // new stuff might delete?
                if let text = field.text, !text.isEmpty {
                    // Enter new shopping list item
                    guard let text = alert.textFields?.first?.text else { return }
                    self.items.append(text)
                    self.table.reloadData()
                    let db = Firestore.firestore()
                    
                    db.collection("groceryItems").addDocument(data: ["item" : text]) {
                        (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                    
                    
//                    DispatchQueue.main.async {
//                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
//                        currentItems.append(text)
//                        UserDefaults.standard.setValue(currentItems, forKey: "items")
//                        self.items.append(text)
//                        self.table.reloadData()
//                    }
                    
                }
            }
            
        })
        
        present(alert, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
//            self.items.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//        return [deleteAction]
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
        guard editingStyle == .delete else { return }
        items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    
    func showError(_ message: String) {
        print(message)
    }
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            tableView.beginUpdates()
//            items.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.endUpdates()
//        }
//    }

    
    
    






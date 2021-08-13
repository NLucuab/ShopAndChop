////
////  ListViewController.swift
////  ShopAndChop_Final
////
////  Created by Nyckolle Grace T. Lucuab on 8/12/21.
//
//
//import UIKit
//
//
//struct Category {
//    var title = "Name";
//    var items = [String]()
////
////    mutating func addItem(item: String){
////        items.append(item)
//
//    }
//}
//
////  private let data: [Category] = [title: itemCategory, items: categoryItemList]
////  var itemCategory: String
//// var categoryItemList: []
//
//// after populating the category dictionaries, append to data
//
//class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categories.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//    }
//
//
//    private let tableView: UITableView = {
//        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
//
//    var categories = [Category]()
//
//
//
//    func addItem(item: String) {
//        categories.append(Category())
//    }
//
//
//    @objc private func didTapAdd() {
//        let alert = UIAlertController(title: "New Item", message: "Please enter a new shopping list item!", preferredStyle: .alert)
//
//        alert.addTextField { field in
//            field.placeholder = "Enter item..."
//        }
//
//        alert.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: nil))
//
//        alert.addAction(UIAlertAction(title: "Done", style: .default) { [](_) in
//            if let field = alert.textFields?.first {
//                if let text = field.text,!text.isEmpty {
//                    guard let text = alert.textFields?.first?.text else {return}
//
//
//
//                }
//            }
//
//        })
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//    }
//}
//
//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
//
//
//

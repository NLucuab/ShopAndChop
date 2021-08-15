//
//  ItemListVC.swift
//  ShopAndChop_Final
//
//  Created by Nyckolle Grace T. Lucuab on 8/15/21.
//

import UIKit

class ItemListVC: UIViewController {
        // Setup TableView and TableViewCells for items for each category
    //    var category: CategoryForView?
        
        
        @IBOutlet weak var CategoryLabel: UILabel!
        
        var receivedData = ""
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            CategoryLabel.text = receivedData
            
            view.backgroundColor = .green
        }
        
    }

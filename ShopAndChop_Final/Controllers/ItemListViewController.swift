//
//  ItemListViewController.swift
//  ShopAndChop_Final
//
//  Created by Nyckolle Grace T. Lucuab on 8/13/21.
//

import UIKit

class ItemListViewController: UIViewController {

    
    
    @IBOutlet weak var CategoryLabel: UILabel!
    
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryLabel.text = name
                                                                                    

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

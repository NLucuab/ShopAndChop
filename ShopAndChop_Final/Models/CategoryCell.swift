//
//  CategoryCell.swift
//  ShopAndChop_Final
//
//  Created by Nyckolle Grace T. Lucuab on 8/15/21.
//

import UIKit

class CategoryCell: UITableViewCell {
    var safeArea: UILayoutGuide!
    let imageIV = UIImageView()
    let nameLabel = UILabel()
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        safeArea = layoutMarginsGuide
        setupImageView()
        setupNameLabel()
    
    }
    
    func setupImageView() {
        addSubview(imageIV)
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        imageIV.image = UIImage(named: categoryNameArray[indexPath.row])<< this doesn't work 
        
        
    }
    func setupNameLabel() {
        addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        nameLabel.font = UIFont(name: "BebasNeue", size: 30)
        nameLabel.backgroundColor = .clear
        
    }
    
}

//
//  CartTableViewCell.swift
//  CarFinder
//
//  Created by Юрий Чекалюк on 20.04.2021.
//

import UIKit




class CartTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var nameYearLabel: UILabel!
    @IBOutlet weak var carColorLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    
    
    
    
    
    func cellSetup() {
        
        nameYearLabel.text = "1111"
        carColorLabel.text = "1111"
    }
    
    
}

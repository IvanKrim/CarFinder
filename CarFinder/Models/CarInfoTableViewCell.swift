//
//  CarInfoTableViewCell.swift
//  CarFinder
//
//  Created by Кирилл Нескоромный on 18.04.2021.
//

import UIKit

class CarInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameYearLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
